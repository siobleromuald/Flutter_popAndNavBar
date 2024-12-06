import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:user_api/models/user.dart';

class UserDetail extends StatelessWidget{
  final User user;

  const UserDetail({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name.fullName),
        centerTitle: true,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: Center(
            child:  Column(
              children: [
                CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(user.picture.thumbnail),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Card(
                    color: Colors.grey.shade300,
                    elevation: 5,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Container(
                      width: 450,
                      height: 200,
                      padding:const EdgeInsets.all(16),

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Text("LastName: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text(user.name.last, style: const TextStyle(fontSize: 18)),
                            ],
                          ),

                          Row(
                            children: [
                              const Text("FirstName: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text(user.name.first, style: const TextStyle(fontSize: 18)),
                            ],
                          ),
                          Row(
                            children: [
                              const Text("Cell: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text(user.cell, style: const TextStyle(fontSize: 18)),
                            ],
                          ),

                          Row(
                            children: [
                              const Text("Email: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text(user.email, style: const TextStyle(fontSize: 18)),
                            ],
                          ),

                          Row(
                            children: [
                              const Text("Nation: ", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                              Text(user.nat, style: const TextStyle(fontSize: 18)),
                            ],
                          ),

                        ],
                      ),
                    ),
                  ),
                ),

              ],
            ),
          )


      ),
    );
  }
  
}