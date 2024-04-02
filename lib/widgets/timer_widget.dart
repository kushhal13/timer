import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stopwatch/utils/app_strings.dart';
import 'package:stopwatch/utils/constants.dart';
import 'package:stopwatch/widgets/text_widget.dart';
import 'package:stopwatch/widgets/button_widget.dart';

class TimerCountDown extends StatefulWidget {
  const TimerCountDown({super.key});

  @override
  State<TimerCountDown> createState() => _TimerCountDownState();
}

class _TimerCountDownState extends State<TimerCountDown> {
  Timer? timer;
  static const maxSeconds = 60;
  int seconds = maxSeconds;
  bool isStarted = false;

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (seconds > 0) {
        setState(() {
          isStarted = true;
          seconds--;
        });
      } else if (seconds == 0) {
        resetTimer();
      }
    });
  }

  void resetTimer() {
    setState(() {
      seconds = maxSeconds;
      isStarted = false;
    });
  }

  void stopTimer() {
    setState(() {
      timer?.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextWidget(
          progressIndicatorValue: seconds / maxSeconds,
          isStarted: isStarted,
          text: seconds.toString(),
        ),
        const SizedBox(
          height: largePadding,
        ),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          if (isStarted) ...[
            ButtonWidget(
                title: resume,
                onTapped: (value) {
                  if (value == resume) resetTimer();
                }),
            ButtonWidget(
              title: cancel,
              onTapped: (value) {
                if (value == cancel) stopTimer();
              },
            ),
          ] else ...[
            ButtonWidget(
                title: start,
                onTapped: (value) {
                  if (value == start) startTimer();
                }),
          ]
        ])
      ],
    );
  }
}
