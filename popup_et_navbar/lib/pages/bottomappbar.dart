import 'package:flutter/material.dart';
import 'package:popup_et_navbar/models/tabs.dart';
import 'package:popup_et_navbar/pages/second_page.dart';
import 'package:popup_et_navbar/widgets/first_page.dart';
import 'package:popup_et_navbar/widgets/body.dart';

class BottomAppBarPage extends StatefulWidget{
  final String title;
  const BottomAppBarPage({super.key,required this.title});

  @override
  State<StatefulWidget> createState() {
    return _DrawerPageState();
  }
//=============================Fin SCAFFOLD =========================================
}

class _DrawerPageState extends State<BottomAppBarPage>{
  Widget _widget=const BodyPage();
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
       bottomNavigationBar: BottomAppBar(
         color: Colors.green.shade100,
         shape: const CircularNotchedRectangle(),
         child: Row(
           children: _tabs.map((item)=>IconButton(
             onPressed: (){
              setState(() {
                _widget=item.widget;
              });
             },
             icon: Icon(item.iconData),
             color: Colors.purple,
           ),

           ).toList(),
         ),
       ),
        body: _widget,

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (ctx){
              return const SecondePage();
            }));
          },
        child: const Icon(Icons.add),
      ),

    );


  }
}