import 'package:flutter/material.dart';
import 'package:pokemon_dex/pokemon.dart';

class PokemonDetails extends StatelessWidget {
  final Pokemon pokemon;

  PokemonDetails({this.pokemon});

  bodyWidget(context) => Stack(
        children: <Widget>[
          Positioned(
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width - 20,
            left: 10,
            top: MediaQuery.of(context).size.height * 0.1,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    pokemon.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('Height: ${pokemon.height}'),
                  Text('Height: ${pokemon.weight}'),
                  Text('Types'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.type
                        .map((type) => FilterChip(
                            backgroundColor: Colors.purple,
                            label: Text(type,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            onSelected: (boolean) {}))
                        .toList(),
                  ),
                  Text('Weakness'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.weaknesses
                        .map((weak) => FilterChip(
                            backgroundColor: Colors.orange,
                            label: Text(weak,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            onSelected: (boolean) {}))
                        .toList(),
                  ),
                  Text('Next Evolution'),
                  pokemon.nextEvolution == null ? FilterChip(label: Text('Doesnt have Evolution'), onSelected: (t){}) :
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: pokemon.nextEvolution
                        .map((evo) => FilterChip(
                            backgroundColor: Colors.blue,
                            label: Text(evo.name,
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                            onSelected: (boolean) {}))
                        .toList(),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Hero(
              tag: pokemon.img,
              child: Container(
                height: 200,
                width: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(pokemon.img)),
                ),
              ),
            ),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        elevation: 0,
        title: Text(pokemon.name),
        backgroundColor: Colors.red,
      ),
      body: bodyWidget(context),
    );
  }
}
