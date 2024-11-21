import 'package:apprendre_list_grid/models/user.dart';
import 'package:apprendre_list_grid/widgets/user_card.dart';
import 'package:apprendre_list_grid/widgets/user_tile.dart';
import 'package:flutter/material.dart';

import '../models/user_datas.dart';

class BuilderWidget extends StatefulWidget {
  const BuilderWidget({super.key});
  @override
  State<StatefulWidget> createState() {
    return BuilderState();
  }
}

class BuilderState extends State<BuilderWidget>{

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        itemCount: users.length,
        itemBuilder: ((context, int index)=> UserCard(user: users[index]) )
        );
  }
}