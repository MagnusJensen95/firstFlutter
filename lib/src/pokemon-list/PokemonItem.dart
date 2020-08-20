import 'package:flutter/material.dart';
class PokemonItem extends StatelessWidget {

  final String name;
  final String url;

  PokemonItem(this.name, this.url);


  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       Text('$name'),
       Image(image: NetworkImage(url),),
     ]
      ,
    );
  }
}
