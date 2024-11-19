import 'package:flutter/material.dart';

class User{
  String firstName;
  String lastName;
  Color couleur;

  String get fullName=> "$firstName $lastName";
  String get initial=> firstName[0].toUpperCase();
  User({required this.firstName,required this.lastName, required this.couleur});
}