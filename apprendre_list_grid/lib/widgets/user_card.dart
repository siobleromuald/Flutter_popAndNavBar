
import 'package:flutter/material.dart';
import '../models/user.dart';
import '../pages/detail_page.dart';

class UserCard extends StatelessWidget{
  final User user;
  const UserCard({super.key, required this.user});

  
  
  @override
  Widget build(BuildContext context) {
    
    return  Card(

      color: user.couleur.withOpacity(0.25),
      margin: const EdgeInsets.all(12),
      child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 11),
          child: Column(
            children: [
              CircleAvatar(
                radius: 34,
                backgroundColor: user.couleur,
                child: Text(user.initial),
              ),
              const SizedBox(height: 16,),
              TextButton(
                child: Text(user.fullName, style: Theme.of(context).textTheme.titleMedium),
                onPressed: () {
                  MaterialPageRoute route=MaterialPageRoute(builder: (ctx)=>DetailPage(user: user));
                  Navigator.push(context, route);
                },
              ),

            ],
          ),

      ),


    );
    
  }
  
}