import 'package:flutter/material.dart';

class BodyPage extends StatefulWidget{
  const BodyPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BodyPageSate();
  }
}

class _BodyPageSate extends State<BodyPage>{

  IconData _iconData=Icons.person;
  int _count=0;
  Color _coleur=Colors.white;

  void _showSnackBar(){
    SnackBar _snackBar=  SnackBar(
      content: const Text("Voici le plus beau SnackBar", style: TextStyle(fontSize: 24),),
      backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      elevation: 5,
      margin: const EdgeInsets.all(8),
      behavior: SnackBarBehavior.floating,
      showCloseIcon: true,
      duration: const Duration(seconds: 5),
    );
    ScaffoldMessenger.of(context).showSnackBar(_snackBar);
  }

  void _showSimpleDialog(){
    showDialog(
        context: context,
        builder: (BuildContext _context){
          return SimpleDialog(
            title: const Text("Change icone"),
            children: [
              _dialogButton(text: "Home", iconData: Icons.home),
              _dialogButton(text: "Personne", iconData: Icons.person),
            ],
          );
        }
    );
  }
  TextButton _dialogButton({required String text, required IconData iconData}){
    return TextButton(
        onPressed: (){
          setState(() {
            _iconData=iconData;
            Navigator.pop(context);
          });
        },
        child: Row(
          children: [
            Icon(iconData),
            Text(text)
          ],
        )
    );
  }

  void _alertDialog(){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext _context){
          return AlertDialog(
            title: const Text("Incrémentation"),
            content: const Text("Etes-vous sûr de vouloir incrémenter?"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: const Text("Annuler")
              ),

              TextButton(
                  onPressed: (){
                    setState(() {
                      _count++;
                    });
                    Navigator.pop(context);
                  },
                  child: const Text("Oui")
              ),
            ],
          );
        }
    );
  }

  TextButton bottomSheetButton({required String texte, required Color couleur}){
    return TextButton(
        onPressed: (){
          setState(() {
            _coleur=couleur;
            Navigator.pop(context);
          });
        },
        child: Text(texte)
    );
  }

  Column bottom(){
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        const Text("Changer la couleur du bouton"),
        const Divider(),
        bottomSheetButton(texte: "Rose",couleur: Colors.pink.shade100),
        bottomSheetButton(texte: "Vert",couleur: Colors.green.shade100),
        bottomSheetButton(texte: "Blanc",couleur: Colors.white),
      ],
    );
  }




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return Center(
     child: Column(
       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
       children: [
         ElevatedButton(
             onPressed: _showSnackBar,
             child: const Text("Montrer un Snackbar",style: TextStyle(fontSize: 20),)
         ),

         ElevatedButton(
             onPressed: _showSimpleDialog,
             child: const Text("Simple Dialog",style: TextStyle(fontSize: 20),)
         ),
         Icon(_iconData, color: Theme.of(context).colorScheme.primary,size: 50,),

         ElevatedButton(
             onPressed: _alertDialog,
             child:  Text("Vous avez confirmé: $_count fois",style: TextStyle(fontSize: 20),)
         ),
         ElevatedButton(
             style: ElevatedButton.styleFrom(
                 backgroundColor: _coleur
             ),
             onPressed:(){
               showModalBottomSheet(
                   context: context,
                   builder: (BuildContext _context){
                     return Container(
                       height: 200,
                       width: MediaQuery.of(context).size.width,
                       //color: _coleur,
                       child: bottom(),
                     );
                   }
               );
             },
             child: const Text("Bottom Sheet Modale",style: TextStyle(fontSize: 20),)
         ),
         ElevatedButton(
             onPressed: (){
               Scaffold.of(context).showBottomSheet((BuildContext context)
               {
                 return bottom();
               }
               );
             },
             child: const Text("Persistante",style: TextStyle(fontSize: 20))
         )
       ],
     ),
   );
  }
}