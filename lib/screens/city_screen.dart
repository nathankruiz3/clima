import 'package:clima/util/constants.dart';
import 'package:clima/widgets/reuseable_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String cityName;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: kPrimaryColorDarker,
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                'https://images.unsplash.com/photo-1513002749550-c59d786b8e6c?ixlib=rb-1.2.1&q=80&fm=jpg&crop=entropy&cs=tinysrgb&w=1080&fit=max',
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: EdgeInsets.all(10),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    RawMaterialButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        MaterialIcons.arrow_back,
                        color: Color(0xCCFFFFFF),
                        size: 45,
                      ),
                    ),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      'New City',
                      style: kAppBarText,
                    ),
                  ],
                ),
                Column(
                  children: <Widget>[
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: kPrimaryColorDarker,
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(
                            MaterialIcons.add_location,
                            size: 30,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                            child: TextField(
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                              decoration: kTextFieldInputDecoration,
                              onChanged: (value) {
                                cityName = value;
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    ReusableButton(
                      text: 'Search',
                      onPress: () {
                        Navigator.pop(context, cityName);
                      },
                    ),
                  ],
                ),
                SizedBox(
                  width: double.infinity,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
