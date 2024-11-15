
import 'package:flutter/material.dart';
import 'package:popup_et_navbar/pages/second_page.dart';
import 'package:popup_et_navbar/pages/third_page.dart';

class AccueilPage extends StatelessWidget{
   //final String title;
  const AccueilPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              TextButton(
                  onPressed: (){
                    MaterialPageRoute route=MaterialPageRoute(builder: (BuildContext context){
                      return const SecondePage();
                    });
                    Navigator.of(context).push(route);
                  },
                  child: const Text("Allez à la page suivante", style: TextStyle(fontSize: 18),)
              ),
              TextField(
                decoration: const InputDecoration(
                  hintText: "Entrez le texte à passer",
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (stringToPass){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx){
                    return  ThirdPage(title: stringToPass);
                  }));
                },
              )
            ],
          ),
        )
    );
  }
}