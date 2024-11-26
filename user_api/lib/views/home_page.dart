import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:user_api/views/user_detail.dart';

import '../models/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<User>users=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers();
  }
  void searchResult(String search){
    List<User> resultat=[];
    if(search.isEmpty){
      getUsers();
      resultat=users;
    }else{
      resultat=users.where((user)=>
          user.name.fullName.toLowerCase().contains(search.toLowerCase())
      ).toList();
    }
    setState(() {
      users=resultat;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Gestion utilisateurs", style: const TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(children: [
            const SizedBox( height: 20),
             TextField(
                decoration:const InputDecoration(
                labelText: 'Recherche', suffix: Icon(Icons.search,color: Colors.blue,)),
                onChanged: (value)=>searchResult(value),
            ),
            const SizedBox( height: 20),
            Expanded(child: ListView.builder(
                itemCount: users.length,
                itemBuilder: (context,index){
                  final user=users[index];
                  return ListTile(
                    leading:ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.network(user.picture.thumbnail)
                    ) ,
                    title: Text(user.name.fullName, style:const TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),),
                    subtitle: Text(user.phone, style:const TextStyle(color: Colors.black)),
                    onTap: (){
                      MaterialPageRoute route=MaterialPageRoute(builder: (ctx)=>UserDetail(user: user));
                      Navigator.push(context, route);
                    },
                  );
                }
            ),
            ),
          ], ),
      ),


      floatingActionButton: FloatingActionButton(
        onPressed: getUsers,
        tooltip: 'load users list',
        backgroundColor: Colors.blue,
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  void getUsers() async{
    print('appel de getUser');
    const url='https://randomuser.me/api/?results=100';
    final uri=Uri.parse(url);
    final reponse= await http.get(uri);
    final  body=reponse.body;
    final jsonResponse=jsonDecode(body);
    final results=jsonResponse['results'] as List<dynamic>;
    final usersFromJson=results.map((e){
      final name=UserName(
          title: e['name']['title'],
          first: e['name']['first'],
          last: e['name']['last']);
      final image=Picture(
          large: e['picture']['large'],
          medium: e['picture']['medium'],
          thumbnail: e['picture']['thumbnail']
      );
      return User(
        cell: e['cell'],
        email:  e['email'],
        gender:  e['gender'],
        nat:  e['nat'],
        phone:  e['phone'],
        name: name,
        picture: image
      );
    }).toList();
    setState(() {
      users=usersFromJson;
    });
    print('Appel complet');
  }

}
