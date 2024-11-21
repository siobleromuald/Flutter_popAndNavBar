
import 'package:apprendre_list_grid/models/user.dart';
import 'package:apprendre_list_grid/pages/detail_page.dart';
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
      onTap: (){
        MaterialPageRoute route=MaterialPageRoute(builder: (ctx)=>DetailPage(user: user));
        Navigator.push(context, route);
        },
    );
  }

}