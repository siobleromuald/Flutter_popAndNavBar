
import 'package:flutter/material.dart';

class GridSimple extends StatelessWidget{
  const GridSimple({super.key});


  @override
  Widget build(BuildContext context) {

    return GridView(
        scrollDirection: Axis.vertical,//orientation du scrolling
        gridDelegate:  SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: MediaQuery.of(context).size.width/2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8
        ),
      children: [
          Container(color: Colors.deepOrange,),
          Container( color: Colors.green, ),
          Container( color: Colors.yellow, ),
          Container(color: Colors.blue,),
          Container( color: Colors.purple, ),
          Container( color: Colors.red, ),
          Container(color: Colors.pink,),
          Container( color: Colors.lime, ),
          Container( color: Colors.black, ),
      ],
    );
  }

}