import 'dart:math';

import 'package:flutter/material.dart';

class ButtonsPage extends StatefulWidget{
  final String title;
  const ButtonsPage({super.key, required this.title});
  @override
  State<ButtonsPage> createState() {
    // TODO: implement createState
    return _ButtonsPageState();
  }

}

class _ButtonsPageState extends State<ButtonsPage>{

  int _counter=0;
  int compteur=0;
  List<String> _titles=[
    "Apprendre les buttons",
    "I Love Flutter",
    "Eat, Sleep, Code, Repeat"
  ];
  int _titleIndex=0;
  double _iconSize=20;

  void incrementation(){
    setState(() {
      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(_titles[_titleIndex]),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        actions:const [Icon(Icons.add_alert), Icon(Icons.person)],
      ),
      body:  Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Vous avez appuyé sur le bouton: ", style: Theme.of(context).textTheme.titleLarge,),

              Text("$_counter fois ",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 34
                ),
              ),
              TextButton(
                onPressed: (){
                  setState(() {
                    incrementation();
                    compteur= (_counter>1)?_counter*2:_counter;
                  });
                },
                child: const Text("TextButton",style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue
                ),),
              ),
              Text('compteur: $compteur'),

              ElevatedButton(
                  onPressed: (){
                    setState(() {
                      int newRandomTitle=Random().nextInt(_titles.length);
                      _titleIndex=newRandomTitle;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.cyan,
                      textStyle: const TextStyle(fontSize: 25, color: Colors.white)
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.edit),
                      Text("Changer le titre")
                    ],
                  )
              ),
              FilledButton.tonal(onPressed: (){},
                  child: const Text("FilledBox", style: TextStyle(fontSize: 18),)
              ),
              OutlinedButton(
                  onPressed: (){},
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 3,
                        color: Colors.redAccent,
                        style: BorderStyle.solid
                    ),
                  ),
                  child:const Text("Appuyer OutlinedButton")
              ),
              IconButton.filled(
                onPressed: (){
                  setState(() {
                    _iconSize=Random().nextInt(250).toDouble();
                    _iconSize=(_iconSize<20)?_iconSize+8:_iconSize;
                  });
                },
                icon: Icon(Icons.add,size: _iconSize,),

              )
            ],
          )
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
