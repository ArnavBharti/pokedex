import 'package:flutter/material.dart';
import 'package:pokedex/pokeapi.dart';
import 'package:pokedex/pokemon_list_screen.dart';
import 'literals.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PokemonDetails extends StatefulWidget {
  const PokemonDetails({super.key, required this.pokemonID});
  final int pokemonID;

  @override
  State<PokemonDetails> createState() => _PokemonDetailsState();
}

class _PokemonDetailsState extends State<PokemonDetails> {
  late Future<Pokemon>? futurePokemon;
  late Future<PokemonSpecies>? futurePokemonSpecies;
  late Future<PokemonEvo>? futurePokemonEvo;

  @override
  void initState() {
    super.initState();
    futurePokemon = fetchPokemon(widget.pokemonID + 1);
    futurePokemonSpecies = fetchPokemonSpecies(widget.pokemonID + 1);
    futurePokemonEvo = fetchPokemonEvo(widget.pokemonID + 1);
  }

  @override
  Widget build(BuildContext context) {
    var boxDecoration = BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        color: isabelline,
        boxShadow: kElevationToShadow[2]);

    var titleTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      fontWeight: FontWeight.w700,
      fontSize: 24,
    );

    var subtitleInfoTextStyle = const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );

    var normalTextStyle18 = const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );

    return Scaffold(
      appBar: appBarDetailsScreen(context),
      backgroundColor: isabelline,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: heightSizedBoxAppBarSeparator,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 300,
                  margin: const EdgeInsets.only(bottom: 15.0),
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      image: AssetImage('images/background-day 1.png'),
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    ),
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      FutureBuilder(
                        future: futurePokemon,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Positioned(
                              bottom: -50,
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                  width: 300.0,
                                  child: Image.network(
                                    snapshot.data?.sprite ?? '',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            return const Text('Error');
                          }
                          return const CircularProgressIndicator();
                        },
                      ),
                      Positioned(
                        top: 40,
                        left: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: white,
                              width: 2,
                            ),
                            color: const Color.fromRGBO(30, 30, 30, 0.57),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              generateNumber(widget.pokemonID + 1),
                              style: const TextStyle(
                                color: white,
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: Container(
                    decoration: boxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Description',
                            style: titleTextStyle,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                          child: FutureBuilder(
                            future: futurePokemonSpecies,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return Text(
                                  snapshot.data?.flavorText ?? '',
                                  style: TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }
                              return const CircularProgressIndicator();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: Container(
                    decoration: boxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Info',
                            style: titleTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  'Height',
                                  style: subtitleInfoTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Weight',
                                  style: subtitleInfoTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: FutureBuilder<Pokemon>(
                                  future: futurePokemon,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        '${snapshot.data!.height / 10} m',
                                        style: normalTextStyle18,
                                        textAlign: TextAlign.center,
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('${snapshot.error}');
                                    }

                                    // By default, show a loading spinner.
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ),
                              Expanded(
                                child: FutureBuilder<Pokemon>(
                                  future: futurePokemon,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        '${snapshot.data!.weight / 10} kg',
                                        style: normalTextStyle18,
                                        textAlign: TextAlign.center,
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('${snapshot.error}');
                                    }

                                    // By default, show a loading spinner.
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Text(
                                  'Category',
                                  style: subtitleInfoTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Abilities',
                                  style: subtitleInfoTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: FutureBuilder<Pokemon>(
                                  future: futurePokemon,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      return Text(
                                        snapshot.data!.pokeType.capitalize(),
                                        style: normalTextStyle18,
                                        textAlign: TextAlign.center,
                                      );
                                    } else if (snapshot.hasError) {
                                      return Text('${snapshot.error}');
                                    }

                                    // By default, show a loading spinner.
                                    return const CircularProgressIndicator();
                                  },
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    FutureBuilder<Pokemon>(
                                      future: futurePokemon,
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data!.ability.capitalize(),
                                            style: normalTextStyle18,
                                            textAlign: TextAlign.center,
                                          );
                                        } else if (snapshot.hasError) {
                                          return Text('${snapshot.error}');
                                        }

                                        // By default, show a loading spinner.
                                        return const CircularProgressIndicator();
                                      },
                                    ),
                                    const Positioned(
                                      right: 8,
                                      child: Icon(
                                        Icons.help,
                                        size: 20.0,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: Container(
                    decoration: boxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Stats',
                            style: titleTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FutureBuilder<Pokemon>(
                                    future: futurePokemon,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CircularPercentIndicator(
                                          backgroundColor: erieBlack,
                                          progressColor:
                                              const Color(0xFF14CC60),
                                          lineWidth: 7,
                                          radius: 40,
                                          startAngle: 180,
                                          percent:
                                              (snapshot.data?.pokeHP ?? 0) /
                                                  (714),
                                          center: Text(
                                            snapshot.data!.pokeHP.toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF14CC60),
                                            ),
                                          ),
                                          footer: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'HP',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }

                                      // By default, show a loading spinner.
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                  FutureBuilder<Pokemon>(
                                    future: futurePokemon,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CircularPercentIndicator(
                                          backgroundColor: erieBlack,
                                          progressColor:
                                              const Color(0xFFE4C811),
                                          lineWidth: 7,
                                          radius: 40,
                                          startAngle: 180,
                                          percent:
                                              (snapshot.data?.pokeHP ?? 0) /
                                                  (504),
                                          center: Text(
                                            snapshot.data!.pokeSpeed.toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFE4C811),
                                            ),
                                          ),
                                          footer: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Speed',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }

                                      // By default, show a loading spinner.
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FutureBuilder<Pokemon>(
                                    future: futurePokemon,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CircularPercentIndicator(
                                          backgroundColor: erieBlack,
                                          progressColor:
                                              const Color(0xFFEF3E33),
                                          lineWidth: 7,
                                          radius: 40,
                                          startAngle: 180,
                                          percent:
                                              (snapshot.data?.pokeAttack ?? 0) /
                                                  (504),
                                          center: Text(
                                            snapshot.data!.pokeAttack
                                                .toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFEF3E33),
                                            ),
                                          ),
                                          footer: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Attack',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }

                                      // By default, show a loading spinner.
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                  FutureBuilder<Pokemon>(
                                    future: futurePokemon,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CircularPercentIndicator(
                                          backgroundColor: erieBlack,
                                          progressColor:
                                              const Color(0xFF004E98),
                                          lineWidth: 7,
                                          radius: 40,
                                          startAngle: 180,
                                          percent:
                                              (snapshot.data!.pokeDefense) /
                                                  (614),
                                          center: Text(
                                            snapshot.data!.pokeDefense
                                                .toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF004E98),
                                            ),
                                          ),
                                          footer: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Defense',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }

                                      // By default, show a loading spinner.
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  FutureBuilder<Pokemon>(
                                    future: futurePokemon,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CircularPercentIndicator(
                                          backgroundColor: erieBlack,
                                          progressColor:
                                              const Color(0xFFC589E8),
                                          lineWidth: 7,
                                          radius: 40,
                                          startAngle: 180,
                                          percent: (snapshot.data
                                                      ?.pokeSpecialAttack ??
                                                  0) /
                                              (504),
                                          center: Text(
                                            snapshot.data!.pokeSpecialAttack
                                                .toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFFC589E8),
                                            ),
                                          ),
                                          footer: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Special\nAttack',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }

                                      // By default, show a loading spinner.
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                  FutureBuilder<Pokemon>(
                                    future: futurePokemon,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return CircularPercentIndicator(
                                          backgroundColor: erieBlack,
                                          progressColor:
                                              const Color(0xFF2589BD),
                                          lineWidth: 7,
                                          radius: 40,
                                          startAngle: 180,
                                          percent: (snapshot.data
                                                      ?.pokeSpecialDefense ??
                                                  0) /
                                              (614),
                                          center: Text(
                                            snapshot.data!.pokeSpecialDefense
                                                .toString(),
                                            style: const TextStyle(
                                              fontFamily: 'Roboto',
                                              fontSize: 24,
                                              fontWeight: FontWeight.w700,
                                              color: Color(0xFF2589BD),
                                            ),
                                          ),
                                          footer: const Padding(
                                            padding: EdgeInsets.all(10.0),
                                            child: Text(
                                              'Special\nDefense',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: 'Roboto',
                                                fontSize: 18,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        return Text('${snapshot.error}');
                                      }

                                      // By default, show a loading spinner.
                                      return const CircularProgressIndicator();
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: Container(
                    decoration: boxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 35.0),
                          child: Text(
                            'Evolutions',
                            style: titleTextStyle,
                          ),
                        ),
                        FutureBuilder(
                          future: futurePokemonEvo,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              return ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: snapshot.data!.evoChain.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        95.0, 0.0, 95.0, 10.0),
                                    child: SizedBox(
                                      height: 280,
                                      child: Stack(
                                        alignment: Alignment.center,
                                        children: [
                                          Container(
                                            width: 180,
                                            height: 220,
                                            decoration: BoxDecoration(
                                              color: erieBlack,
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              boxShadow: kElevationToShadow[4],
                                            ),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.stretch,
                                              // ignore: sort_child_properties_last
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          20.0, 20.0, 0.0, 0.0),
                                                  child: Text(
                                                    generateNumber(index + 1),
                                                    style: const TextStyle(
                                                        color: white,
                                                        fontFamily: 'Roboto',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                ),
                                                // ignore: prefer_const_constructors
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          44.0, 10, 44.0, 0.0),
                                                  child: Text(
                                                    snapshot
                                                        .data!.evoChain[index]
                                                        .capitalize(),
                                                    style: const TextStyle(
                                                      color: white,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                                Row(
                                                  children: const [],
                                                ),
                                              ],
                                            ),
                                          ),
                                          Positioned(
                                              bottom: 0,
                                              child: Image.asset(
                                                  'images/bulbasaur.png')),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            } else if (snapshot.hasError) {
                              return Text('${snapshot.error}');
                            }
                            return const CircularProgressIndicator();
                          },
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 15),
                  child: Container(
                    decoration: boxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 0.0),
                          child: Text(
                            'Capture Rate',
                            style: titleTextStyle,
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(bottom: 35.0, top: 25.0),
                          child: FutureBuilder<PokemonSpecies>(
                            future: futurePokemonSpecies,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                return CircularPercentIndicator(
                                  backgroundColor: erieBlack,
                                  progressColor: captureRateColor,
                                  lineWidth: 10,
                                  radius: 60.0,
                                  startAngle: 180,
                                  percent:
                                      (snapshot.data?.captureRate ?? 0) / (255),
                                  center: Text(
                                    '${((snapshot.data?.captureRate ?? 0) / (255) * 100).toStringAsFixed(2)}%',
                                    style: const TextStyle(
                                      fontFamily: 'Roboto',
                                      fontSize: 24,
                                      fontWeight: FontWeight.w700,
                                      color: captureRateColor,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                return Text('${snapshot.error}');
                              }

                              // By default, show a loading spinner.
                              return const CircularProgressIndicator();
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBarDetailsScreen(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: isabelline,
      toolbarHeight: appBarToolbarHeight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(appBarShapeRadius),
          bottomRight: Radius.circular(appBarShapeRadius),
        ),
      ),
      title: FutureBuilder<Pokemon>(
        future: futurePokemon,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.pokeName.capitalize(),
                style: TextStyle(
                  color: black,
                  fontSize: appBarTitleFontSize,
                  fontWeight: appBarTitleFontWeight,
                  fontFamily: appBarTitleFontFamily,
                ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }

          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        },
      ),
      leading: Align(
        alignment: Alignment.center,
        child: Container(
          padding: EdgeInsets.zero,
          height: appBarLeaderSize,
          width: appBarLeaderSize,
          child: IconButton(
            color: black,
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
