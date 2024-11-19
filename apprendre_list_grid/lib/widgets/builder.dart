import 'package:apprendre_list_grid/models/user.dart';
import 'package:apprendre_list_grid/widgets/user_tile.dart';
import 'package:flutter/material.dart';

import '../models/user_datas.dart';

class BuilderWidget extends StatelessWidget{
  const BuilderWidget({super.key});



  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, int index)=>UserTile(user: users[index])),
    );
  }
}