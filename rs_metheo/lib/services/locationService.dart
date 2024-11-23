

import 'package:flutter/services.dart';
import 'package:location/location.dart';
import 'package:ma_meteo/models/geoPosition.dart';
import 'package:geocoding/geocoding.dart' as geocoding;
class LocationService{

  //Obtenir la Position
  Future<LocationData?> getPosition() async{
    try{
      Location location=Location();
      return location.getLocation();
    }on PlatformException catch(err){
      print("Nous avons une erreur pour récupérer la position: \n ${err.message}");
      return null;
    }
  }

  //Convertir Position en ville
  Future<GeoPosition?> getCity() async{
    //Pour obtenir la latitude et la longitude
    final position=await getPosition(); // appel de la fonction utilisateur getPosition
    if (position==null) return null;
    final lat=position.latitude ??0.0;
    final lon=position.longitude ?? 0.0;
    //récupérer une liste de placement ou le positionnement
    List<geocoding.Placemark> placement=await geocoding.placemarkFromCoordinates(lat, lon);
    print(placement);
    final firstchoice=placement.first; //avoir la premiere position correspondant au coordonnées latitude et longitude
    //avoir la ville en fonction du positionnement obtenu
    final GeoPosition geoPosition=GeoPosition(
        city: firstchoice.locality ?? "",
        lat: lat,
        lon: lon);
    return geoPosition;
  }

  //Convertir ville en Position
  Future<GeoPosition?> getCoordsFromCity(String city) async{
    final placement=await geocoding.locationFromAddress(city);
    if(placement.isEmpty) return null;
    final bestchoice=placement.first;
    return GeoPosition(
        city: city,
        lat: bestchoice.latitude,
        lon: bestchoice.longitude);
  }

}