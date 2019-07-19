import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_dex/logout-button.dart';
import 'dart:convert';

import 'package:pokemon_dex/pokemon.dart';
import 'package:pokemon_dex/pokemonDetails.dart';

class PokeList extends StatefulWidget {
  @override
  _PokeListState createState() => _PokeListState();
}

class _PokeListState extends State<PokeList> {
  var apiUrl =
      'https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json';

  PokemonList pokemonList;

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var response = await http.get(apiUrl);
    var decodeJson = jsonDecode(response.body);

    pokemonList = PokemonList.fromJson(decodeJson);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('PokeDex'),
          backgroundColor: Colors.red,
          actions: <Widget>[
            LogoutButton(),
          ],
        ),
        body: pokemonList == null
            ? Center(child: CircularProgressIndicator())
            : GridView.count(
                crossAxisCount: 2,
                children: pokemonList.pokemon
                    .map((poke) => Padding(
                          padding: const EdgeInsets.all(2),
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PokemonDetails(
                                            pokemon: poke,
                                          )));
                            },
                            child: Hero(
                              tag: poke.img,
                              child: Card(
                                elevation: 3,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Container(
                                      height: 100,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                        image: NetworkImage(poke.img),
                                      )),
                                    ),
                                    Text(
                                      poke.name,
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ))
                    .toList(),
              ));
  }
}
