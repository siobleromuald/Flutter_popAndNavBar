import 'package:flutter/material.dart';
import 'package:popup_et_navbar/models/tabs.dart';
import 'package:popup_et_navbar/widgets/first_page.dart';
import 'package:popup_et_navbar/widgets/body.dart';

class HomePage extends StatelessWidget{
   final String title;
    HomePage({super.key,required this.title});

   final List<Pages>_tabs= [
     Pages(name: "Pop Up", iconData: Icons.nature_rounded, widget:const BodyPage()),
     Pages(name: "Navigation", iconData: Icons.navigation, widget:const AccueilPage()),
     Pages(name: "About", iconData: Icons.help, widget: const Center(child: Text("Ici on met à propos")))
   ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _tabs.length,
        child: Scaffold(

          appBar: AppBar(
            title: Text(title),
            centerTitle: true,
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            bottom:  TabBar(
                tabs: _tabs.map((t)=>t.tab).toList(),
              indicatorColor: Colors.deepPurple,
              labelColor: Colors.deepPurple,
              unselectedLabelColor: Colors.white,
            ),
          ),
          body: TabBarView(
            children: _tabs.map((t)=>t.widget).toList(),
          ),

        )
    );


  }
//=============================Fin SCAFFOLD =========================================
}