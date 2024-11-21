import 'package:apprendre_grid/models/user_data.dart';
import 'package:apprendre_grid/widgets/user_card.dart';
import 'package:flutter/material.dart';
class GridBuilder extends StatelessWidget{
  const GridBuilder({super.key});


  @override
  Widget build(BuildContext context) {

    return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          crossAxisSpacing: 8,
          childAspectRatio: 1,
        ),
        itemBuilder: (context,index){
          return UserCard(user: users[index]);
        },
      itemCount: users.length,
    );
  }

}
