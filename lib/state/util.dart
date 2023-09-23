import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final utilState = ChangeNotifierProvider<Util>((ref) {
  return Util();
});

class Util extends ChangeNotifier {
  List carData = [
    {
      "imgUrl": "assest/images/ertiga_car.png",
      "carName": "Ertiga",
      "price": "\u{20B9}420/hr",
    },
    {
      "imgUrl": "assest/images/city_car.png",
      "carName": "City",
      "price": "\u{20B9}400/hr",
    },
    {
      "imgUrl": "assest/images/swift_car.png",
      "carName": "Swift",
      "price": "\u{20B9}380/hr",
    },
    {
      "imgUrl": "assest/images/i20_car.png",
      "carName": "I20",
      "price": "\u{20B9}380/hr",
    },
    {
      "imgUrl": "assest/images/innova_car.png",
      "carName": "Innova",
      "price": "\u{20B9}430/hr",
    },
    {
      "imgUrl": "assest/images/breeza_car.png",
      "carName": "Brezza",
      "price": "\u{20B9}380/hr",
    },
  ];

  List courseData = [
    {
      "type": "Beginner",
      "exp": "11 Hours\n12 Days",
      "con":
          "This practical driving course is designed for beginners who have some knowledge of car driving, iDrive partners and instructor will guide you with basic traffic rules, road safety, driving skills and tricks on how to drive on-road. Once you complete the driving course you will be self confident to drive alone.",
    },
    {
      "type": "Advance",
      "exp": "15 Hour\n15 Days",
      "con":
          "This course is designed for beginners who want to be a responsible driver who can drive with confidence, iDrive partners and instructor will guide you will complete knowledge of traffic rules, road signs, road safety, emergency procedures, highway driving code, driving skills and tricks",
    },
    {
      "type": "Expert",
      "exp": "20 Hours\n 20 Days",
      "con": [
        "Becoming an HGV Driver is a life-changing experience that will open doors to jobs and earning potential you always thought were out of reach. Completing an HGV Training Course will enable you to drive a full range of large commercial vehicles.",
        "HGV training is designed for learners to understand the basic concepts of commercial driving. Even if you are already driving a car and consider yourself a seasoned driver, being behind the wheel of an HGV vehicle is a whole different experience, and as a result, requires adequate training and skills when operating such a larger vehicle. ",
      ],
    },
  ];
  int initC = 0;

  void setInitC(int val) {
    initC = val;
    notifyListeners();
  }

  //drop down
  String? dropDownValue;
  var dropDown = ["New Licence", "Renew Licence", "IDP Service"];

  void setDropDownVal(String val) {
    dropDownValue = val.toString();
    notifyListeners();
  }
}

int randomNumberMinMax(int min, int max) {
  int randomminmax = min + Random().nextInt(max - min);
  return randomminmax;
}
