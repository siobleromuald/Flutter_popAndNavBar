import 'package:flutter/cupertino.dart' show Icon, IconData, Widget;
import 'package:flutter/material.dart';

class Pages{
  String name;
  IconData iconData;
  Widget widget;

  Tab get tab=> Tab(icon: Icon(iconData),text: name);

  BottomNavigationBarItem get getbottomnavBarItems=>BottomNavigationBarItem(
      icon: Icon(iconData),
      label: name
  );

  Pages({required this.name,required this.iconData, required this.widget});





}