import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final timerState = ChangeNotifierProvider.autoDispose<TimerState>((ref) {
  return TimerState();
});

class TimerState extends ChangeNotifier {
  int countDown = 30;
  Timer? timer;

  void startTiimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (time) {
      if (countDown == 0) {
        stopTimer();
      } else {
        coutdown();
      }
    });
  }

  void stopTimer() {
    timer!.cancel();
  }

  void restartTimer() {
    stopTimer();
    countDown = 30;
    startTiimer();
  }

  bool isTimerCompleted() {
    bool response = false;
    if (countDown == 0) {
      response = true;
    } else {
      response = false;
    }
    return response;
  }

  void coutdown() {
    --countDown;
    notifyListeners();
  }
}
