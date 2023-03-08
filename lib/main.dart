import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_list_screen.dart';
import 'literals.dart';
import 'widgets.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar(pokemonListTitle),
        backgroundColor: isabelline,
        body: const PokemonListScreen(),
      ),
    );
  }
}
