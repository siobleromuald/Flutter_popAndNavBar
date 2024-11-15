import 'dart:math';

import 'package:flutter/material.dart';

class SwitchPage extends StatefulWidget{
  final String title;
  const SwitchPage({super.key, required this.title});
  @override
  State<SwitchPage> createState() {
    // TODO: implement createState
    return _SwitchPageState();
  }

}

class _SwitchPageState extends State<SwitchPage>{

  bool isOn=true;
  double _min=0;
  double _max=100;
  double _current=33;
  FootballClub ? _footballClub;

  Map<String, bool> groceries = {
    "Banane": false,
    "Oeufs": false,
    "Pates": false,
    "Beurre": false,
    "Poulet": false,
    "Café": false,
    "Ail": false,
    "Persil": false,
    "Courgettes": false
  };


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: isOn? Colors.white: Colors.black12,

      body: SingleChildScrollView(
         child: Center(
           child: Column(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Padding(
                 padding:const EdgeInsets.all(12),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("La valeur du Switch est: ${isOn}",
                       style:const TextStyle(
                         fontSize: 18,
                       ),
                     ),
                     Switch(
                       value: isOn,
                       onChanged: (newBool){
                         setState(() {
                           isOn=newBool;
                         });
                       },
                       activeColor: Colors.redAccent,
                       inactiveThumbColor: Colors.orangeAccent,
                       inactiveTrackColor: Colors.lightGreenAccent,
                       activeTrackColor: Colors.yellowAccent,
                     )
                   ],
                 ),

               ),
               Row(
                 children: [
                   Text(_min.toString()),
                   Expanded(child: Slider(
                     min: _min,
                     max: _max,
                     value: _current,
                     onChanged: (newValue){
                       setState(() {
                         _current=newValue;
                       });
                     },
                     divisions: 5,
                     activeColor: Colors.blueAccent,
                     inactiveColor: Colors.black12,
                   )
                   ),
                   Text(_max.toString())
                 ],
               ),
               Text("Valeur du slider: ${_current.toInt()}",style: const TextStyle(
                   fontSize: 18
               ),
               ),
               const SizedBox(height: 24,),
               Column(
                 children: [
                   const Text("Votre club de football préféré: "),
                   const SizedBox(height: 24,),
                   Column(
                     children: FootballClub.values.map((club){
                       return  Row(
                         children: [
                           Radio(
                               activeColor: Colors.blueAccent,
                               value: club,
                               groupValue: _footballClub,
                               onChanged: (club){
                                 setState(() {
                                   _footballClub=club;
                                 });st
                               }
                           ),
                           Text(club.name),
                         ],

                       );
                     }).toList()
                     ,
                   ),
                   const SizedBox(height: 24,),
                   Column(
                       children: groceries.keys.map((String key) {
                         return CheckboxListTile(
                             activeColor: Colors.pink,
                             title: Text(key),
                             value: groceries[key],
                             onChanged: (change) {
                               setState(() {
                                 groceries[key] = change ?? false;
                               });
                             });
                       }).toList()
                   )
                 ],
               )
             ],
           ),
         ),
      ) ,


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


