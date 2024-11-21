import 'package:apprendre_grid/pages/grid_builder.dart';
import 'package:apprendre_grid/widgets/grid_costum.dart';
import 'package:apprendre_grid/widgets/grid_simple.dart';
import 'package:flutter/material.dart';
class DiveceOrientationPage extends StatelessWidget{

  const DiveceOrientationPage({super.key});


  @override
  Widget build(BuildContext context) {
    Orientation orientation=MediaQuery.of(context).orientation;
    return Scaffold(
      appBar: AppBar(
        title: Text(orientation.toString()),
      ),
      body: (orientation==Orientation.portrait)
          ? const GridSimple()
          : const GridBuilder(),
    );
  }
}