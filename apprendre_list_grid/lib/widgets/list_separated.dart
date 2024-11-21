import 'package:apprendre_list_grid/widgets/user_tile.dart';
import 'package:flutter/material.dart';
import '../models/user_datas.dart';

class SeparatedList extends StatefulWidget {
  const SeparatedList({super.key});
  @override
  State<StatefulWidget> createState() {
   return _SeparatedListState();
  }
}

class _SeparatedListState extends State<SeparatedList>{

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: ((BuildContext context, index)=>
           Dismissible( // Permet de supprimer un élément de la liste en le glissant vers la gauche ou la droite
             direction: DismissDirection.endToStart,
             background: Container(
               color: Colors.red,
               alignment: Alignment.centerRight,
               padding:const EdgeInsets.only(right: 16),
               child: const Icon(Icons.delete, color: Colors.white,),
             ),
              key: UniqueKey(),//Pour que chaque élément ait une clé unique afin de facilité la suppression
              onDismissed: (direction){
               setState(() {
                 users.remove(users[index]);
               });
               },
               child:  UserTile(user: users[index]))
        ),
        separatorBuilder: ((ctx, index)=> Divider(
          indent: 8,
          endIndent: 8,
          color: users[index].couleur,
        )),
        itemCount: users.length
    );
  }


}