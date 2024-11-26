import 'package:flutter/material.dart';
import 'package:user_api/models/user.dart';

class UserDetail extends StatelessWidget{
  final User user;

  const UserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name.fullName),
        centerTitle: true,
      ),
    );
  }
  
}