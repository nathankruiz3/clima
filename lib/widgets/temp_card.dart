import 'package:flutter/material.dart';
import 'package:clima/util/constants.dart';

class TempCard extends StatelessWidget {
  const TempCard({Key key, @required this.temp, @required this.tempLabel})
      : super(key: key);

  final int temp;
  final String tempLabel;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            '$temp°F',
            style: kTempText,
          ),
          Text(
            tempLabel,
            style: TextStyle(
              color: kAccentColor,
            ),
          ),
        ],
      ),
    );
  }
}
