
import 'package:flutter/material.dart';
import 'package:popup_et_navbar/pages/home.dart';
import 'package:popup_et_navbar/widgets/body.dart';

class ThirdPage extends StatelessWidget {
  final String title;

  const ThirdPage({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          title: Text(title),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
              children: [
                Text("Le paramètre passé a pour valeur: $title",
                  style:const TextStyle(fontSize: 18),
                ),
                ElevatedButton(
                     onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (ctx){
                        return  HomePage(title: "Les boites de dialogue");
                      }));
                    },
                    child: const Text("Passez au boites de dialogue")
                )

              ],
            )

        )
    );
  }

}