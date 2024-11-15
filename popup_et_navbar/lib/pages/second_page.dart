
import 'package:flutter/material.dart';

class SecondePage extends StatelessWidget{
  const SecondePage({super.key});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Seconde Page"),
        centerTitle: true,
      ),
      body: Center(
          child: TextButton(
              onPressed: (){
                Navigator.pop(context);
              },
              child: const Text("Retour en arrière", style: TextStyle(
                fontSize: 18,
                color: Colors.blue
              ),)
          )
      ),
    );
  }

}