import 'dart:math';

import 'package:flutter/material.dart';

class ChipPage extends StatefulWidget{
  final String title;
  const ChipPage({super.key, required this.title});
  @override
  State<ChipPage> createState() {
    // TODO: implement createState
    return _ChipPageState();
  }

}

class _ChipPageState extends State<ChipPage>{

  List<User> _users=[
    User("Gerard", Colors.green),
    User("Romuald", Colors.purple),
    User("Stephane", Colors.blue),
    User("Johnny", Colors.red),
    User("Sylvie", Colors.pinkAccent),
  ];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body:  Center(
          child: Wrap(
            children: _users.map((u){
                    return Chip(
                      label: Text(u.nom),
                      avatar: CircleAvatar(
                        backgroundColor: u.couleur,
                        child:  Text(u.nom[0]),
                      ),
                      onDeleted: (){
                        setState(() {
                          _users.remove(u);
                        });
                      },
                    );
            }).toList(),
          ),
      ),


      bottomNavigationBar: BottomNavigationBar(items:const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),

      ],
        selectedItemColor: Colors.purpleAccent,

      ),
    );

  }
}
class User{
  String nom;
  Color couleur;
  User(this.nom, this.couleur);
}
enum FootballClub{
  Barcelon, Chelsea, Asec, AfricaSport, Bayen;
}


