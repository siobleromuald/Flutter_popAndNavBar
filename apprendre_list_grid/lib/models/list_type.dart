import 'package:flutter/material.dart';

class ListType{
  final String _name;
  final IconData _iconData;
  final Widget _list;
  ListType(this._name,this._iconData,this._list);

  String get name =>_name;
  Icon get  icon => Icon(_iconData);
  Widget get list => _list;
  Tab get tab => Tab(text: _name, icon: icon,);

}