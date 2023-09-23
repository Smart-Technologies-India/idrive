
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../service/service.dart';

final rtoServiceState =
    ChangeNotifierProvider<RtoServiceState>((ref) => RtoServiceState());

class RtoServiceState extends ChangeNotifier {
  List<bool> selService = [];
  List<String> prices = [];
  dynamic priObj;

  int baseFees = 0;
  double discount = 0;
  int discountPer = 0;
  int total = 0;
  int seletedItems = 0;

  void updateBaseFees(int value) {
    baseFees += value;
    notifyListeners();
  }

  List<dynamic> agentData = [];

  void changeService(bool val, int index) {
    selService[index] = val;
    if (val) {
      updateBaseFees(double.parse(prices[index]).round());
      seletedItems++;
    } else {
      updateBaseFees(-double.parse(prices[index]).round());
      seletedItems--;
    }

    if (seletedItems == 0) {
      discount = 0;
      discountPer = 0;
    } else if (seletedItems == 1) {
      discount = baseFees * (double.parse(priObj["discountPer"]) / 100);
      discountPer = double.parse(priObj["discountPer"]).round();
    } else if (seletedItems == 2) {
      discount = baseFees * (double.parse(priObj["discountPer2"]) / 100);
      discountPer = double.parse(priObj["discountPer2"]).round();
    } else {
      discount = baseFees * (double.parse(priObj["discountPer3"]) / 100);
      discountPer = double.parse(priObj["discountPer3"]).round();
    }

    total = baseFees - discount.round();
    notifyListeners();
  }

  Future<void> submit(int rto, int serviceClass) async {
    final req = {
      "f": "findAgentService1",
      "serviceCategoryId": serviceClass.toString(),
      "rtoId": rto.toString()
    };

    final data = await ApiHandler().post(req);
    agentData = data["data"][0];
    priObj = data["data"][1];

    selService = [];
    for (int i = 0; i < agentData.length; i++) {
      selService.add(false);
    }

    prices = [];
    for (int i = 0; i < agentData.length; i++) {
      final pri = double.parse(agentData[i]["govtFee"]) +
          double.parse(agentData[i]["lateFee"]) +
          double.parse(agentData[i]["counterFee"]) +
          double.parse(agentData[i]["taxPer"]) +
          double.parse(agentData[i]["baseFeeMrp"]) +
          double.parse(agentData[i]["iDriveComm"]);
      prices.add(pri.toString());
    }

    notifyListeners();
  }
}
