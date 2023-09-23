// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:carpage/views/home/homescreen.dart';
import 'package:carpage/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlng/latlng.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class Otppage extends StatefulWidget {
  String number;
  bool existingUser;
  String username;
  Otppage(
      {Key? key,
      required this.number,
      required this.existingUser,
      required this.username})
      : super(key: key);

  @override
  State<Otppage> createState() => _OtppageState();
}

class _OtppageState extends State<Otppage> {
  ScrollController? scrollController;
  FocusNode? focusNode;

  TextEditingController? _userName;
  String otp = "";

  bool isLoading = true;
  bool isUsernameEnable = true;
  Timer? timer;
  double secondsToReOTP = 0;
  double counterReInitOTP = 0;
  String? otpPinRes;
  SharedPreferences? prefs;
  FocusScopeNode? node;
  LatLng latLng = const LatLng(
    0,
    0,
  );

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    super.initState();

    try {
      super.initState();
      initialize();
    } catch (exEr) {
      setState(() {
        isLoading = false;
      });
    }

    _userName = TextEditingController();
    _userName!.text = widget.username;
    focusNode = FocusNode();

    scrollController = ScrollController();
    focusNode!.addListener(() {
      Timer(const Duration(seconds: 1), () {
        setscrollend();
      });
    });
  }

  sendOTP() async {
    try {
      setState(() {
        isLoading = true;
      });
      var res = await ApiHandler().post({
        'f': 'sendOTPTubeLight',
        'mobile': widget.number,
        'otp': otpPinRes,
      });
      setState(() {
        isLoading = false;
      });
      if (res['status'] == true) {
        otpPinRes = res['data'][0];
        Fluttertoast.showToast(
          msg: ('OTP Sent To ${widget.number} Successfully'),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        enableTimer();
      } else {
        Fluttertoast.showToast(
          msg: res['message'].toString(),
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xFFED2224),
          textColor: Colors.white,
          fontSize: 16.0,
        );
        disableTimer();
      }
    } catch (custErr) {
      setState(() {
        isLoading = false;
      });
    }
  }

  initialize() async {
    try {
      prefs = await SharedPreferences.getInstance();
      try {
        prefs!.setString("login", '');
      } catch (exEr) {}
      otpPinRes = '';

      sendOTP();
      // if (await Permission.location.serviceStatus.isEnabled) {
      // } else {
      //   await verifyPermission();
      // }
    } catch (custErr) {
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  enableTimer() {
    counterReInitOTP++;
    secondsToReOTP = (counterReInitOTP * 90);
    timer = Timer.periodic(
        const Duration(
          seconds: 1,
        ), (t) {
      if (secondsToReOTP <= 0) {
        disableTimer();
      } else {
        setState(() {
          secondsToReOTP--;
        });
      }
    });
  }

  disableTimer() {
    timer!.cancel();
    secondsToReOTP = 0;
  }

  setscrollend() {
    scrollController!.animateTo(scrollController!.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  validateSplash() async {
    try {
      if (_userName!.text.runtimeType == Null ||
          _userName!.text.toString().trim().isEmpty) {
        return {
          'status': false,
          'data': {},
          'message': 'Please provide your name'
        };
      } else if (double.parse(otpPinRes.toString()) !=
          double.parse(otp.toString())) {
        return {'status': false, 'data': {}, 'message': 'invalid otp number'};
      } else {
        setState(() {
          isLoading = true;
        });
        if (_userName!.text.runtimeType == Null ||
            _userName!.text.toString().trim().isEmpty) {
          var res = await ApiHandler().post({
            'f': 'api_add_user',
            'username': _userName!.text,
            'contact': widget.number.toString(),
            'email': ('User${widget.number}@dabbawala.live'),
            'password': widget.number.toString(),
          });
          if (res['status']) {
            return await ApiHandler().post({
              'f': 'api_skip_login',
              'contact': widget.number.toString(),
              'currLat': latLng.latitude.toString(),
              'currLng': latLng.longitude.toString(),
            });
          } else {
            return res;
          }
        } else {
          return await ApiHandler().post({
            'f': 'api_skip_login',
            'contact': widget.number.toString(),
            'currLat': latLng.latitude.toString(),
            'currLng': latLng.longitude.toString(),
          });
        }
      }
    } catch (custErr) {
      return {
        'status': false,
        'data': {},
        'message': (custErr.toString().trim())
      };
    }
  }

  submitOTP() async {
    {
      var res = await validateSplash();
      if (res['status'] == true) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      } else {
        setState(() {
          isLoading = false;
        });
        Fluttertoast.showToast(
          msg: res['message'],
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: const Color(0xFFED2224),
          textColor: Colors.white,
          fontSize: 16.0,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
          controller: scrollController,
          child: SizedBox(
            height: height,
            width: double.maxFinite,
            child: Stack(
              children: [
                Positioned(
                  left: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    width: MediaQuery.of(context).size.width,
                    height: height * 0.42,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assest/images/bg.jpg"),
                          fit: BoxFit.cover),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (widget.existingUser) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 10),
                            decoration: BoxDecoration(
                                color: const Color(0xfff2b600),
                                borderRadius: const BorderRadius.horizontal(
                                  right: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 10)
                                ]),
                            margin: const EdgeInsets.only(bottom: 10),
                            child: Text(
                              "Hello ${widget.username}",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff1b2432),
                              ),
                            ),
                          ),
                        ],
                        Center(
                          child: Image.asset(
                            "assest/images/pv.png",
                            height: height * 0.30,
                            width: MediaQuery.of(context).size.width,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                    top: ((height * 0.42) - 20),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      width: width,
                      height: (height * 0.58) + 20,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 10,
                              offset: const Offset(0, -4))
                        ],
                        gradient: const LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff1a222f), Color(0xff293953)]),
                        color: Colors.red,
                        borderRadius: const BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            if (widget.existingUser == false) ...[
                              Container(
                                margin: const EdgeInsets.only(top: 20),
                                child: TextField(
                                  focusNode: focusNode,
                                  style: const TextStyle(fontSize: 20),
                                  controller: _userName,
                                  decoration: InputDecoration(
                                    suffixIcon: GestureDetector(
                                      onTap: () {
                                        FocusScope.of(context).nextFocus();
                                      },
                                      child: const Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: Icon(
                                          Icons.arrow_forward,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ),
                                    hintText: "Enter Your Name",
                                    contentPadding: const EdgeInsets.only(
                                        top: 0, left: 20, right: 20, bottom: 0),
                                    filled: true,
                                    fillColor: const Color(0xffFACC15),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    border: OutlineInputBorder(
                                      borderSide: const BorderSide(width: 0),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onChanged: (value) {
                                    setState(() {});
                                  },
                                ),
                              ),
                            ],
                            Container(
                              padding: const EdgeInsets.only(top: 10),
                              width: MediaQuery.of(context).size.width,
                              child: Center(
                                child: Text("Verification Code",
                                    style: GoogleFonts.questrial(
                                      textStyle: const TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffFACC15),
                                      ),
                                    )),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 5,
                                  vertical: widget.existingUser ? 20 : 10),
                              child: const Text(
                                "We have sent the code verification to Your Mobile Number",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "XXXXX XX${widget.number.substring(7, 10)}",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      padding: const EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Icon(
                                        Icons.edit,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            OTPTextField(
                              otpFieldStyle: OtpFieldStyle(
                                  backgroundColor: const Color(0xffFACC15)),
                              length: 4,
                              outlineBorderRadius: 50,
                              width: MediaQuery.of(context).size.width,
                              fieldWidth: 50,
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                              spaceBetween: 10,
                              textFieldAlignment: MainAxisAlignment.center,
                              fieldStyle: FieldStyle.box,
                              onCompleted: (pin) {},
                              onChanged: (String value) {
                                otp = value;
                                setscrollend();
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: Text(
                                "Didn't you receive any code?",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xffFACC15)),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "RESEND NEW CODE",
                                style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.red),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              width: MediaQuery.of(context).size.width,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      tapTargetSize:
                                          MaterialTapTargetSize.shrinkWrap,
                                      backgroundColor: const Color(0xffFACC15)),
                                  onPressed: () {
                                    submitOTP();
                                    // setState(() {
                                    //   isAlreadyUser = !isAlreadyUser;
                                    // });

                                    //submit code
                                    // if (_userName!.text.isNotEmpty &&
                                    //     _userName!.text.length < 25 &&
                                    //     _userName!.text.length > 2 &&
                                    //     otp.length == 4) {
                                    //   log("everything okey");
                                    // } else {
                                    //   log("something went wrong");
                                    // }
                                  },
                                  child: const Text(
                                    "SUBMIT",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          )),
    );
  }
}
