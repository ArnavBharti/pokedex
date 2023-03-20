import 'package:flutter/material.dart';
import 'package:pokedex/pokeapi.dart';
import 'literals.dart';
import 'pokemons_details_screen.dart';

class PokemonListScreen extends StatelessWidget {
  const PokemonListScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: heightSizedBoxAppBarSeparator,
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(75, 24, 75, 32),
          height: searchBoxHeight,
          width: searchBoxWidth,
          child: TextField(
            cursorColor: erieBlack,
            cursorHeight: 20,
            onTapOutside: (event) {
              FocusScopeNode currentFocus = FocusScope.of(context);
              if (!currentFocus.hasPrimaryFocus &&
                  currentFocus.focusedChild != null) {
                FocusManager.instance.primaryFocus?.unfocus();
              }
            },
            decoration: InputDecoration(
              isDense: true,
              fillColor: silver,
              contentPadding: EdgeInsets.zero,
              filled: true,
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(searchBoxRadius),
                  right: Radius.circular(searchBoxRadius),
                ),
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.horizontal(
                  left: Radius.circular(searchBoxRadius),
                  right: Radius.circular(searchBoxRadius),
                ),
              ),
              prefixIcon: const Icon(
                Icons.search,
                color: black,
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 1281, // LENGTH OF LIST
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PokemonDetails(
                        pokemonID: index,
                      ),
                    ),
                  );
                },
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(60, 0, 60, 44),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(pokemonCardBorderRadius),
                        ),
                        color: erieBlack,
                      ),
                      height: pokemonCardHeight,
                      width: pokemonCardWidth,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(28, 18, 0, 0),
                            child: Text(
                              generateNumber(index + 1),
                              style: TextStyle(
                                color: white,
                                fontFamily: pokemonNumberFontFamily,
                                fontSize: pokemonNumberFontStyle,
                                fontWeight: pokemonNumberFontWeight,
                              ),
                            ), // GENERATING NAMES
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(35, 13, 0, 0),
                            child: generateName(index + 1),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [], // IMPORT SVG !!!
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 32,
                      bottom: 44,
                      child: generateImage(index + 1),
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

  generateImage(int index) {
    late Future<Pokemon>? futurePokemon;
    futurePokemon = fetchPokemon(index);
    return FutureBuilder(
      future: futurePokemon,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              width: 150.0,
              child: Image.network(
                snapshot.data?.sprite ?? '',
                fit: BoxFit.fill,
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('Error');
        }
        return const CircularProgressIndicator();
      },
    );
  }

//   FutureBuilder<Pokemon> generateName(int index) {
  FutureBuilder<Pokemon> generateName(int index) {
    late Future<Pokemon>? futurePokemon;
    futurePokemon = fetchPokemon(index);

    return FutureBuilder<Pokemon>(
      future: futurePokemon,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.pokeName.capitalize(),
              style: TextStyle(
                color: white,
                fontFamily: pokemonNameFontFamily,
                fontSize: pokemonNameFontSize,
                fontWeight: pokemonNameFontWeight,
              ));
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}

String generateNumber(int index) {
  if (index < 10) {
    return '#000$index';
  } else if (index < 100) {
    return '#00$index';
  } else if (index < 1000) {
    return '#0$index';
  } else {
    return '#$index';
  }
}
