import 'package:flutter/material.dart';

class GridCount extends StatelessWidget{
  const GridCount({super.key});


  @override
  Widget build(BuildContext context) {

    return GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
      children: List.generate(10, (i){
        final int shade=i*100;
        return Container(
            decoration: BoxDecoration(
            color: Colors.deepPurple[shade],
            borderRadius: BorderRadius.circular(16)
          ),
        );
      }),
    );
  }
}