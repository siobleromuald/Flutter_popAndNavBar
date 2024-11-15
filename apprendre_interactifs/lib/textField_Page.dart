import 'dart:math';

import 'package:flutter/material.dart';
import 'segmentbutton_page.dart';

class TextfieldPage extends StatefulWidget{
  final String title;
  const TextfieldPage({super.key, required this.title});
  @override
  State<TextfieldPage> createState() {
    // TODO: implement createState
    return _TextfieldPageState();
  }

}

class _TextfieldPageState extends State<TextfieldPage>{

  final _formKey=GlobalKey<FormState>();

 late TextEditingController _controller;

  String _simple="";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller=TextEditingController();

  }
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void unfocusMethod1(){
    FocusScope.of(context).unfocus();
  }

  void unfocusMethod2(){
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),

      body:  InkWell(
        onTap: (){
          unfocusMethod2();
        },
        child: Center(
            child:Padding(
              padding: const EdgeInsets.all(8),
              child:  Column(
                children: [
                  Text("Valeur de TextField simple est: $_simple"),
                  const TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    obscuringCharacter: "*",
                  ),
                  const SizedBox(height: 24,),
                  TextField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.text,
                    //obscureText: true,
                    // obscuringCharacter: "*",
                    decoration:  InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        label: const Text("Nom de famille"),
                        hintText: "Entrez votre nom"
                    ),
                    onChanged: (newString){
                      setState(() {
                        _simple=newString;
                      });
                    },
                  ),

                  const SizedBox(height: 24,),
                  TextField(
                    controller: _controller,
                    decoration:const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Voyons si vous arrivez à me lire en appuyant sur le bouton"
                    ),

                  ),
                  const SizedBox(height: 24,),
                  ElevatedButton(
                      onPressed: (()=> setState(() {

                      })),
                      child: const Text("Révèle le texte")
                  ),
                  Text(_controller.text),

                  const SizedBox(height: 24,),

                  Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            validator: (value){
                              if(value==null|| value.isEmpty){
                                return "L'adresse mail ne peux pas être vide";
                              } else{
                                null;
                              }
                            },
                            decoration:const InputDecoration(
                                hintText: "Entrez votre adresse",
                                label:  Text("Adresse mail")
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          TextButton(
                              onPressed: (){
                                if(_formKey.currentState!.validate()){
                                  print("Ok");
                                } else{
                                  print("Nope");
                                }
                              },
                              child: const Text("Valider")
                          )
                        ],
                      )


                  )


                ],
              ),
            )
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
