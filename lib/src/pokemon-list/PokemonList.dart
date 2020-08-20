

import 'dart:convert';

import 'package:firstFlutter/src/pokemon-list/PokemonItem.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class PokemonList extends StatefulWidget {

PokemonList(this.pokemonList) : super();


PokemonList.fromJson(Map<String, dynamic> json) 
: this.pokemonList = json['results'];

final List<PokemonItem> pokemonList;

@override
PokemonListState createState() => PokemonListState();
}

class PokemonListState extends State<PokemonList> {

  Future<PokemonList> futureList; 

  

Future<PokemonList> fetchPokemon() async {
  const pokemonUrl = 'https://pokeapi.co/api/v2/pokemon';
  final response = await http.get(pokemonUrl);

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
   return PokemonList.fromJson(json.decode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load pokemon');
  } 
}

@override
void initState() {
    super.initState();
   futureList = fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(builder: (_context, snapshot) {
      if (snapshot.hasData) {
        var name = snapshot.data.name;
        var url = snapshot.data.url;
        return Center(child: PokemonItem(name, url), heightFactor: 2,);
      }
      else return CircularProgressIndicator();
      }, future: futureList);

  }
}