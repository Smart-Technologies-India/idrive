import 'dart:developer';

import 'package:carpage/views/courseSelection/step4.dart';
import 'package:carpage/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Step3 extends HookWidget {
  final String course;
  final String carName;
  final String nofoninday;
  final String timerange;
  final String vehicle;

  const Step3({
    Key? key,
    required this.course,
    required this.carName,
    required this.nofoninday,
    required this.timerange,
    required this.vehicle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLoading = useState(true);

    ValueNotifier<List> courseData = useState([]);

    String getCourseId() {
      switch (course) {
        case "beginner":
          {
            return "1";
          }
        case "advance":
          {
            return "2";
          }
        case "expert":
          {
            return "3";
          }

        case "refresh":
          {
            return "4";
          }
        default:
          {
            return "1";
          }
      }
    }

    Future<dynamic> getGroup() async {
      try {
        return await ApiHandler().post(
          {
            'f': 'findCarModels',
            'id': "1",
            'type': vehicle,
            'model': carName,
            "courseId": getCourseId(),
            "slot": nofoninday,
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
      log(res.toString());
      if (res["status"]) {
        courseData.value = res["data"];
      }
      isLoading.value = false;
    }

    useEffect(() {
      initList();
      return () {};
    }, []);

    Color themcol = const Color(0xff8B5CF6);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themcol,
        title: const Text("Select car"),
        // actions: const [
        //   Center(
        //       child: Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Text(
        //       "Step 3/4",
        //       textScaleFactor: 1,
        //       style: TextStyle(
        //           fontSize: 16,
        //           fontWeight: FontWeight.w500,
        //           color: Colors.white),
        //     ),
        //   ))
        // ],
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            if (isLoading.value) ...[
              const Center(
                child: Padding(
                    padding: EdgeInsets.all(20),
                    child: CircularProgressIndicator()),
              )
            ] else ...[
              if (courseData.value.isEmpty) ...[
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "No car matches your selection",
                      textScaleFactor: 1,
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ],
              for (int i = 0; i < courseData.value.length; i++) ...[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.2), blurRadius: 10),
                    ],
                    color: Colors.white,
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 8),
                                  child: Text(
                                    "${courseData.value[i]["makeModel"]} - [${courseData.value[i]["variant"]}]",
                                    textScaleFactor: 1,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    (courseData.value[i]["acNonAc"] ==
                                            1.toString())
                                        ? "\u2022 AC"
                                        : "\u2022 Non-Ac",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.75)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    (courseData.value[i]["dualControl"] ==
                                            1.toString())
                                        ? "\u2022 Dual control"
                                        : "\u2022 Non-Dual Control",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.75)),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                    (courseData.value[i]["transmission"] ==
                                            1.toString())
                                        ? "\u2022 Automatic"
                                        : "\u2022 Manual",
                                    textScaleFactor: 1,
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black.withOpacity(0.75)),
                                  ),
                                ),

                                const SizedBox(
                                  height: 10,
                                ),
                                //star year
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(horizontal: 8),
                                  child: Row(
                                    children: [
                                      Text(
                                        "Year: ${courseData.value[i]["year"]}",
                                        textScaleFactor: 1,
                                        style: TextStyle(
                                            color:
                                                Colors.black.withOpacity(0.7),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color:
                                                Colors.amber.withOpacity(0.15)),
                                        child: Row(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  courseData.value[i]["rating"],
                                                  textScaleFactor: 1,
                                                  style: const TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                const Icon(
                                                  Icons.star,
                                                  size: 18,
                                                  color: Colors.amber,
                                                )
                                              ],
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )),
                            if (courseData.value[i]["picUrl"] == "" ||
                                courseData.value[i]["picUrl"] == null) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assest/images/car11.png",
                                  height: 100,
                                  width: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ] else ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  courseData.value[i]["picUrl"],
                                  height: 100,
                                  width: 140,
                                  fit: BoxFit.cover,
                                ),
                              )
                            ],
                          ]),
                      const Divider(
                        height: 5,
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        // margin: const EdgeInsets.symmetric(
                        //     horizontal: 20, vertical: 10),
                        child: Row(
                          children: [
                            Text(
                              "Starts from: \u{20B9}${courseData.value[i]["minFee"]}",
                              textScaleFactor: 1,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            const Spacer(),
                            // ElevatedButton(
                            //   style: ElevatedButton.styleFrom(
                            //     backgroundColor: const Color(0xff10b981),
                            //   ),
                            //   onPressed: () {
                            //     showDialog(
                            //       context: context,
                            //       builder: (context) => AlertDialog(
                            //         contentPadding: const EdgeInsets.all(10),
                            //         titlePadding: const EdgeInsets.all(10),
                            //         title: const Center(
                            //           child: Text("More Info"),
                            //         ),
                            //         content: Column(
                            //           mainAxisSize: MainAxisSize.min,
                            //           children: [
                            //             Text(
                            //               courseData.value[i]["crsDsc"]
                            //                   .toString()
                            //                   .replaceAll("// ", "\n"),
                            //               textScaleFactor: 1,
                            //               style: const TextStyle(
                            //                   fontSize: 18,
                            //                   color: Colors.black),
                            //             ),
                            //             Center(
                            //               child: ElevatedButton(
                            //                 style: ElevatedButton.styleFrom(
                            //                   backgroundColor:
                            //                       const Color(0xff06b6d4),
                            //                 ),
                            //                 child: const Text("OK"),
                            //                 onPressed: () {
                            //                   Navigator.pop(context);
                            //                 },
                            //               ),
                            //             )
                            //           ],
                            //         ),
                            //       ),
                            //     );
                            //   },
                            //   child: const Text("Info"),
                            // ),
                            const Spacer(),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: themcol,
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Step4(
                                      id: courseData.value[i]["id"].toString(),
                                      agentId: courseData.value[i]["agentId"]
                                          .toString(),
                                      type: nofoninday.toString(),
                                      slot: timerange.toString(),
                                      course: getCourseId(),
                                    ),
                                  ),
                                );
                              },
                              child: const Text("Continue"),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ],
          ],
        ),
      )),
    );
  }
}
