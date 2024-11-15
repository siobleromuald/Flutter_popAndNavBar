import 'dart:math';

import 'package:flutter/material.dart';

class DatetimepickerPage extends StatefulWidget{
  final String title;
  const DatetimepickerPage({super.key, required this.title});
  @override
  State<DatetimepickerPage> createState() {
    // TODO: implement createState
    return _DatetimepickerPageState();
  }

}

class _DatetimepickerPageState extends State<DatetimepickerPage>{

  DateTime?_datePicked=DateTime.now();
  TimeOfDay? _timePicked=TimeOfDay.now();

  Future<void> pickDate() async{
    final newDate=await showDatePicker(
        context: context,
        firstDate: DateTime(1975),
        lastDate: DateTime(2150),
        currentDate: _datePicked
    );
    if(newDate!=null && newDate!=_datePicked){
      setState(() {
        _datePicked=newDate;
      });
    }
  }

  Future<void>_pickTime() async{
    final newTime=await showTimePicker(
        context: context,
        initialTime: _timePicked ?? TimeOfDay.now()
    );
    if(newTime!=null && newTime!=_timePicked){
      setState(() {
        _timePicked=newTime;
      });
    }
  }

  String dateConvertie(DateTime? date){
    if(date==null){
      return "Aucune date choisie";
    }
    else{
      final annee=date.year;
      final mois=date.month;
      final jour=date.day;
      return "La date choisie: $jour/$mois/$annee";
    }
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

      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(dateConvertie(_datePicked)),
            TextButton(onPressed: pickDate,
                child: const Text("Modifier la date")
            ),

            Text(_timePicked?.toString()??"Aucune date"),
            TextButton(onPressed: _pickTime,
                child: const Text("Modifier l'heure")
            ),
          ],
        )
      ),


    );

  }

}



