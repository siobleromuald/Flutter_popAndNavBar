import 'package:flutter/material.dart';
class SimpleListView extends StatefulWidget{
 const SimpleListView({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SimpleListViewState();
  }

}

class _SimpleListViewState extends State<SimpleListView>{

  bool isOn=true;
  double fontSize=16;
  bool check=false;

  updateSwitch(bool newValue){
    setState(() {
      isOn=newValue;
    });
  }

  updateSlider(double newSize){
    setState(() {
      fontSize=newSize;
    });
  }
  updateCheck(bool ? newValue){
    setState(() {
      check=newValue ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children:  [
       const ListTile(
          title: Text("Ma première ListTile"),
          subtitle: Text("Nous avons réussi à créer une ListTile"),
          leading: Icon(Icons.search),
          iconColor: Colors.deepPurple,
          trailing: Icon(Icons.navigate_next),
        ),
        ListTile(
          title: const Text("Notication"),
          leading: Icon(isOn ? Icons.notifications : Icons.notifications_off),
          iconColor: Colors.deepPurple,
          trailing: Switch(value: isOn, onChanged: updateSwitch),
        ),

        ListTile(
          leading: const Icon(Icons.text_fields),
          title:  Text("Taille du text", style: TextStyle(fontSize: fontSize),),
          iconColor: Colors.deepPurple,
          trailing: SizedBox(
            width: 100,
            child:  Slider(
              min: 16,
              max: 28,
              value: fontSize,
              onChanged: updateSlider,
            ),
          )
        ),
        CheckboxListTile(
            value: check,
            onChanged: updateCheck,
            title: const Text("Mode Développeur",style: TextStyle(fontSize: 20)),
        )
      ],

    );
  }
}