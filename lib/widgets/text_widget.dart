import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final double progressIndicatorValue;
  final bool isStarted;
  final String text;
  const TextWidget(
      {super.key,
      required this.text,
      required this.isStarted,
      required this.progressIndicatorValue});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CircularProgressIndicator(
            strokeWidth: 12,
            valueColor: AlwaysStoppedAnimation(Colors.black),
            backgroundColor: Colors.green,
            value: progressIndicatorValue,
          ),
          Center(
            child: Text(
              text,
              style: const TextStyle(color: Colors.black, fontSize: 50.0),
            ),
          ),
        ],
      ),
    );
  }
}
