
import 'package:apprendre_list_grid/models/user.dart';
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget{
  final User user;

  const UserTile({super.key, required this.user});

  @override
  Widget build(BuildContext context) {

    return ListTile(
      title: Text(user.fullName),
      leading: CircleAvatar(
        radius: 15,
        backgroundColor: user.couleur,
        child: Text(user.initial),
      ),
    );
  }

}