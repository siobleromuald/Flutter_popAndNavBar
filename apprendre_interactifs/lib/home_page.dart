import 'dart:math';

import 'package:flutter/material.dart';
import 'segmentbutton_page.dart';
import 'textField_Page.dart';
import 'chip_page.dart';
import 'switch_page.dart';
import 'buttons_page.dart';
import 'datetimepicker_page.dart';

class HomePage extends StatefulWidget{
  final String title;
  const HomePage({super.key, required this.title});
  @override
  State<HomePage> createState() {
    // TODO: implement createState
    return _HomePageState();
  }

}

class _HomePageState extends State<HomePage>{

 int _selectedIndex = 0;

 void _onItemTapped(int index) {
   setState(() {
     _selectedIndex = index;
   });
 }


   @override
  void initState() {
    // TODO: implement initState
    super.initState();

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

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Affichez une page en cliquant sur un bouton", style: TextStyle(fontSize: 18),),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [

                    ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>const TextfieldPage(title: "Les zones de saisie")
                            )
                        );
                      },
                      label:const Text("TextField Page"),
                      icon: const Icon(Icons.edit),
                    ),
                    ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>const ButtonsPage(title: "Les bouttons")
                            )
                        );
                      },
                      label:const Text("Page des bouton"),
                      icon: const Icon(Icons.save),
                    ),

                    ElevatedButton.icon(
                      onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=>const DatetimepickerPage(title: "Les DatePickers")
                            )
                        );
                      },
                      label:const Text("Page des DatePickers"),
                      icon: const Icon(Icons.save),
                    )
                  ],
                ),
            ),


            // Text("$_selectedIndex")

          ],
        ),
      ) ,

      
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){

          },
          tooltip: 'Add new',
          label: const Text("Appuyez moi ") ,
          icon: const Icon(Icons.add),
        elevation: 10,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,

      bottomNavigationBar: BottomNavigationBar(items:const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Accueil"
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save),
          label: 'Button',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit),
          label: 'TextField',
        ),

      ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purpleAccent,
        onTap: _onItemTapped,
      ),

    );


  }
}
