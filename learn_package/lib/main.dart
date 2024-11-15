import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
      darkTheme: ThemeData(useMaterial3: true),
      home: const MyHomePage(title: 'Apprendre les packages'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({super.key, required this.title});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
 File? _file;

 Future<void>_pickImage(ImageSource source) async{
  XFile? xFile=await ImagePicker().pickImage(source: source);
  if(xFile!=null){
    setState(() {
      String path=xFile.path;
      _file=File(path);
    });
  }
 }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
        title: Text(widget.title),
      ),


      body:  Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: _file!=null ? FileImage(_file!): AssetImage("")
            ),
            const Divider(height: 10,),

            _file!=null ?
                Image.file(_file!):
                FlutterLogo(
                  size: MediaQuery.of(context).size.width*0.8,
                ),
            const SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: (()=>_pickImage(ImageSource.camera)),
                    icon:const Icon(FontAwesomeIcons.camera, color: Colors.blue,size: 50,)
                ),
                IconButton(
                    onPressed: (()=>_pickImage(ImageSource.gallery)),
                    icon:const Icon(FontAwesomeIcons.photoFilm, color: Colors.blue, size: 50,),

                ),
              ],
            )
          ],
        ),
      ),

    );
  }
}
