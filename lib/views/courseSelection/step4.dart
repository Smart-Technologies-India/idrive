import 'dart:developer';

import 'package:carpage/views/courseSelection/step5.dart';
import 'package:carpage/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Step4 extends HookWidget {
  final String id;
  final String type;
  final String slot;
  final String course;
  final String agentId;
  const Step4({
    Key? key,
    required this.id,
    required this.type,
    required this.slot,
    required this.course,
    required this.agentId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ValueNotifier<bool> isLoading = useState(true);

    ValueNotifier<List> courseData = useState([]);

    // ValueNotifier<int> currentSelected = useState(0);
    ValueNotifier<int> totalLen = useState(0);

    Future<dynamic> getGroup() async {
      try {
        return await ApiHandler().post(
          {
            "f": "findVehicleSlot",
            "id": id,
            "slot": slot,
            "type": type,
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
    }, []);

    String formateDate(String value) {
      return "${value.split("-")[2]}-${value.split("-")[1]}-${value.split("-")[0]}";
    }

    Color themcol = const Color(0xff8B5CF6);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: themcol,
        title: const Text("Select Day"),
      ),
      body: (isLoading.value)
          ? const Center(
              child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator()),
            )
          : (courseData.value.isEmpty)
              ? const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      "No car matches your selection",
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
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        color: Colors.indigoAccent,
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: const Text(
                          "Select your Day and Time",
                          textAlign: TextAlign.center,
                          textScaleFactor: 1,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: DataTable(
                            showCheckboxColumn: false,
                            showBottomBorder: true,
                            columnSpacing: 18,
                            horizontalMargin: 15,
                            headingRowColor: MaterialStateColor.resolveWith(
                                (states) => Colors.indigoAccent),
                            // Datatable widget that have the property columns and rows.
                            columns: const [
                              DataColumn(
                                label: Text(
                                  'From Time',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                              DataColumn(
                                label: Text('To Time',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              DataColumn(
                                label: Text('Available from',
                                    style: TextStyle(color: Colors.white)),
                              ),
                              DataColumn(
                                label: Text('Action',
                                    style: TextStyle(color: Colors.white)),
                              ),
                            ],
                            rows: [
                              for (int i = 0;
                                  i < courseData.value.length;
                                  i++) ...[
                                DataRow(
                                    onSelectChanged: (bool? selected) {
                                      log("this is a click");
                                    },
                                    color: MaterialStateColor.resolveWith(
                                      (states) => ((i % 2) == 0)
                                          ? const Color(0xffeeeeee)
                                          : const Color(0xffffffff),
                                    ),
                                    cells: [
                                      DataCell(Text(TimeOfDay(
                                              hour: int.parse(courseData
                                                  .value[i]["fromTime"]
                                                  .toString()
                                                  .split(":")[0]),
                                              minute: int.parse(courseData
                                                  .value[i]["fromTime"]
                                                  .toString()
                                                  .split(":")[1]))
                                          .format(context)
                                          .toString())),
                                      DataCell(Text(TimeOfDay(
                                              hour: int.parse(courseData
                                                  .value[i]["toTime"]
                                                  .toString()
                                                  .split(":")[0]),
                                              minute: int.parse(courseData
                                                  .value[i]["toTime"]
                                                  .toString()
                                                  .split(":")[1]))
                                          .format(context)
                                          .toString())),
                                      DataCell(Text(formateDate(courseData
                                          .value[i]["latest_toDate"]))),
                                      DataCell(ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.indigoAccent),
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) => Step5(
                                                      courseId: course,
                                                      vehicleId: id,
                                                      fromTime: courseData
                                                          .value[i]["fromTime"],
                                                      toTime: courseData
                                                          .value[i]["toTime"],
                                                      date: courseData.value[i]
                                                          ["latest_toDate"],
                                                      agentId: agentId,
                                                    ))),
                                          );
                                        },
                                        child: const Text("Select"),
                                      ))
                                    ]),
                              ],
                            ]),
                      ),
                    ],
                  ),
                ),
    );
  }
}
