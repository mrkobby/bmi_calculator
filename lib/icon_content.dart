import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants_and_widgets.dart';

class CardIconContent extends StatelessWidget {
  CardIconContent({this.cardGender, this.textColor});

  final String cardGender;
  final Color textColor;

  Widget getIcon() {
    if (cardGender == "MALE") {
      return Icon(
        FontAwesomeIcons.mars,
        size: kDefaultIconSize,
        color: textColor,
      );
    } else {
      return Icon(
        FontAwesomeIcons.venus,
        size: kDefaultIconSize,
        color: textColor,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          flex: 5,
          child: getIcon(),
        ),
        Expanded(
            flex: 2,
            child: Text(
              cardGender,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500, color: textColor),
            )),
      ],
    );
  }
}
