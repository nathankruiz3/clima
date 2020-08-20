import 'package:flutter/material.dart';
import 'package:clima/util/constants.dart';

class ReusableButton extends StatelessWidget {
  String text;
  Function onPress;

  ReusableButton({this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        color: kAccentColor,
      ),
      child: FlatButton(
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontStyle: FontStyle.italic,
            fontFamily: 'Sora',
            fontSize: 18,
          ),
        ),
      ),
    );
  }
}
