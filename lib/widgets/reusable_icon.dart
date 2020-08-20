import 'package:flutter/material.dart';

class ReusableIcon extends StatelessWidget {
  const ReusableIcon({
    Key key,
    @required this.iconName,
    @required this.iconColor,
  }) : super(key: key);

  final IconData iconName;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 18),
      child: Icon(
        iconName,
        size: 150,
        color: iconColor,
      ),
    );
  }
}
