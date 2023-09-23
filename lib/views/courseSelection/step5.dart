import 'dart:convert';

import 'package:carpage/views/courseSelection/buy.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../../loadingMessage.dart';
import '../../service/service.dart';
// import '../../utils/app_colors.dart';
// import '../Splash.dart';
// import '../buyRTOServicePage.dart';

class SchedulePageFive extends StatefulWidget {
  final String agentId;
  final String courseId;
  final String vehicleId;
  final String fromDateTime;
  @override
  _SchedulePageFiveState createState() => _SchedulePageFiveState();
  const SchedulePageFive({
    Key? key,
    required this.agentId,
    required this.courseId,
    required this.vehicleId,
    required this.fromDateTime,
  }) : super(key: key);
}

class _SchedulePageFiveState extends State<SchedulePageFive> {
  bool isLoading = true;
  List<dynamic> slotList = [];
  String errMsg = '';
  SharedPreferences? prefs;
  String addressId = '-1';
  String userId = '-1';
  String agentId = '-1';
  String serviceId = '-1';
  String vehicleId = '-1';
  String courseId = '-1';
  dynamic decodedAddress = {};
  dynamic login = {};

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    isLoading = false;
    slotList = [];
    errMsg = '';
    prefs = await SharedPreferences.getInstance();
    decodedAddress = {
      'cityName': '',
      'areaName': '',
      'address': '',
      'howtoreach': '',
      'Id': '',
      'userId': ''
    };
    var loginS = (prefs!.getString('login'));
    if (loginS == null ||
        loginS.runtimeType == Null ||
        loginS.toString().trim().isEmpty) {
    } else {
      login = (jsonDecode(loginS));
      userId = login['Id'].toString();
    }
    var address = prefs!.getString('address');
    if (address == null || address.runtimeType == Null) {
    } else {
      decodedAddress = (jsonDecode(address));
    }
    agentId = ((widget.agentId.runtimeType == Null ||
            widget.agentId.isEmpty ||
            widget.agentId.toString().trim().isEmpty ||
            num.tryParse(widget.agentId.toString().trim()).runtimeType == Null)
        ? ("-1")
        : (num.parse(widget.agentId.toString().trim()).toString()));
    courseId = ((widget.courseId.runtimeType == Null ||
            widget.courseId.isEmpty ||
            widget.courseId.toString().trim().isEmpty ||
            num.tryParse(widget.courseId.toString().trim()).runtimeType == Null)
        ? ("-1")
        : (num.parse(widget.courseId.toString().trim()).toString()));
    vehicleId = ((widget.vehicleId.runtimeType == Null ||
            widget.vehicleId.isEmpty ||
            widget.vehicleId.toString().trim().isEmpty ||
            num.tryParse(widget.vehicleId.toString().trim()).runtimeType ==
                Null)
        ? ("-1")
        : (num.parse(widget.vehicleId.toString().trim()).toString()));
    await refreshPage();
  }

  Future<void> refreshPage() async {
    setState(() {
      isLoading = true;
    });
    dynamic httpRes = await getCourseVehicleSlot();
    if (httpRes['status'] == true) {
      slotList = httpRes['data'];
    } else {
      errMsg = httpRes['message'].toString();
    }
    setState(() {
      isLoading = false;
    });
  }

  getCourseVehicleSlot() async {
    setState(() {
      errMsg = '';
      isLoading = true;
      slotList = [];
    });
    return await ApiHandler().post(
      {
        'f': 'findCourseVehicleSlot',
        'courseId': courseId.trim(),
        'vehicleId': vehicleId.trim(),
        'fromDateTime': widget.fromDateTime,
      },
    );
  }

  Future<void> submitConfirm() async {
    setState(() {
      isLoading = true;
    });
    dynamic httpRes = await pushSchedule();
    // print(httpRes);
    if (httpRes['status'] == true) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BuyRTOService(
            agentId: agentId.toString(),
            courseId: courseId,
            serviceId: serviceId.toString(),
            vehicleId: vehicleId,
          ),
        ),
      ).then((value) => initialize());
    } else {
      errMsg = httpRes['message'].toString();
    }
    setState(() {
      isLoading = false;
    });
  }

  pushSchedule() async {
    setState(() {
      errMsg = '';
      isLoading = true;
      slotList = [];
    });
    return await ApiHandler().post(
      {
        'f': 'pushSchedule',
        'userId': userId.trim(),
        'courseId': courseId.trim(),
        'vehicleId': vehicleId.trim(),
        'fromDateTime': widget.fromDateTime,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        // leading: IconButton(
        //   icon: const Icon(
        //     Icons.arrow_back_outlined,
        //   ),
        //   onPressed: () {
        //     if (Navigator.canPop(context) == true) {
        //       Navigator.of(context).pop();
        //     } else {
        //       Navigator.pushAndRemoveUntil(
        //         context,
        //         MaterialPageRoute(
        //           builder: (context) => Splash(),
        //         ),
        //         (route) => false,
        //       );
        //     }
        //   },
        // ),
        title: const Text(
          'Final Submit',
          style: TextStyle(
            color: Colors.green,
          ),
        ),
      ),
      body: SafeArea(
        child: isLoading
            ? const Center(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: CircularProgressIndicator(),
                ),
              )
            : slotList.isEmpty
                ? Center(
                    child: Padding(
                    padding: const EdgeInsets.all(
                      10.0,
                    ),
                    child: Text(
                      errMsg,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                      ),
                      maxLines: 9,
                      textAlign: TextAlign.center,
                    ),
                  ))
                : ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    children: [
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const ListTile(
                              tileColor: Colors.yellowAccent,
                              title: Text(
                                'Theory Schedule',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: slotList.length,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                slotList[index]['chptrType'] = ((slotList[index]
                                                ['chptrType'] ==
                                            null ||
                                        slotList[index]['chptrType']
                                                .runtimeType ==
                                            Null ||
                                        slotList[index]['chptrType']
                                            .toString()
                                            .trim()
                                            .isEmpty ||
                                        num.tryParse(slotList[index]
                                                        ['chptrType']
                                                    .toString()
                                                    .trim())
                                                .runtimeType ==
                                            Null ||
                                        num.parse(slotList[index]['chptrType']
                                                .toString()
                                                .trim()) <=
                                            0)
                                    ? ("0")
                                    : (slotList[index]['chptrType']
                                        .toString()
                                        .trim()));
                                if (num.parse(slotList[index]['chptrType']
                                        .toString()
                                        .trim()) ==
                                    1) {
                                  return Card(
                                    elevation: 3,
                                    margin: const EdgeInsets.all(9.0),
                                    child: ListTile(
                                      leading: Text(
                                        ("Day\n${slotList[index]['dayNo']}"),
                                        maxLines: 9,
                                        textAlign: TextAlign.justify,
                                      ),
                                      title: Text(
                                        ("Theory Chapter No.${slotList[index]['chptrSerial']}"),
                                        maxLines: 9,
                                        textAlign: TextAlign.justify,
                                      ),
                                      trailing: const Icon(
                                        Icons.computer_outlined,
                                        color: Color(
                                          0xFF673AB7,
                                        ),
                                      ),
                                      subtitle: Text(
                                        ("Date : ${DateFormat('EEE, dd / MM / yyyy').format(DateTime.parse(widget.fromDateTime.toString()).add(Duration(days: (int.parse(slotList[index]['dayNo'].toString()) - 1))))}\nDuration : ${slotList[index]['durationMin']} Min(s)\nDescription : ${slotList[index]['description']}"),
                                        maxLines: 19,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            const ListTile(
                              tileColor: Colors.yellowAccent,
                              title: Text(
                                'Practical Schedule',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: slotList.length,
                              physics: const ClampingScrollPhysics(),
                              itemBuilder: (context, index) {
                                slotList[index]['chptrType'] = ((slotList[index]
                                                ['chptrType'] ==
                                            null ||
                                        slotList[index]['chptrType']
                                                .runtimeType ==
                                            Null ||
                                        slotList[index]['chptrType']
                                            .toString()
                                            .trim()
                                            .isEmpty ||
                                        num.tryParse(slotList[index]
                                                        ['chptrType']
                                                    .toString()
                                                    .trim())
                                                .runtimeType ==
                                            Null ||
                                        num.parse(slotList[index]['chptrType']
                                                .toString()
                                                .trim()) <=
                                            0)
                                    ? ("0")
                                    : (slotList[index]['chptrType']
                                        .toString()
                                        .trim()));
                                if (num.parse(slotList[index]['chptrType']
                                        .toString()
                                        .trim()) ==
                                    0) {
                                  return Card(
                                    elevation: 3,
                                    margin: const EdgeInsets.all(9.0),
                                    child: ListTile(
                                      leading: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            ("Day\n${slotList[index]['dayNo']}"),
                                            maxLines: 9,
                                            textAlign: TextAlign.justify,
                                          ),
                                          Icon(
                                            Icons.verified_user_outlined,
                                            color: Colors.green[700],
                                          ),
                                        ],
                                      ),
                                      title: Text(
                                        ("Practical Chapter No.${slotList[index]['chptrSerial']}"),
                                        maxLines: 9,
                                        textAlign: TextAlign.justify,
                                      ),
                                      subtitle: Text(
                                        ("Available Slot :\nDate : ${DateFormat('EEE, dd / MM / yyyy').format(DateTime.parse(slotList[index]['fromPeriod'].toString()))}\nFrom : ${DateFormat('hh:mm aa').format(DateTime.parse(slotList[index]['fromPeriod'].toString()))}\nTo : ${DateFormat('hh:mm aa').format(DateTime.parse(slotList[index]['toPeriod'].toString()))}\nDuration : ${slotList[index]['durationMin']} Min(s)\nDescription : ${slotList[index]['description']}"),
                                        maxLines: 19,
                                        textAlign: TextAlign.justify,
                                      ),
                                    ),
                                  );
                                } else {
                                  return const SizedBox.shrink();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 199,
                      ),
                    ],
                  ),
      ),
      bottomSheet: isLoading
          ? const SizedBox.shrink()
          : slotList.isEmpty
              ? const SizedBox.shrink()
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    ElevatedButton(
                      child: const Text(
                        'S U B M I T',
                      ),
                      onPressed: () {
                        submitConfirm();
                      },
                    ),
                  ],
                ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
