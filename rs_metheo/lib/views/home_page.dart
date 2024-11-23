import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:ma_meteo/models/geoPosition.dart';
import 'package:ma_meteo/services/ApiService.dart';
import 'package:ma_meteo/services/locationService.dart';
class HomePage extends StatefulWidget {
 // final String title;
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
 GeoPosition? userPosition;
  @override
  void initState() {
    getUserLocation();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title:  Text(userPosition?.city ?? "Météo", style: const TextStyle(color: Colors.white, fontSize: 25),),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body:  Center(
        child: Text("Notre position: \n${userPosition?.lat } \n${userPosition?.lon}")
      ),
    );
  }

  getUserLocation() async{
    final loc=await LocationService().getCity();
    if(loc!=null){
      setState(() {
        userPosition=loc;
        ApiService().callApi(userPosition!);
      });
    }
  }
}