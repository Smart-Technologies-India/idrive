import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final buyServiceState =
    ChangeNotifierProvider<BuyServiceState>((ref) => BuyServiceState());

class BuyServiceState extends ChangeNotifier {
  List<bool> selService = [];
  List<String> prices = [];
  dynamic priObj;

  int serviceIdIindex = 0;
  int baseFees = 0;
  double discount = 0;
  int discountPer = 0;
  int total = 0;
  int seletedItems = 0;

  void updateBaseFees(int value) {
    baseFees += value;
    notifyListeners();
  }

  void initPricesObj(dynamic value) {
    baseFees = 0;
    discount = 0;
    discountPer = 0;
    total = 0;
    seletedItems = 0;
    serviceIdIindex = 0;
    priObj = value;
    notifyListeners();
  }

  void intiSelService(int value) {
    selService = [];
    for (int i = 0; i < value; i++) {
      selService.add(false);
    }
    notifyListeners();
  }

  void initPrices(List value) {
    prices = [];

    for (int i = 0; i < value.length; i++) {
      prices.add((double.parse(value[i]["baseFeeMrp"]) +
              double.parse(value[i]["govtFee"]) +
              double.parse(value[i]["iDriveComm"]) +
              double.parse(value[i]["lateFee"]) +
              double.parse(value[i]["counterFee"]) +
              double.parse(value[i]["taxPer"]))
          .toString());
    }
    notifyListeners();
  }

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
      discount = min(discount, double.parse(priObj["maxRs"]));
      discountPer = double.parse(priObj["discountPer"]).round();
    } else if (seletedItems == 2) {
      discount = baseFees * (double.parse(priObj["discountPer2"]) / 100);
      discount = min(discount, double.parse(priObj["maxRs2"]));
      discountPer = double.parse(priObj["discountPer2"]).round();
    } else {
      discount = baseFees * (double.parse(priObj["discountPer3"]) / 100);
      discount = min(discount, double.parse(priObj["maxRs3"]));
      discountPer = double.parse(priObj["discountPer3"]).round();
    }

    total = baseFees - discount.round();

    getServiceIndex();

    notifyListeners();
  }

  void getServiceIndex() {
    serviceIdIindex = selService.indexOf(true);
    notifyListeners();
  }

  String getServiceName(dynamic service) {
    String servicesName = "";
    for (int i = 0; i < selService.length; i++) {
      if (selService[i]) {
        if (i == (selService.length - 1)) {
          servicesName += "${service[i]["title"]}";
        } else {
          servicesName += ", ${service[i]["title"]}";
        }
      }
    }
    return servicesName;
  }
}
