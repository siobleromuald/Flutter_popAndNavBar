
import 'dart:convert';

import 'package:http/http.dart';
import 'package:ma_meteo/models/geoPosition.dart';
import 'package:ma_meteo/services/ApiKeyService.dart';

class ApiService{
  String baseUrl="https://api.openweathermap.org/data/2.5/forecast";
  String lat="lat=";
  String lon="lon=";
  String appid="appid=";
  String lang="lang=fr";
  String units="units=metric";

  String prepareQuery(GeoPosition geoPosition){
     final geolat=geoPosition.lat;
     final geolon=geoPosition.lon;
     return "$baseUrl?$lat$geolat&$lon$geolon&$units&$lang&$appid$API";
  }
  Future <Null> callApi(GeoPosition position) async{
    final queryString=prepareQuery(position);
    final uri=Uri.parse(queryString);
    final call= await get(uri);
    Map<String,dynamic> map= json.decode(call.body);
    print(map);
  }
}