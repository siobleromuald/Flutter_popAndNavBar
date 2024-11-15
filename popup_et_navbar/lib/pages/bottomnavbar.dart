import 'package:flutter/material.dart';
import 'package:popup_et_navbar/models/tabs.dart';
import 'package:popup_et_navbar/pages/second_page.dart';
import 'package:popup_et_navbar/widgets/first_page.dart';
import 'package:popup_et_navbar/widgets/body.dart';

class BottomNavBarPage extends StatefulWidget{
  final String title;
  const BottomNavBarPage({super.key,required this.title});

  @override
  State<StatefulWidget> createState() {
    return _DrawerPageState();
  }
//=============================Fin SCAFFOLD =========================================
}

class _DrawerPageState extends State<BottomNavBarPage>{

  int _currentIndex=0;

  final List<Pages>_tabs= [
    Pages(name: "Pop Up", iconData: Icons.nature_rounded, widget:const BodyPage()),
    Pages(name: "Navigation", iconData: Icons.navigation, widget:const AccueilPage()),
    Pages(name: "About", iconData: Icons.help, widget: const Center(child: Text("Ici on met à propos")))
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: _tabs.map((t)=>t.getbottomnavBarItems).toList(),
          currentIndex: _currentIndex,
          selectedItemColor: Colors.blue,
          onTap: (index){
            setState(() {
              _currentIndex=index;
            });
          },
      ),

      body: _tabs[_currentIndex].widget,


    );


  }
}