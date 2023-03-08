import 'package:flutter/material.dart';
import 'package:pokedex/widgets.dart';
import 'literals.dart';
import 'themes_and_styles.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Pokemon extends StatefulWidget {
  const Pokemon({super.key});

  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar('Bulbasaur'),
      backgroundColor: isabelline,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(
            height: 7,
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
                      Positioned(
                        bottom: 10,
                        child: Image.asset(
                          'images/bulbasaur.png',
                          scale: 0.7,
                        ),
                      ),
                      Positioned(
                        top: 40,
                        left: 30,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.white,
                              width: 2,
                            ),
                            color: const Color.fromRGBO(30, 30, 30, 0.57),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(3.0),
                            child: Text(
                              '#001',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize: 24,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white),
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
                        const Padding(
                          padding: EdgeInsets.fromLTRB(30, 10, 30, 30),
                          child: Text(
                            'A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 16,
                                fontWeight: FontWeight.w400),
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
                                child: Text(
                                  '0.7 m',
                                  style: normalTextStyle18,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  '6.9 kg',
                                  style: normalTextStyle18,
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
                                child: Text(
                                  'Seed',
                                  style: normalTextStyle18,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Text(
                                      'Overgrow',
                                      style: normalTextStyle18,
                                      textAlign: TextAlign.center,
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
                                children: const [
                                  statsCircularPercentIndicator(
                                    progressColor: Color(0xFF14CC60),
                                    percentage: 45,
                                    title: 'HP',
                                  ),
                                  statsCircularPercentIndicator(
                                    progressColor: Color(0xFFE4C811),
                                    percentage: 45,
                                    title: 'HP',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  statsCircularPercentIndicator(
                                    progressColor: Color(0xFFEF3E33),
                                    percentage: 49,
                                    title: 'Attack',
                                  ),
                                  statsCircularPercentIndicator(
                                    progressColor: Color(0xFF004E98),
                                    percentage: 49,
                                    title: 'Defense',
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: const [
                                  statsCircularPercentIndicator(
                                    progressColor: Color(0xFFC589E8),
                                    percentage: 60,
                                    title: 'Special\nAttack',
                                  ),
                                  statsCircularPercentIndicator(
                                    progressColor: Color(0xFF2589BD),
                                    percentage: 60,
                                    title: 'Special\nDefense',
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
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: evolutions.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.fromLTRB(
                                  95.0, 0.0, 95.0, 10.0),
                              child: Container(
                                height: 280,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    Container(
                                      width: 180,
                                      height: 220,
                                      decoration: BoxDecoration(
                                        color: erieBlack,
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: kElevationToShadow[4],
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          const Padding(
                                            padding: EdgeInsets.fromLTRB(
                                                20.0, 20.0, 0.0, 0.0),
                                            child: Text(
                                              '#001',
                                              style: TextStyle(
                                                  color: white,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.fromLTRB(
                                                44.0, 10, 44.0, 0.0),
                                            child: Text(
                                              evolutions[index],
                                              textAlign: TextAlign.center,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Roboto',
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w500),
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
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            startAngle: 180,
                            percent: 0.18,
                            lineWidth: 10,
                            backgroundColor: erieBlack,
                            progressColor: captureRateColor,
                            center: const Text(
                              '18%',
                              style: TextStyle(
                                  color: captureRateColor,
                                  fontFamily: 'Roboto',
                                  fontSize: 26,
                                  fontWeight: FontWeight.w700),
                            ),
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
}

class statsCircularPercentIndicator extends StatelessWidget {
  const statsCircularPercentIndicator({
    super.key,
    required this.progressColor,
    required this.percentage,
    required this.title,
  });

  final Color progressColor;
  final int percentage;
  final String title;

  @override
  Widget build(BuildContext context) {
    return CircularPercentIndicator(
      backgroundColor: erieBlack,
      progressColor: progressColor,
      lineWidth: 7,
      radius: 40,
      startAngle: 180,
      percent: percentage / 100,
      center: Text(
        percentage.toString(),
        style: TextStyle(
          fontFamily: 'Roboto',
          fontSize: 24,
          fontWeight: FontWeight.w700,
          color: progressColor,
        ),
      ),
      footer: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Roboto',
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
