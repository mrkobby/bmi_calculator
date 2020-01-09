import 'package:flutter/material.dart';

class ReUsableCard extends StatelessWidget {
  ReUsableCard({this.cardColor, this.cardChild, this.onPress, this.cardMargin, this.cardPadding});

  final Color cardColor;
  final Widget cardChild;
  final EdgeInsets cardMargin;
  final EdgeInsets cardPadding;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        padding: cardPadding,
        margin: cardMargin,
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: cardChild,
      ),
    );
  }
}
