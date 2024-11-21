import 'package:apprendre_list_grid/widgets/user_tile.dart';
import 'package:flutter/material.dart';

import '../models/user_datas.dart';

class ListCustom extends StatelessWidget{
  const ListCustom({super.key});


@override
  Widget build(BuildContext context) {
    return ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate(
            (context,index){
              return UserTile(user: users[index]);
            },
            childCount: users.length
        ),
    );
  }
}