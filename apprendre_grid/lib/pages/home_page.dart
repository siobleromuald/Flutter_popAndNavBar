import 'package:apprendre_grid/models/grid_type.dart';
import 'package:apprendre_grid/pages/grid_builder.dart';
import 'package:apprendre_grid/pages/orientation_page.dart';
import 'package:apprendre_grid/widgets/grid_costum.dart';
import 'package:apprendre_grid/widgets/grid_count.dart';
import 'package:apprendre_grid/widgets/grid_simple.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({super.key, required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

  int index=0;

  List<GridType> pages=[
    GridType('Simple', Icons.grid_4x4_rounded, const GridSimple()),
    GridType('Builder', Icons.build, const GridBuilder()),
    GridType('Count', Icons.numbers, const GridCount()),
    GridType('Costum', Icons.settings, const GridCostum()),
    GridType('Extent', Icons.extension, const DiveceOrientationPage()),
  ];


  @override
  Widget build(BuildContext context) {
    /*SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp
      ]
    );*/
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(widget.title,style: const  TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.bold
        ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: pages.map((tab)=>tab.bottomNavigationBarItem).toList(),
          currentIndex: index,
          selectedItemColor: Colors.green,
          unselectedItemColor: Colors.grey,
          onTap: (newIndex){
            setState(() {
              index=newIndex;
            });
        },
      ),

      body: Center(
        child: pages[index].grid,
      ),
    );
  }
}