import 'package:flutter/material.dart';
import 'package:popup_et_navbar/models/tabs.dart';
import 'package:popup_et_navbar/widgets/first_page.dart';
import 'package:popup_et_navbar/widgets/body.dart';

class DrawerPage extends StatefulWidget{
  final String title;
  const DrawerPage({super.key,required this.title});

  @override
  State<StatefulWidget> createState() {
    return _DrawerPageState();
  }
//=============================Fin SCAFFOLD =========================================
}

class _DrawerPageState extends State<DrawerPage>{
  int _index=0;
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
        drawer: Drawer(
          child: Column(
            children: [
              const DrawerHeader(child: Text("Le menu")),
              Column(
                children: _tabs.map((t){
                  return TextButton(
                      onPressed: (){
                        setState(() {
                          Navigator.pop(context);
                          _index=_tabs.indexOf(t);
                        });
                      },

                      child: Row(
                        children: [
                          Icon(t.iconData),
                          Text(t.name)
                        ],
                      )
                  );
                }).toList(),
              )
            ],
          ),
        ),
        body: _tabs[_index].widget

    );


  }
}