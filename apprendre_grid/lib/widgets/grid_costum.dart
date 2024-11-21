import 'package:apprendre_grid/widgets/user_card.dart';
import 'package:flutter/material.dart';

import '../models/user_data.dart';

class GridCostum extends StatelessWidget{
  const GridCostum({super.key});


  @override
  Widget build(BuildContext context) {

    return GridView.custom(
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
        ),
        childrenDelegate: SliverChildBuilderDelegate(
                (c,index)=>UserCard(user: users[index]),
                childCount: users.length
        ),

    );
  }
}