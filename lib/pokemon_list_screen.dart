import 'package:flutter/material.dart';
import 'literals.dart';
import 'main.dart';
import 'pokemons_details_screen.dart';
import 'themes_and_styles.dart';
import 'widgets.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 7,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(75, 24, 75, 32),
          height: searchBoxHeight,
          width: searchBoxWidth,
          child: const SearchBox(),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Pokemon()),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(60, 0, 60, 44),
                      decoration: pokemonCardBoxDecoration(),
                      height: pokemonCardHeight,
                      width: pokemonCardWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.fromLTRB(28, 18, 0, 0),
                            child: PokemonNumber(),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 13, 0, 0),
                            child: PokemonName(
                              index: index,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [], // IMPORT SVG !!!
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 32,
                      bottom: 44,
                      child: Image.asset('images/bulbasaur.png'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
