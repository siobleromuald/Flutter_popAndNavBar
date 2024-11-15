import 'dart:math';

import 'package:flutter/material.dart';

class SegmentbuttonPage extends StatefulWidget{
  final String title;
  const SegmentbuttonPage({super.key, required this.title});
  @override
  State<SegmentbuttonPage> createState() {
    // TODO: implement createState
    return _SegmentbuttonPageState();
  }

}

class _SegmentbuttonPageState extends State<SegmentbuttonPage>{

  List<String>_popMenuvalues=["Chat","Chien","Renard"];
  String _selected="";

  List<Animal> _animals=[
    Animal("Abeille", "🐝"),
    Animal("Licorne", "🦄"),
    Animal("Singe", "🙊")
  ];
  late Set<Animal> _Selection;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _Selection={_animals[0]};
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions: [
          Icon(Icons.add_alert),
          Icon(Icons.person),
          PopupMenuButton<String>(
              icon: const Icon(Icons.settings),
              onSelected: (newValue){
                setState(() {
                  _selected=newValue;
                });
              },
              itemBuilder: (context){
                return _popMenuvalues.map((animal){
                  return PopupMenuItem<String>(
                      value: animal,
                      child: Text(animal)
                  );
                }).toList();
              }
          )
        ],
      ),

      body:  Center(
        child: Column(
          children: [
            SegmentedButton<Animal>(
              segments: _animals.map((animal){
                return ButtonSegment<Animal>(
                    value: animal,
                    label: Text(animal.name),
                    icon:  Text(animal.icon)
                );
              }
              ).toList(),
              selected: _Selection,
              onSelectionChanged: (newSet){
                setState(() {
                  _Selection=newSet;
                });
              },
            ),
            Expanded(
              child: Center(
                child: Text("Mon animal préféré est: \n ${_Selection.first.name}", style: TextStyle(fontSize: 24)),
              ),
            ),

          ],
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        onPressed: (){},
        tooltip: 'Add new',
        label: const Text("Appuyez moi") ,
        icon: const Icon(Icons.add),
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
class Animal{
  String name;
  String icon;
  Animal(this.name,this.icon);
}