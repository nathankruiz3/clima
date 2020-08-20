import 'package:flutter/material.dart';
import 'package:clima/widgets/reusable_icon.dart';
import 'package:clima/util/constants.dart';

class CaptionIcon extends StatelessWidget {
  const CaptionIcon({
    Key key,
    @required this.iconName,
    @required this.iconColor,
    @required this.capDesc,
  }) : super(key: key);

  final IconData iconName;
  final Color iconColor;
  final String capDesc;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ReusableIcon(iconName: iconName, iconColor: iconColor),
        SizedBox(
          height: 65,
        ),
        Text(
          '$capDesc',
          style: kDescText,
        ),
      ],
    );
  }
}
