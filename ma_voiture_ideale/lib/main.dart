import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Configurateur de voiture'),
    );
  }
}

//============================ STATEFULLWIDGET ===================================

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}



//============================ PAGE STATE ===================================
class _MyHomePageState extends State<MyHomePage> {

  String _resultat="";
  final double _min=0;
  final double _max=25000;
   double _sliderValue =5000;

  final Map<String, bool> _options = {
    "GPS": false,
    "Caméra de recul": false,
    "Clim par zone": false,
    "Régulateur de vitesse": false,
    "Toit ouvrant": false,
    'Siège chauffant': false,
    "Roue de secours": false,
    "Jantes alu": false
  };

  //La Liste de voitures
  final List<Car> _cars= [
    Car(name: "MG cyberster", url: "MG", places: 2, isElectric: true),
    Car(name: "R5 électrique", url: "R5", places: 4, isElectric: true),
    Car(name: "Tesla", url: "tesla", places: 5, isElectric: true),
    Car(name: "Van VW", url: "Van", places: 7, isElectric: true),
    Car(name: "Alpine", url: "Alpine", places: 2, isElectric: false),
    Car(name: "Fiat 500", url: "Fiat 500", places: 4, isElectric: false),
    Car(name: "Peugeot 3008", url: "P3008", places: 5, isElectric: false),
    Car(name: "Dacia Jogger", url: "Jogger", places: 7, isElectric: false),
  ];

  late TextEditingController controller;
  String _firstName="";
  bool _iselectric=true;
  List<int>_paces=[2,4,5,7];
  int _placeSelected=2;
  String? _image;
  Car? _carSelectionne;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController(text: "Nom");

  }

  void _Validation(){
    setState(() {
      _resultat=estBonChoix();
       _carSelectionne=_cars.firstWhere((c)=>c.isElectric==_iselectric && c.places==_placeSelected);
    });
  }

  String estBonChoix(){
    if(_sliderValue>15000 && _iselectric){
      return "Vous devriez pensez à un moteur thermique";
    }
    else if(_sliderValue<5000 && !_iselectric){
      return "Vous faites peu de kilomètre, pensez à regarder une voiture électrique";
    }
    else{
      return "Voici la voiture faite pour vous";
    }
  }

    @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions:<Widget> [
          ElevatedButton(
              onPressed: _Validation,
              child: const Text("Je valide")
          )
        ],
      ),
      body:  SingleChildScrollView(
        child: Column(
            children: [
            Text(
              "Bienvenue $_firstName",
              style: const TextStyle(color: Colors.blueAccent, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Card(
                    color: Colors.grey.shade200,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      //width: 450,
                      //height: 300,
                      padding: const EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget> [
                           Text(
                              "$_resultat",
                              style:const TextStyle(fontSize: 18)
                          ),
                          (_carSelectionne==null)? const SizedBox(height: 0,)
                          :Image.asset("${_carSelectionne!.urlString}",fit: BoxFit.contain,),
                           Text(_carSelectionne?.name??"Oui Oui mobile")
                        ],
                      ),
                    ),
                  ),
                  const Divider(),
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextField(
                        decoration: const InputDecoration(
                            hintText: "Entrez votre nom",
                        ),
                        onSubmitted: (newValue){
                          setState(() {
                          _firstName=newValue;
                          });
                        },
                      ),
                      const SizedBox(height: 25,),
                      Text("Nombre de kilomètres annuel: ${_sliderValue.toInt()}",style: const TextStyle(fontSize: 18),),
                      Slider(
                          value: _sliderValue,
                          min: _min,
                          max: _max,
                          onChanged: (valeur){
                            setState(() {
                              _sliderValue=valeur;
                            });
                          },
                        activeColor: Colors.blue,
                        inactiveColor: Colors.grey,
                      ),
                      const Divider(),
                     const SizedBox(height: 25,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                         const Text("Moteur électrique", style: TextStyle(fontSize: 20),),
                          Switch(
                              value: _iselectric,
                              onChanged: (istrue){
                                setState(() {
                                  _iselectric=istrue;
                                });
                              },
                            activeColor: Colors.blue,
                            inactiveThumbColor: Colors.grey,
                            inactiveTrackColor: Colors.grey[300],
                          )
                        ],
                      ),
                      const Divider(),
                      Text("Nombre de place: $_placeSelected", style: const TextStyle(fontSize: 20)),
                      Row(
                        children: _paces.map((place){
                          return Column(
                            children: [
                              Radio(
                                  value: place,
                                  groupValue: _placeSelected,
                                  onChanged: (int? newValue){
                                    setState(() {
                                      _placeSelected=newValue??2;
                                    });
                                  },
                                activeColor: Colors.lightBlue,
                                  ),
                             ],
                          );
                        }).toList(),
                      ),
                      const Divider(),
                      const Text("Oprion du véhicule", style: TextStyle(fontSize: 20)),
                      Column(
                        children: _options.keys.map((String key){
                          return CheckboxListTile(
                            activeColor: Colors.lightBlue,
                            title: Text(key, style: const TextStyle(fontSize: 18)),
                            value: _options[key],
                            onChanged: (valeur){
                              setState(() {
                                _options[key]=valeur?? false;
                              });
                            },
                          );
                        }).toList()
                      ),
                    ],
                  ),
                ],
              ),

            ),

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Car {
  String name;
  String url;
  int places;
  bool isElectric;

  Car({required this.name, required this.url, required this.places, required this.isElectric});

  String get urlString => "assets/images/$url.jpg";
}