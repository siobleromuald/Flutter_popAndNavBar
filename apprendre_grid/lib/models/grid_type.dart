import 'package:flutter/material.dart';

class GridType{
  final String _name;
  final IconData _iconData;
  final Widget _grid;
  GridType(this._name,this._iconData,this._grid);

  String get name =>_name;
  Icon get  icon => Icon(_iconData);
  Widget get grid => _grid;
  BottomNavigationBarItem get bottomNavigationBarItem => BottomNavigationBarItem(label: _name, icon: icon,);

}