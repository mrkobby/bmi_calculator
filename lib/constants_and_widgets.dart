import 'package:flutter/material.dart';

const Color kActiveCardColor = Color(0xff1D1E33);
const Color kInactiveCardColor = Color(0xff111328); //0xff111328
const Color kDefaultCalculateButtonColor = Color(0xffEA1556);

const double kDefaultIconSize = 60.0;

const Color kActiveTextColor = Color(0xffffffff);
const Color kInactiveTextColor = Color(0xff717682);

const TextStyle kDefaultTextTitle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w500,
  color: kInactiveTextColor,
);

const TextStyle kDefaultNumberTitle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: kActiveTextColor,
);

class BigBottomButton extends StatelessWidget {
  final String buttonTitle;
  final Function onPressed;

  const BigBottomButton({this.buttonTitle, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        color: kDefaultCalculateButtonColor,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            buttonTitle,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final IconData buttonIcon;
  final Function onPressed;

  RoundedIconButton({Key key, this.buttonIcon, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPressed,
      elevation: 6.0,
      shape: CircleBorder(),
      constraints: BoxConstraints.tightFor(height: 56.0, width: 56.0),
      fillColor: kInactiveTextColor,
      child: Icon(buttonIcon),
    );
  }
}


class ResultTextTemplate extends StatelessWidget {
  final String textTitle;
  final Color textColor;
  final double textSize;
  final FontWeight textWeight;

  const ResultTextTemplate({this.textTitle, this.textColor, this.textSize, this.textWeight});

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      style: TextStyle(
          color: textColor,
          fontSize: textSize,
          fontWeight: textWeight),
          textAlign: TextAlign.center,
    );
  }
}
