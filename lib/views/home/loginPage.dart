import 'dart:async';

import 'package:carpage/views/home/otpPage.dart';
import 'package:carpage/service/service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:latlng/latlng.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController? userNumber;
  ScrollController? scrollController;
  FocusNode? focusNode;

  String? number;

  bool isLoading = true;
  String errorMessage = '';
  SharedPreferences? prefs;
  FocusScopeNode? node;
  LatLng latLng = const LatLng(
    0,
    0,
  );

  validateSplash() async {
    try {
      setState(() {
        errorMessage = '';
      });
      if (userNumber!.text.runtimeType == Null ||
          userNumber!.text.toString().trim().isEmpty ||
          double.tryParse(userNumber!.text.toString()).runtimeType == Null) {
        return {
          'status': false,
          'data': {},
          'message': 'mobile number cannot be empty'
        };
      } else if (double.parse(userNumber!.text.toString()) <= 2000000000) {
        return {
          'status': false,
          'data': {},
          'message': 'invalid mobile number'
        };
      } else {
        setState(() {
          isLoading = true;
        });

        return await ApiHandler().post({
          'f': 'api_skip_login',
          'contact': userNumber!.text.toString(),
          'currLat': latLng.latitude.toString(),
          'currLng': latLng.longitude.toString(),
        });
      }
    } catch (custErr) {
      setState(() {
        isLoading = false;
      });
      return {
        'status': false,
        'data': {},
        'message': (custErr.toString().trim())
      };
    }
  }

  @override
  void initState() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    super.initState();
    userNumber = TextEditingController();
    focusNode = FocusNode();

    scrollController = ScrollController();
    focusNode!.addListener(() {
      Timer(const Duration(seconds: 1), () {
        setscrollend();
      });
    });
  }

  @override
  void dispose() {
    userNumber!.dispose();

    super.dispose();
  }

  setscrollend() {
    scrollController!.animateTo(scrollController!.position.maxScrollExtent,
        duration: const Duration(seconds: 1), curve: Curves.ease);
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
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
                  width: width,
                  height: height * 0.45,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assest/images/bg.jpg"),
                        fit: BoxFit.cover),
                  ),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Container(
                          child: Image.asset(
                            "assest/images/db_logo.png",
                            height: height * 0.32,
                            width: 280,
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: const Text(
                          "Add your phone number. We'll send you a verification code so we know you're real.",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                            shadows: <Shadow>[
                              Shadow(
                                offset: Offset(0, 2.0),
                                blurRadius: 10.0,
                                color: Color.fromARGB(255, 0, 0, 0),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  top: ((height * 0.45) - 20),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    width: width,
                    height: ((height * 0.55) + 20),
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
                          Container(
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.only(
                              top: 20,
                              left: 20,
                            ),
                            child: Text("Phone Number",
                                style: GoogleFonts.questrial(
                                  textStyle: const TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFACC15),
                                  ),
                                )),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: TextField(
                              focusNode: focusNode,
                              style: const TextStyle(fontSize: 20),
                              controller: userNumber,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                prefixIcon: const Padding(
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    '+91 ',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                                suffixIcon: (userNumber!.text.length == 10)
                                    ? const Icon(
                                        Icons.check_circle_sharp,
                                        color: Colors.green,
                                      )
                                    : const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                      ),
                                contentPadding: const EdgeInsets.only(
                                    top: 0, left: 20, right: 20, bottom: 0),
                                filled: true,
                                fillColor: Colors.white,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Colors.black, width: 1.5),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              onChanged: (value) {
                                if (userNumber!.text.length == 10) {
                                  FocusScope.of(context).unfocus();
                                }

                                setState(() {});
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Container(
                            padding: const EdgeInsets.all(15),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: const TextSpan(
                                style: TextStyle(letterSpacing: 1),
                                children: [
                                  TextSpan(
                                    text:
                                        "By providing my phone number, I hearby agree and accept the ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: "Terms of Service",
                                    style: TextStyle(
                                        color: Color(0xffEF4444),
                                        fontSize: 16,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 3,
                                        decorationStyle:
                                            TextDecorationStyle.solid),
                                  ),
                                  TextSpan(
                                    text: " and ",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  TextSpan(
                                    text: "Privacy Policy",
                                    style: TextStyle(
                                        color: Color(0xffEF4444),
                                        fontSize: 18,
                                        decoration: TextDecoration.underline,
                                        decorationThickness: 3,
                                        decorationStyle:
                                            TextDecorationStyle.solid),
                                  ),
                                  TextSpan(
                                    text: " in use of the app.",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 30),
                            width: MediaQuery.of(context).size.width,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(25),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    tapTargetSize:
                                        MaterialTapTargetSize.shrinkWrap,
                                    backgroundColor: const Color(0xffFACC15)),
                                onPressed: () async {
                                  var res = await validateSplash();

                                  if (res['status']) {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Otppage(
                                          number: userNumber!.text,
                                          username: res['data']['username'],
                                          existingUser: true,
                                        ),
                                      ),
                                      (route) => false,
                                    );
                                  } else {
                                    setState(() {
                                      isLoading = false;
                                      errorMessage = res['message'];
                                    });
                                    if (errorMessage
                                        .toLowerCase()
                                        .contains('invalid user name')) {
                                      Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Otppage(
                                            username: '',
                                            existingUser: false,
                                            number: userNumber!.text,
                                          ),
                                        ),
                                        (route) => false,
                                      );
                                    } else {
                                      Fluttertoast.showToast(
                                        msg: res['message'],
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.CENTER,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor:
                                            const Color(0xFFED2224),
                                        textColor: Colors.white,
                                        fontSize: 16.0,
                                      );
                                    }
                                  }
                                },
                                child: const Text(
                                  "Request OTP",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Container(
                            padding: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                border: Border(
                                    top: BorderSide(
                                        color: Colors.white.withOpacity(0.3),
                                        width: 3))),
                            child: GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "NEED HELP?",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xffFACC15)),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
