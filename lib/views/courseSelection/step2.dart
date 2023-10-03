import 'package:carpage/views/courseSelection/setp3.dart';
import 'package:carpage/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Step2 extends HookWidget {
  final String course;
  final String vehicle;
  final String nofoninday;
  final String timerange;
  const Step2({
    Key? key,
    required this.course,
    required this.vehicle,
    required this.nofoninday,
    required this.timerange,
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
            'f': 'findCarGroup',
            'id': "1", // user address id
            'type': vehicle, // vehicle type hatch back, sedan
            'slot': nofoninday, // 0 = 30 min 1 = 60 min
            'courseId': getCourseId(), // advance expert
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
        title: const Text("Select Group"),
        // actions: const [
        //   Center(
        //       child: Padding(
        //     padding: EdgeInsets.all(8.0),
        //     child: Text(
        //       "Step 2/4",
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
                    )),
                  )
                ],
                for (int i = 0; i < courseData.value.length; i++) ...[
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10),
                        ],
                        color: Colors.white),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                                child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 8, left: 8),
                                  child: Text(
                                    courseData.value[i]["makeModel"],
                                    textScaleFactor: 1,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10, top: 10),
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
                                        width: 10,
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
                                ),

                                const SizedBox(
                                  height: 10,
                                ),
                                //star year
                              ],
                            )),
                            if (courseData.value[i]["picUrl"] == "" ||
                                courseData.value[i]["picUrl"] == null) ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "assest/images/car11.png",
                                  height: 80,
                                  width: 150,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topLeft,
                                ),
                              )
                            ] else ...[
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  courseData.value[i]["picUrl"],
                                  height: 80,
                                  width: 150,
                                  fit: BoxFit.cover,
                                  alignment: Alignment.topLeft,
                                ),
                              ),
                            ],
                          ],
                        ),
                        //bottom
                        const Divider(
                          height: 5,
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Text(
                                "Starts from: \u{20B9}${courseData.value[i]["minFee"]}",
                                textScaleFactor: 1,
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const Spacer(),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: themcol,
                                ),
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Step3(
                                        course: course.toString().toLowerCase(),
                                        carName: courseData.value[i]
                                                ["makeModel"]
                                            .toString()
                                            .toLowerCase(),
                                        nofoninday: nofoninday,
                                        timerange: timerange,
                                        vehicle: vehicle,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text("Select this car"),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }
}
