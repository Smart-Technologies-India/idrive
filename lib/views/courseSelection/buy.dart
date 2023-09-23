import 'dart:convert';

import 'package:carpage/views/courseSelection/checkout.dart';
import 'package:carpage/views/home/homescreen.dart';
import 'package:carpage/service/service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:idrive/widgets/custom_divider_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import '../loadingMessage.dart';
// import '../service/service.dart';
// import '../utils/app_colors.dart';
// import 'Splash.dart';
// import 'cart/checkout.dart';

class BuyRTOService extends StatefulWidget {
  final String agentId;
  final String serviceId;
  final String courseId;
  final String vehicleId;
  const BuyRTOService({
    Key? key,
    required this.agentId,
    required this.serviceId,
    required this.courseId,
    required this.vehicleId,
  }) : super(key: key);
  @override
  _BuyRTOServiceState createState() => _BuyRTOServiceState();
}

class _BuyRTOServiceState extends State<BuyRTOService> {
  bool isLoading = true;
  TextEditingController userName = TextEditingController();
  TextEditingController userContact = TextEditingController();
  TextEditingController userAddress = TextEditingController();
  TextEditingController agent = TextEditingController();
  TextEditingController service = TextEditingController();
  TextEditingController totalAmount = TextEditingController();
  TextEditingController totalAmountD = TextEditingController();
  double selectedAddonServiceId = -1;
  String maxiDriveComm = "0.0";
  String maxGovtFee = "0.0";
  String maxLateFee = "0.0";
  String maxCounterFee = "0.0";
  String taxPer = "0.0";
  String maxFees = "0.0";
  String taxAmount = "0.0";
  String serviceTaxAmount = "0.0";
  String serviceGovtFee = "0.0";
  String serviceLateFee = "0.0";
  String serviceiDriveComm = "0.0";
  String serviceCounterFee = "0.0";
  String serviceTaxPer = "0.0";
  String serviceBaseFeeMrp = "0.0";
  SharedPreferences? prefs;
  String addressId = '-1';
  String userId = '-1';
  String agentId = '-1';
  String serviceId = '-1';
  String courseId = '-1';
  String vehicleId = '-1';
  List<dynamic> serviceList = [];
  dynamic decodedAddress = {};
  dynamic login = {};

  @override
  void initState() {
    super.initState();
    getServiceTypeWiseServiceList();
  }

  Future<dynamic> getServiceTypeWiseServiceList() async {
    setState(() {
      isLoading = true;
    });
    try {
      agentId = ((widget.agentId.runtimeType == Null ||
              widget.agentId.isEmpty ||
              widget.agentId.toString().trim().isEmpty ||
              num.tryParse(widget.agentId.toString().trim()).runtimeType ==
                  Null)
          ? ("-1")
          : (num.parse(widget.agentId.toString().trim()).toString()));
      serviceId = ((widget.serviceId.runtimeType == Null ||
              widget.serviceId.isEmpty ||
              widget.serviceId.toString().trim().isEmpty ||
              num.tryParse(widget.serviceId.toString().trim()).runtimeType ==
                  Null)
          ? ("-1")
          : (num.parse(widget.serviceId.toString().trim()).toString()));
      courseId = ((widget.courseId.runtimeType == Null ||
              widget.courseId.isEmpty ||
              widget.courseId.toString().trim().isEmpty ||
              num.tryParse(widget.courseId.toString().trim()).runtimeType ==
                  Null)
          ? ("-1")
          : (num.parse(widget.courseId.toString().trim()).toString()));
      vehicleId = ((widget.vehicleId.runtimeType == Null ||
              widget.vehicleId.isEmpty ||
              widget.vehicleId.toString().trim().isEmpty ||
              num.tryParse(widget.vehicleId.toString().trim()).runtimeType ==
                  Null)
          ? ("-1")
          : (num.parse(widget.vehicleId.toString().trim()).toString()));
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
        userName.text = login['username'];
        userContact.text = login['contact'];
        userId = login['Id'].toString();
      }
      var address = prefs!.getString('address');
      if (address == null || address.runtimeType == Null) {
      } else {
        decodedAddress = (jsonDecode(address));
      }
      var inputBody = {
        'f': 'findAgentService',
        'agentId': (agentId.toString()),
        'serviceId': (serviceId.toString()),
        'courseId': (courseId.toString()),
        'vehicleId': (vehicleId.toString()),
      };
      // print(jsonEncode(inputBody));
      var resHttp = await ApiHandler().post(inputBody);
      if (resHttp['status']) {
        serviceList = resHttp['data'][0]['serviceList'];
        if (serviceList.runtimeType == Null || serviceList.isEmpty) {
          serviceList = [];
        }
        for (var index = 0; index < serviceList.length; index++) {
          serviceList[index]['govtFee'] =
              ((serviceList[index]['govtFee'] == null ||
                      serviceList[index]['govtFee'].runtimeType == Null ||
                      serviceList[index]['govtFee'].toString().trim().isEmpty ||
                      serviceList[index]['govtFee']
                              .toString()
                              .trim()
                              .toLowerCase() ==
                          "null" ||
                      double.tryParse(serviceList[index]['govtFee'].toString())
                              .runtimeType ==
                          Null)
                  ? ("0")
                  : (serviceList[index]['govtFee'].toString().trim()));
          serviceList[index]
              ['iDriveComm'] = ((serviceList[index]['iDriveComm'] == null ||
                  serviceList[index]['iDriveComm'].runtimeType == Null ||
                  serviceList[index]['iDriveComm'].toString().trim().isEmpty ||
                  serviceList[index]['iDriveComm']
                          .toString()
                          .trim()
                          .toLowerCase() ==
                      "null" ||
                  double.tryParse(serviceList[index]['iDriveComm'].toString())
                          .runtimeType ==
                      Null)
              ? ("0")
              : (serviceList[index]['iDriveComm'].toString().trim()));
          serviceList[index]['lateFee'] =
              ((serviceList[index]['lateFee'] == null ||
                      serviceList[index]['lateFee'].runtimeType == Null ||
                      serviceList[index]['lateFee'].toString().trim().isEmpty ||
                      serviceList[index]['lateFee']
                              .toString()
                              .trim()
                              .toLowerCase() ==
                          "null" ||
                      double.tryParse(serviceList[index]['lateFee'].toString())
                              .runtimeType ==
                          Null)
                  ? ("0")
                  : (serviceList[index]['lateFee'].toString().trim()));
          serviceList[index]
              ['counterFee'] = ((serviceList[index]['counterFee'] == null ||
                  serviceList[index]['counterFee'].runtimeType == Null ||
                  serviceList[index]['counterFee'].toString().trim().isEmpty ||
                  serviceList[index]['counterFee']
                          .toString()
                          .trim()
                          .toLowerCase() ==
                      "null" ||
                  double.tryParse(serviceList[index]['lateFee'].toString())
                          .runtimeType ==
                      Null)
              ? ("0")
              : (serviceList[index]['counterFee'].toString().trim()));
          serviceList[index]
              ['taxPer'] = ((serviceList[index]['taxPer'] == null ||
                  serviceList[index]['taxPer'].runtimeType == Null ||
                  serviceList[index]['taxPer'].toString().trim().isEmpty ||
                  serviceList[index]['taxPer']
                          .toString()
                          .trim()
                          .toLowerCase() ==
                      "null" ||
                  double.parse(serviceList[index]['taxPer'].toString()) <= 0)
              ? ("0")
              : (serviceList[index]['taxPer'].toString().trim()));
          serviceList[index]
              ['baseFeeMrp'] = ((serviceList[index]['baseFeeMrp'] == null ||
                  serviceList[index]['baseFeeMrp'].runtimeType == Null ||
                  serviceList[index]['baseFeeMrp'].toString().trim().isEmpty ||
                  serviceList[index]['baseFeeMrp']
                          .toString()
                          .trim()
                          .toLowerCase() ==
                      "null" ||
                  double.parse(serviceList[index]['baseFeeMrp'].toString()) <=
                      0)
              ? ("0")
              : (serviceList[index]['baseFeeMrp'].toString().trim()));
        }
        agent.text = resHttp['data'][0]['agentName'].toString();
        maxGovtFee = ((resHttp['data'][0]['maxGovtFees'] == null ||
                resHttp['data'][0]['maxGovtFees'].runtimeType == Null ||
                resHttp['data'][0]['maxGovtFees'].toString().trim().isEmpty ||
                resHttp['data'][0]['maxGovtFees']
                        .toString()
                        .trim()
                        .toLowerCase() ==
                    "null" ||
                double.parse(resHttp['data'][0]['maxGovtFees'].toString()) <= 0)
            ? ("0")
            : (resHttp['data'][0]['maxGovtFees'].toString().trim()));
        maxLateFee = ((resHttp['data'][0]['maxLateFees'] == null ||
                resHttp['data'][0]['maxLateFees'].runtimeType == Null ||
                resHttp['data'][0]['maxLateFees'].toString().trim().isEmpty ||
                resHttp['data'][0]['maxLateFees']
                        .toString()
                        .trim()
                        .toLowerCase() ==
                    "null" ||
                double.parse(resHttp['data'][0]['maxLateFees'].toString()) <= 0)
            ? ("0")
            : (resHttp['data'][0]['maxLateFees'].toString().trim()));
        maxCounterFee = ((resHttp['data'][0]['maxCounterFees'] == null ||
                resHttp['data'][0]['maxCounterFees'].runtimeType == Null ||
                resHttp['data'][0]['maxCounterFees']
                    .toString()
                    .trim()
                    .isEmpty ||
                resHttp['data'][0]['maxCounterFees']
                        .toString()
                        .trim()
                        .toLowerCase() ==
                    "null" ||
                double.parse(resHttp['data'][0]['maxCounterFees'].toString()) <=
                    0)
            ? ("0")
            : (resHttp['data'][0]['maxCounterFees'].toString().trim()));
        maxiDriveComm = ((resHttp['data'][0]['maxiDriveComm'] == null ||
                resHttp['data'][0]['maxiDriveComm'].runtimeType == Null ||
                resHttp['data'][0]['maxiDriveComm'].toString().trim().isEmpty ||
                resHttp['data'][0]['maxiDriveComm']
                        .toString()
                        .trim()
                        .toLowerCase() ==
                    "null" ||
                double.parse(resHttp['data'][0]['maxiDriveComm'].toString()) <=
                    0)
            ? ("0")
            : (resHttp['data'][0]['maxiDriveComm'].toString().trim()));
        // taxPer = ((resHttp['data'][0]['taxPer'] == null || resHttp['data'][0]['taxPer'].runtimeType == Null || resHttp['data'][0]['taxPer'].toString().trim().length <= 0 || resHttp['data'][0]['taxPer'].toString().trim().toLowerCase() == "null" || double.parse(resHttp['data'][0]['taxPer'].toString()) <= 0) ? ("0") : (resHttp['data'][0]['taxPer'].toString().trim()));
        taxPer = ((resHttp['data'][0]['maxTaxPer'] == null ||
                resHttp['data'][0]['maxTaxPer'].runtimeType == Null ||
                resHttp['data'][0]['maxTaxPer'].toString().trim().isEmpty ||
                resHttp['data'][0]['maxTaxPer']
                        .toString()
                        .trim()
                        .toLowerCase() ==
                    "null" ||
                double.parse(resHttp['data'][0]['maxTaxPer'].toString()) <= 0)
            ? ("0")
            : (resHttp['data'][0]['maxTaxPer'].toString().trim()));
        maxFees = ((resHttp['data'][0]['maxFees'] == null ||
                resHttp['data'][0]['maxFees'].runtimeType == Null ||
                resHttp['data'][0]['maxFees'].toString().trim().isEmpty ||
                resHttp['data'][0]['maxFees'].toString().trim().toLowerCase() ==
                    "null" ||
                double.parse(resHttp['data'][0]['maxFees'].toString()) <= 0)
            ? ("0")
            : (resHttp['data'][0]['maxFees'].toString().trim()));
        taxAmount = ((double.parse(maxGovtFee).ceilToDouble() +
                    double.parse(maxLateFee).ceilToDouble() +
                    double.parse(maxiDriveComm).ceilToDouble() +
                    double.parse(maxCounterFee).ceilToDouble() +
                    double.parse(maxFees).ceilToDouble()) *
                double.parse(taxPer) /
                100)
            .toStringAsFixed(1);
        totalAmount.text = (double.parse(maxGovtFee).ceilToDouble() +
                double.parse(maxLateFee).ceilToDouble() +
                double.parse(maxiDriveComm).ceilToDouble() +
                double.parse(maxCounterFee).ceilToDouble() +
                double.parse(maxFees).ceilToDouble() +
                double.parse(taxAmount.toString()).ceilToDouble())
            .toStringAsFixed(1);
        totalAmountD.text = ("₹${totalAmount.text}");
        userAddress.text =
            ("${decodedAddress['address']}, ${decodedAddress['address']}, ${decodedAddress['areaName']}, ${decodedAddress['cityName']}");
        service.text = resHttp['data'][0]['serviceName'].toString();
      } else {
        agent.text = 'ERROR';
        totalAmount.text = 'ERROR';
        service.text = 'ERROR';
      }
      setState(() {
        isLoading = false;
      });
      return resHttp;
    } catch (custErrExcptn) {
      print(custErrExcptn);
      setState(() {
        isLoading = false;
      });
      return {
        'status': false,
        'message': custErrExcptn.toString(),
      };
    }
  }

  createOrder() async {
    var razorNotes = {
      "addressId": addressId.toString(),
      "userId": (login['Id'].toString()),
      "userName": (login['username'].toString()),
      "userMob": (login['contact'].toString()),
      "agentId": (agentId.toString()),
      "agentName": (agent.text.toString()),
      "serviceName": (service.text.toString()),
      "totAmount":
          (((double.parse(totalAmount.text.toString().trim())).ceilToDouble())
              .toStringAsFixed(0)),
    };
    var razorPay = {
      "amount":
          (((double.parse(totalAmount.text.toString().trim())).ceilToDouble() *
                  100)
              .toStringAsFixed(0)),
      "currency": "INR",
      "receipt":
          ("RCPT_${userId}_${agentId}_${serviceId}_${courseId}_${((double.parse(totalAmount.text.toString().trim())).ceilToDouble()).toStringAsFixed(0)}"),
      "payment_capture": 1,
      "notes": razorNotes,
    };
    var inBdy = {
      'f': 'createOrder',
      'userId': userId.trim(),
      'agentId': agentId.trim(),
      'serviceId': serviceId.toString().trim(),
      'courseId': courseId.trim(),
      'vehicleId': vehicleId.trim(),
      'addressId': addressId.trim(),
      'baseFee': ((selectedAddonServiceId > 0)
          ? (double.parse(maxFees) + double.parse(serviceBaseFeeMrp))
              .toStringAsFixed(1)
          : double.parse(maxFees).toStringAsFixed(1)),
      'counterFee': ((selectedAddonServiceId > 0)
          ? (double.parse(maxCounterFee) + double.parse(serviceCounterFee))
              .toStringAsFixed(1)
          : double.parse(maxCounterFee).toStringAsFixed(1)),
      'lateFee': ((selectedAddonServiceId > 0)
          ? (double.parse(maxLateFee) + double.parse(serviceLateFee))
              .toStringAsFixed(1)
          : double.parse(maxLateFee).toStringAsFixed(1)),
      'govtFee': ((selectedAddonServiceId > 0)
          ? (double.parse(maxGovtFee) + double.parse(serviceGovtFee))
              .toStringAsFixed(1)
          : double.parse(maxGovtFee).toStringAsFixed(1)),
      'taxes': ((selectedAddonServiceId > 0)
          ? (double.parse(taxAmount) + double.parse(serviceTaxAmount))
              .toStringAsFixed(1)
          : double.parse(taxAmount).toStringAsFixed(1)),
      'discount': '0.0',
      'walletUsed': '0.0',
      'status': 'CREATED',
      'razor': (jsonEncode(razorPay)),
    };
    var resHttp = await ApiHandler().post(inBdy);
    if (resHttp['status']) {
      await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => CheckoutScreen(
            razorNotes: razorNotes,
            razorOrderId: (resHttp['data']['id']),
            serviceName: (service.text.toString()),
            userEmail: (login['email'].toString()),
            userMob: (login['contact'].toString()),
            userName: (login['username'].toString()),
            agentName: (agent.text.toString()),
            orderId: (resHttp['data']['idriveOrderId'].toString()),
            userId: userId.toString(),
            totalFinalAmount: totalAmount.text,
            userFullAddress: userAddress.text,
          ),
        ),
      );
    } else {
      Fluttertoast.showToast(
        msg: resHttp['message'],
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color(0xFFED2224),
        textColor: Colors.white,
        fontSize: 12.0,
      );
      setState(() {
        isLoading = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        // leading: IconButton(
        //   icon: Icon(
        //     Icons.arrow_back_outlined,
        //     color: appColor,
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
          'Checkout',
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
            : ListView(
                padding: const EdgeInsets.all(
                  10.0,
                ),
                shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 19,
                  ),
                  TextFormField(
                    controller: userAddress,
                    keyboardType: TextInputType.streetAddress,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    maxLines: 4,
                    textAlign: TextAlign.left,
                    minLines: 1,
                    maxLength: 259,
                    decoration: const InputDecoration(
                      // suffixIcon: Icon(Icons.edit, color: Colors.black,),
                      labelText: 'User Full Address',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'User Full Address',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintMaxLines: 1,
                      enabled: false,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  TextFormField(
                    controller: agent,
                    enabled: false,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      labelText: 'Agent',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'Agent',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintMaxLines: 1,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  TextFormField(
                    controller: service,
                    enabled: false,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      labelText: 'Service',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'Service',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintMaxLines: 1,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Base Fee :",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "₹${(selectedAddonServiceId > 0) ? (double.parse(maxFees) + double.parse(serviceBaseFeeMrp)).toStringAsFixed(1) : double.parse(maxFees).toStringAsFixed(1)}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Commission :",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "₹${(selectedAddonServiceId > 0) ? (double.parse(maxiDriveComm) + double.parse(serviceiDriveComm)).toStringAsFixed(1) : double.parse(maxiDriveComm).toStringAsFixed(1)}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Govt. Fee :",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "₹${(selectedAddonServiceId > 0) ? (double.parse(maxGovtFee) + double.parse(serviceGovtFee)).toStringAsFixed(1) : double.parse(maxGovtFee).toStringAsFixed(1)}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Late Fee :",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "₹${(selectedAddonServiceId > 0) ? (double.parse(maxLateFee) + double.parse(serviceLateFee)).toStringAsFixed(1) : double.parse(maxLateFee).toStringAsFixed(1)}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Counter Fee :",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "₹${(selectedAddonServiceId > 0) ? (double.parse(maxCounterFee) + double.parse(serviceCounterFee)).toStringAsFixed(1) : double.parse(maxCounterFee).toStringAsFixed(1)}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Tax ${(selectedAddonServiceId > 0) ? ((double.parse(taxPer) >= double.parse(serviceTaxPer)) ? (double.parse(taxPer)) : (double.parse(serviceTaxPer))).toStringAsFixed(1) : double.parse(taxPer).toStringAsFixed(1)} %",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "₹${(selectedAddonServiceId > 0) ? (double.parse(taxAmount) + double.parse(serviceTaxAmount)).toStringAsFixed(1) : double.parse(taxAmount).toStringAsFixed(1)}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              "Total :",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "₹${totalAmount.text}",
                              style: const TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  double.parse(courseId) > 0
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 9.0,
                            horizontal: 5.0,
                          ),
                          child: Text(
                            'Do you wish to ADD LICENSE ?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 9,
                          ),
                        )
                      : const SizedBox.shrink(),
                  double.parse(courseId) > 0
                      ? const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 15.0,
                            vertical: 3.0,
                          ),
                        )
                      : const SizedBox.shrink(),
                  ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) => CheckboxListTile(
                      title: Text(
                          ("${serviceList[index]['serviceCode'].toString().trim()}, ${serviceList[index]['serviceName'].toString().trim()}")),
                      subtitle: Text(
                          ("${serviceList[index]['serviceCategoryName'].toString().trim()}, ${serviceList[index]['serviceClassName'].toString().trim()}")),
                      secondary: Text(
                          '₹ ${((double.parse(serviceList[index]['govtFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['lateFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['iDriveComm'].toString()).ceilToDouble() + double.parse(serviceList[index]['counterFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['baseFeeMrp'].toString()).ceilToDouble() + double.parse((((double.parse(serviceList[index]['govtFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['lateFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['iDriveComm'].toString()).ceilToDouble() + double.parse(serviceList[index]['counterFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['baseFeeMrp'].toString()).ceilToDouble()) * double.parse(serviceList[index]['taxPer'].toString()) / 100).toStringAsFixed(1)).toString()).ceilToDouble())).toStringAsFixed(1)}'),
                      value:
                          (double.parse(serviceList[index]['Id'].toString()) ==
                              selectedAddonServiceId),
                      onChanged: (selVal) {
                        if (double.parse(serviceList[index]['Id'].toString()) ==
                            selectedAddonServiceId) {
                          setState(() {
                            serviceiDriveComm = '0';
                            serviceGovtFee = '0';
                            serviceLateFee = '0';
                            serviceCounterFee = '0';
                            serviceTaxPer = '0';
                            serviceBaseFeeMrp = '0';
                            serviceTaxAmount = '0';
                            totalAmount.text = (double.parse(maxGovtFee)
                                        .ceilToDouble() +
                                    double.parse(maxLateFee).ceilToDouble() +
                                    double.parse(maxiDriveComm).ceilToDouble() +
                                    double.parse(maxCounterFee).ceilToDouble() +
                                    double.parse(maxFees).ceilToDouble() +
                                    double.parse(taxAmount.toString())
                                        .ceilToDouble())
                                .toStringAsFixed(1);
                            totalAmountD.text = ("₹${totalAmount.text}");
                            selectedAddonServiceId = -1;
                            serviceId = '-1';
                          });
                        } else {
                          setState(() {
                            serviceGovtFee = ((serviceList[index]['govtFee'] ==
                                        null ||
                                    serviceList[index]['govtFee'].runtimeType ==
                                        Null ||
                                    serviceList[index]['govtFee']
                                        .toString()
                                        .trim()
                                        .isEmpty ||
                                    serviceList[index]['govtFee']
                                            .toString()
                                            .trim()
                                            .toLowerCase() ==
                                        "null" ||
                                    double.tryParse(serviceList[index]
                                                    ['govtFee']
                                                .toString())
                                            .runtimeType ==
                                        Null)
                                ? ("0")
                                : (serviceList[index]['govtFee']
                                    .toString()
                                    .trim()));
                            serviceiDriveComm =
                                ((serviceList[index]['iDriveComm'] == null ||
                                        serviceList[index]['iDriveComm']
                                                .runtimeType ==
                                            Null ||
                                        serviceList[index]['iDriveComm']
                                            .toString()
                                            .trim()
                                            .isEmpty ||
                                        serviceList[index]['iDriveComm']
                                                .toString()
                                                .trim()
                                                .toLowerCase() ==
                                            "null" ||
                                        double.tryParse(serviceList[index]
                                                        ['iDriveComm']
                                                    .toString())
                                                .runtimeType ==
                                            Null)
                                    ? ("0")
                                    : (serviceList[index]['iDriveComm']
                                        .toString()
                                        .trim()));
                            serviceLateFee = ((serviceList[index]['lateFee'] ==
                                        null ||
                                    serviceList[index]['lateFee'].runtimeType ==
                                        Null ||
                                    serviceList[index]['lateFee']
                                        .toString()
                                        .trim()
                                        .isEmpty ||
                                    serviceList[index]['lateFee']
                                            .toString()
                                            .trim()
                                            .toLowerCase() ==
                                        "null" ||
                                    double.tryParse(serviceList[index]
                                                    ['lateFee']
                                                .toString())
                                            .runtimeType ==
                                        Null)
                                ? ("0")
                                : (serviceList[index]['lateFee']
                                    .toString()
                                    .trim()));
                            serviceCounterFee =
                                ((serviceList[index]['counterFee'] == null ||
                                        serviceList[index]['counterFee']
                                                .runtimeType ==
                                            Null ||
                                        serviceList[index]['counterFee']
                                            .toString()
                                            .trim()
                                            .isEmpty ||
                                        serviceList[index]['counterFee']
                                                .toString()
                                                .trim()
                                                .toLowerCase() ==
                                            "null" ||
                                        double.tryParse(serviceList[index]
                                                        ['lateFee']
                                                    .toString())
                                                .runtimeType ==
                                            Null)
                                    ? ("0")
                                    : (serviceList[index]['counterFee']
                                        .toString()
                                        .trim()));
                            serviceTaxPer = ((serviceList[index]['taxPer'] ==
                                        null ||
                                    serviceList[index]['taxPer'].runtimeType ==
                                        Null ||
                                    serviceList[index]['taxPer']
                                        .toString()
                                        .trim()
                                        .isEmpty ||
                                    serviceList[index]['taxPer']
                                            .toString()
                                            .trim()
                                            .toLowerCase() ==
                                        "null" ||
                                    double.parse(serviceList[index]['taxPer']
                                            .toString()) <=
                                        0)
                                ? ("0")
                                : (serviceList[index]['taxPer']
                                    .toString()
                                    .trim()));
                            serviceBaseFeeMrp =
                                ((serviceList[index]['baseFeeMrp'] == null ||
                                        serviceList[index]['baseFeeMrp']
                                                .runtimeType ==
                                            Null ||
                                        serviceList[index]['baseFeeMrp']
                                            .toString()
                                            .trim()
                                            .isEmpty ||
                                        serviceList[index]['baseFeeMrp']
                                                .toString()
                                                .trim()
                                                .toLowerCase() ==
                                            "null" ||
                                        double.parse(serviceList[index]
                                                    ['baseFeeMrp']
                                                .toString()) <=
                                            0)
                                    ? ("0")
                                    : (serviceList[index]['baseFeeMrp']
                                        .toString()
                                        .trim()));
                            serviceTaxAmount = ((double.parse(serviceList[index]
                                                    ['govtFee']
                                                .toString())
                                            .ceilToDouble() +
                                        double.parse(serviceList[index]['lateFee'].toString())
                                            .ceilToDouble() +
                                        double.parse(serviceList[index]['iDriveComm'].toString())
                                            .ceilToDouble() +
                                        double.parse(serviceList[index]
                                                    ['counterFee']
                                                .toString())
                                            .ceilToDouble() +
                                        double.parse(serviceList[index]
                                                    ['baseFeeMrp']
                                                .toString())
                                            .ceilToDouble()) *
                                    double.parse(
                                        serviceList[index]['taxPer'].toString()) /
                                    100)
                                .toStringAsFixed(1);
                            totalAmount.text = ((double.parse(serviceList[index]['govtFee'].toString()).ceilToDouble() +
                                        double.parse(serviceList[index]['lateFee'].toString())
                                            .ceilToDouble() +
                                        double.parse(serviceList[index]['iDriveComm'].toString())
                                            .ceilToDouble() +
                                        double.parse(serviceList[index]['counterFee'].toString())
                                            .ceilToDouble() +
                                        double.parse(serviceList[index]['baseFeeMrp'].toString())
                                            .ceilToDouble() +
                                        double.parse((((double.parse(serviceList[index]['govtFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['lateFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['iDriveComm'].toString()).ceilToDouble() + double.parse(serviceList[index]['counterFee'].toString()).ceilToDouble() + double.parse(serviceList[index]['baseFeeMrp'].toString()).ceilToDouble()) *
                                                        double.parse(
                                                            serviceList[index]
                                                                    ['taxPer']
                                                                .toString()) /
                                                        100)
                                                    .toStringAsFixed(1))
                                                .toString())
                                            .ceilToDouble()) +
                                    (double.parse(maxGovtFee).ceilToDouble() +
                                        double.parse(maxLateFee).ceilToDouble() +
                                        double.parse(maxCounterFee).ceilToDouble() +
                                        double.parse(maxiDriveComm).ceilToDouble() +
                                        double.parse(maxFees).ceilToDouble() +
                                        double.parse(taxAmount.toString()).ceilToDouble()))
                                .toStringAsFixed(1);
                            totalAmountD.text = ("₹${totalAmount.text}");
                            selectedAddonServiceId = double.parse(
                                serviceList[index]['Id'].toString());
                            serviceId = serviceList[index]['Id'].toString();
                          });
                        }
                      },
                    ),
                    separatorBuilder: (context, index) => const Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 15.0,
                        vertical: 3.0,
                      ),
                      // child: CustomDividerView(
                      //   dividerHeight: 3.0,
                      // ),
                    ),
                    itemCount: serviceList.length,
                  ),
                  const SizedBox(
                    height: 9,
                  ),
                  TextFormField(
                    controller: userName,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    minLines: 1,
                    maxLength: 39,
                    enabled: false,
                    decoration: const InputDecoration(
                      // suffixIcon: Icon(Icons.edit, color: Colors.black,),
                      labelText: 'User Full Name',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'User Full Name',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintMaxLines: 1,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  TextFormField(
                    controller: userContact,
                    keyboardType: TextInputType.phone,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    maxLines: 1,
                    textAlign: TextAlign.left,
                    minLines: 1,
                    maxLength: 10,
                    enabled: false,
                    decoration: const InputDecoration(
                      // suffixIcon: Icon(Icons.edit, color: Colors.black,),
                      labelText: 'User Contact',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'User Contact',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintMaxLines: 1,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 19,
                  ),
                  TextFormField(
                    controller: totalAmountD,
                    enabled: false,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                      labelText: 'Total Amount',
                      labelStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintText: 'Total Amount',
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                      hintMaxLines: 1,
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width: 1.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 249,
                  ),
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        foregroundColor: Colors.green,
        onPressed: () {
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (context) => const HomeScreen(),
          //   ),
          // );
          showDialog(
            barrierDismissible: false,
            context: context,
            builder: (context) => AlertDialog(
              content: Text(
                "Your order has been generated successfully",
                textScaleFactor: 1,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.85),
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomeScreen()),
                          (route) => false);
                    },
                    child: const Text("Ok"))
              ],
            ),
          );
          // if (userName.text.runtimeType == Null ||
          //     userName.text.toString().trim().isEmpty ||
          //     userName.text.toString().trim().toLowerCase() == "null" ||
          //     userName.text.toString().trim().toLowerCase() == "error") {
          //   showDialog(
          //     context: context,
          //     builder: (context) => const AlertDialog(
          //       backgroundColor: Colors.white,
          //       title: Text(
          //         'Invalid Username',
          //       ),
          //       content: Text('INVALID / EMPTY / BLANK USERNAME'),
          //     ),
          //   );
          // } else if (userContact.text.runtimeType == Null ||
          //     userContact.text.toString().trim().isEmpty ||
          //     userContact.text.toString().trim().toLowerCase() == "null" ||
          //     userContact.text.toString().trim().toLowerCase() == "error") {
          //   showDialog(
          //     context: context,
          //     builder: (context) => const AlertDialog(
          //       backgroundColor: Colors.white,
          //       title: Text(
          //         'Invalid Contact',
          //       ),
          //       content: Text('INVALID / EMPTY / BLANK CONTACT'),
          //     ),
          //   );
          // } else if (userAddress.text.runtimeType == Null ||
          //     userAddress.text.toString().trim().isEmpty ||
          //     userAddress.text.toString().trim().toLowerCase() == "null" ||
          //     userAddress.text.toString().trim().toLowerCase() == "error") {
          //   showDialog(
          //     context: context,
          //     builder: (context) => const AlertDialog(
          //       backgroundColor: Colors.white,
          //       title: Text(
          //         'Invalid Address',
          //       ),
          //       content: Text('INVALID / EMPTY / BLANK ADDRESS'),
          //     ),
          //   );
          // } else if (agent.text.runtimeType == Null ||
          //     agent.text.toString().trim().isEmpty ||
          //     agent.text.toString().trim().toLowerCase() == "null" ||
          //     agent.text.toString().trim().toLowerCase() == "error") {
          //   showDialog(
          //     context: context,
          //     builder: (context) => const AlertDialog(
          //       backgroundColor: Colors.white,
          //       title: Text(
          //         'Invalid Agent',
          //       ),
          //       content: Text('INVALID / EMPTY / BLANK AGENT'),
          //     ),
          //   );
          // } else if (service.text.runtimeType == Null ||
          //     service.text.toString().trim().isEmpty ||
          //     service.text.toString().trim().toLowerCase() == "null" ||
          //     service.text.toString().trim().toLowerCase() == "error") {
          //   showDialog(
          //     context: context,
          //     builder: (context) => const AlertDialog(
          //       backgroundColor: Colors.white,
          //       title: Text(
          //         'Invalid Service',
          //       ),
          //       content: Text('INVALID / EMPTY / BLANK SERVICE'),
          //     ),
          //   );
          // } else if (totalAmount.text.runtimeType == Null ||
          //     totalAmount.text.toString().trim().isEmpty ||
          //     totalAmount.text.toString().trim().toLowerCase() == "null" ||
          //     double.parse(totalAmount.text.toString().trim()) <= 0) {
          //   showDialog(
          //     context: context,
          //     builder: (context) => const AlertDialog(
          //       backgroundColor: Colors.white,
          //       title: Text(
          //         'Invalid Amount',
          //       ),
          //       content: Text('INVALID / EMPTY / BLANK / ZERO AMOUNT'),
          //     ),
          //   );
          // } else {
          //   createOrder();
          // }
        },
        child: const Icon(
          Icons.send_outlined,
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
