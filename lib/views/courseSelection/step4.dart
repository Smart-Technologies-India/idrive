
import 'package:carpage/views/courseSelection/step5.dart';
import 'package:carpage/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Step4 extends HookWidget {
  final int type;
  final String ageId;
  final String curId;
  final String vehId;
  const Step4(
      {Key? key,
      required this.type,
      required this.ageId,
      required this.curId,
      required this.vehId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ValueNotifier<int?> selectedDay = useState<int?>(null);

    // ValueNotifier<List> days = useState<List>([
    //   {
    //     "time": "08:00 AM - 09:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "09:00 AM - 10:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "10:00 AM - 11:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "11:00 AM - 12:00 PM",
    //   },
    //   {
    //     "time": "12:00 PM - 01:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "01:00 PM - 02:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "02:00 PM - 03:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "03:00 PM - 04:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "04:00 PM - 05:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "05:00 PM - 06:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "06:00 PM - 07:00 PM",
    //   },
    //   {
    //     "time": "07:00 PM - 08:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "08:00 PM - 09:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "09:00 PM - 10:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "10:00 PM - 11:00 PM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "11:00 PM - 12:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "12:00 AM - 01:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "01:00 AM - 02:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "02:00 AM - 03:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "03:00 AM - 04:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    //   {
    //     "time": "04:00 AM - 05:00 AM",
    //     "extra": "+ Rs. 50 Extra",
    //   },
    // ]);

    // void showNext() {
    //   showData.value = [];
    //   showData.value = [
    //     {
    //       "time": "12:00 AM - 01:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "01:00 AM - 02:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "02:00 AM - 03:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "03:00 AM - 04:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "04:00 AM - 05:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "12:00 AM - 01:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "01:00 AM - 02:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "02:00 AM - 03:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //   ];
    // }

    // void showPrevious() {
    //   showData.value = [
    //     {
    //       "time": "12:00 AM - 01:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "01:00 AM - 02:00 AM",
    //     },
    //     {
    //       "time": "02:00 AM - 03:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "03:00 AM - 04:00 AM",
    //       "extra": "+ Rs. 50 Extra",
    //     },
    //     {
    //       "time": "04:00 AM - 05:00 AM",
    //     },
    //   ];
    // }

    ValueNotifier<bool> isLoading = useState(true);

    ValueNotifier<List> courseData = useState([]);

    ValueNotifier<int> currentSelected = useState(0);
    ValueNotifier<int> totalLen = useState(0);

    Future<dynamic> getGroup() async {
      try {
        return await ApiHandler().post(
          {
            'f': 'generateScheduleStartPoints',
            "agentId": ageId,
            "courseId": curId,
            "vehicleId": vehId
          },
        );
      } catch (custErrExcptn) {
        return {
          'status': false,
          'message': custErrExcptn.toString(),
        };
      }
    }

    void initList() async {
      dynamic res = await getGroup();

      // log(res["data"].toString());

      if (res["status"]) {
        courseData.value = res["data"];
      }
      totalLen.value = res["data"].length;

      isLoading.value = false;
    }

    // ValueNotifier<List> showData = useState([]);
    // initList() {
    //   showData.value = days.value;
    // }

    useEffect(() {
      initList();
      return () {};
    }, [currentSelected.value]);

    Color themcol = const Color(0xff8B5CF6);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themcol,
        title: const Text("Select Day"),
        // actions: [
        //   Center(
        //       child: Padding(
        //     padding: const EdgeInsets.all(8.0),
        //     child: Text(
        //       (type == 1) ? "Step 4/4" : "Step 2/2",
        //       textScaleFactor: 1,
        //       style: const TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w500,
        //           color: Colors.white),
        //     ),
        //   )),
        // ],
      ),
      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //   decoration: BoxDecoration(color: Colors.white, boxShadow: [
      //     BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 10)
      //   ]),
      //   child: ElevatedButton(
      //     style: ElevatedButton.styleFrom(primary: themcol),
      //     onPressed: () {
      //       if (selectedDay.value == null) {
      //         ScaffoldMessenger.of(context).showSnackBar(
      //           const SnackBar(
      //             backgroundColor: Color(0xfff43f5e),
      //             content: Text(
      //               "Please Select Any One Time",
      //               textScaleFactor: 1,
      //               style: TextStyle(
      //                   fontSize: 16,
      //                   color: Colors.white,
      //                   fontWeight: FontWeight.w500),
      //             ),
      //           ),
      //         );
      //       } else {
      //         showDialog(
      //           barrierDismissible: false,
      //           context: context,
      //           builder: (context) => AlertDialog(
      //             content: Text(
      //               "Your order has been generated successfully",
      //               textScaleFactor: 1,
      //               style: TextStyle(
      //                 color: Colors.black.withOpacity(0.85),
      //                 fontSize: 18,
      //                 fontWeight: FontWeight.w500,
      //               ),
      //             ),
      //             actions: [
      //               ElevatedButton(
      //                   onPressed: () {
      //                     Navigator.pushAndRemoveUntil(
      //                         context,
      //                         MaterialPageRoute(
      //                             builder: (context) => const HomeScreen()),
      //                         (route) => false);
      //                   },
      //                   child: const Text("Ok"))
      //             ],
      //           ),
      //         );
      //       }
      //     },
      //     child: const Text("Continue"),
      //   ),
      // ),
      body: (isLoading.value)
          ? const Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator()),
            )
          : (courseData.value.isEmpty)
              ? const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "No Data",
                      textScaleFactor: 1,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                )
              : Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 8),
                    ],
                  ),
                  margin: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          // IconButton(
                          //   onPressed: () {
                          //     // showPrevious();
                          //     if (currentSelected.value > 0) {
                          //       currentSelected.value =
                          //           currentSelected.value - 1;
                          //     }
                          //   },
                          //   icon: const Icon(
                          //     Icons.arrow_circle_left_outlined,
                          //     size: 35,
                          //   ),
                          // ),
                          const Spacer(),
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // const Text(
                              //   "Today",
                              //   textScaleFactor: 1,
                              //   style: TextStyle(
                              //       fontSize: 18,
                              //       fontWeight: FontWeight.w500,
                              //       color: Colors.black),
                              // ),
                              Text(
                                "${courseData.value[currentSelected.value][0]["date"]}",
                                textScaleFactor: 1,
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black.withOpacity(0.75)),
                              ),
                            ],
                          ),
                          const Spacer(),
                          // IconButton(
                          //   onPressed: () {
                          //     log("next");
                          //     log(totalLen.value.toString());
                          //     log(currentSelected.value.toString());
                          //     if (totalLen.value > currentSelected.value) {
                          //       currentSelected.value =
                          //           currentSelected.value + 1;
                          //     }
                          //   },
                          //   icon: const Icon(
                          //     Icons.arrow_circle_right_outlined,
                          //     size: 35,
                          //   ),
                          // ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(children: [
                            for (int i = 0;
                                i <
                                    courseData
                                        .value[currentSelected.value].length;
                                i++) ...[
                              GestureDetector(
                                onTap: () {
                                  // selectedDay.value = i;
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: ((context) => SchedulePageFive(
                                            agentId: courseData.value[
                                                    currentSelected.value][i]
                                                ["agentId"],
                                            courseId: courseData.value[
                                                    currentSelected.value][i]
                                                ["courseId"],
                                            vehicleId: courseData.value[
                                                    currentSelected.value][i]
                                                ["vehicleId"],
                                            fromDateTime: courseData.value[
                                                    currentSelected.value][i]
                                                ["fromDateTime"],
                                          )),
                                    ),
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    // color: (selectedDay.value == i)
                                    //     ? const Color(0xffF3E8FF)
                                    //     : Colors.white,
                                    color: Colors.white,
                                    border: Border.symmetric(
                                      horizontal: BorderSide(
                                          color: Colors.black.withOpacity(0.2),
                                          width: 0.5),
                                    ),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  child: Row(
                                    children: [
                                      // if (selectedDay.value == i) ...[
                                      //   Icon(
                                      //     Icons.check,
                                      //     color: themcol,
                                      //   ),
                                      //   const SizedBox(
                                      //     width: 5,
                                      //   )
                                      // ],
                                      Text(
                                        "${TimeOfDay(hour: int.parse(courseData.value[currentSelected.value][i]["fromTime"].toString().split(":")[0]), minute: int.parse(courseData.value[currentSelected.value][i]["fromTime"].toString().split(":")[1])).format(context).toString()} - ${TimeOfDay(hour: int.parse(courseData.value[currentSelected.value][i]["toTime"].toString().split(":")[0]), minute: int.parse(courseData.value[currentSelected.value][i]["toTime"].toString().split(":")[1])).format(context).toString()}",
                                        textScaleFactor: 1,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      // Text(
                                      //   "${courseData.value[currentSelected.value][i]["fromTime"]} - ${courseData.value[currentSelected.value][i]["toTime"]} ",
                                      //   // .toString(),
                                      //   textScaleFactor: 1,
                                      //   style: const TextStyle(
                                      //       fontSize: 16,
                                      //       color: Colors.black,
                                      //       fontWeight: FontWeight.w500),
                                      // ),
                                      // if (showData.value[i]["extra"] != null) ...[
                                      //   const Spacer(),
                                      //   Container(
                                      //     padding: const EdgeInsets.all(2),
                                      //     decoration: BoxDecoration(
                                      //         color: Colors.white,
                                      //         borderRadius: BorderRadius.circular(5)),
                                      //     child: Text(
                                      //       showData.value[i]["extra"],
                                      //       textScaleFactor: 1,
                                      //       style: const TextStyle(
                                      //           fontSize: 14,
                                      //           color: Colors.green,
                                      //           fontWeight: FontWeight.w400),
                                      //     ),
                                      //   ),
                                      // ]
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ]),
                        ),
                      )
                    ],
                  ),
                ),
    );
  }
}
