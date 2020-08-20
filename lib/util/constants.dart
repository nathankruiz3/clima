import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xFF78807E);
const kPrimaryColorDarker = Color(0xDD78807E);
const kAccentColor = Color(0xFF2BD5AB);

const kAppBarText = TextStyle(
  fontSize: 38,
  color: kAccentColor,
  letterSpacing: 3,
  fontWeight: FontWeight.w600,
  fontFamily: 'Satisfy',
);

const kTitleText = TextStyle(
    fontSize: 26,
    color: kAccentColor,
    fontFamily: 'Sora',
    fontWeight: FontWeight.w100,
    letterSpacing: 1);

const kMainText = TextStyle(
  fontSize: 20,
  color: kAccentColor,
  fontFamily: 'Sora',
  fontWeight: FontWeight.w100,
  letterSpacing: 1.25,
);

const kTempNum = TextStyle(
  fontSize: 50,
  color: Colors.white,
  fontFamily: 'Sora',
  fontWeight: FontWeight.bold,
);

const kTempText = TextStyle(
  fontSize: 35,
  color: Colors.white,
  fontFamily: 'Sora',
  fontWeight: FontWeight.bold,
);

const kDescText = TextStyle(
  fontSize: 25,
  color: Colors.white,
  fontFamily: 'Sora',
);

const kTextFieldInputDecoration = InputDecoration(
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.red),
  ),
  contentPadding: EdgeInsets.only(left: 8),
  hintText: 'Please enter a city',
  hintStyle: TextStyle(
    color: Colors.white,
  ),
);
