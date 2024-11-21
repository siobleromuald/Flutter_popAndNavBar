

import 'package:flutter/material.dart';
import '../models/user.dart';

class DetailPage extends StatelessWidget{
  final User user;
  const DetailPage({super.key,required this.user});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.fullName),
        centerTitle: true,
        backgroundColor: user.couleur,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 75,
              backgroundColor: user.couleur,
              child: Text(user.initial),
            ),
            const SizedBox(height: 15,),
            Text(user.fullName,style: Theme.of(context).textTheme.headlineMedium,)
          ],
        ),
      ),
    );
  }
}