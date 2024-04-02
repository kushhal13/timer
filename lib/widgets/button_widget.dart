import 'package:flutter/material.dart';
import 'package:stopwatch/utils/constants.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  final Function onTapped;
  const ButtonWidget({super.key, required this.title, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTapped(title);
      },
      child: Container(
        margin:const EdgeInsets.all(mediumPadding),
        padding:   const EdgeInsets.symmetric(
            horizontal: largePadding,
            vertical: mediumPadding
        ),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(buttonBorderRadius)),
          child: Text(title,style:const TextStyle(color: Colors.white),)),
    );
  }
}
