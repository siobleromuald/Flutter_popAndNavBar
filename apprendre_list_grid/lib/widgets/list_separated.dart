import 'package:apprendre_list_grid/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../models/user_datas.dart';

class SeparatedList extends StatelessWidget{

 const SeparatedList({super.key});


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((BuildContext context, index)=>UserTile(user: users[index])),
        separatorBuilder: ((ctx, index)=> Divider(
          indent: 8,
          endIndent: 8,
          color: users[index].couleur,
        )),
        itemCount: users.length
    );
  }


}