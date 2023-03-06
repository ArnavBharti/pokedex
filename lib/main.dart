import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MainApp());
}

var evolutions = [
  'Bulbasaur',
  'Ivysaur',
  'Venosaur',
];
var filters = [];
var regions = [
  'National',
  'Kanto',
  'Johto',
  'Sinnoh',
];
var types = [
  'Grass',
  'Grass',
  'Grass',
  'Grass',
];
var names = [
  'Bulbasaur',
  'Bulbasaur',
  'Bulbasaur',
  'Bulbasaur',
  'Bulbasaur',
];
var filtersSelected = [false, false, false, false];
var regionsSelected = [false, false, false, false];
var typesSelected = [false, false, false, false];
const Color isabelline = Color(0xFFF6F0ED);
const Color erieBlack = Color(0xFF1E1E1E);
const Color captureRateColor = Color(0xff09BC8A);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: isabelline,
          toolbarHeight: 66,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          title: Text(
            'Pokedex',
            style: TextStyle(
              color: Color(0xFF000000),
              fontSize: 28,
              fontWeight: FontWeight.w700,
              fontFamily: 'Roboto',
            ),
          ),
          leading: FilterButton(),
        ),
        backgroundColor: Color(0xFFF6F0ED),
        body: Column(
          children: [
            SizedBox(
              height: 7,
            ),
            TextField(),
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
                    child: Container(
                      child: Stack(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Text('#001'),
                                ),
                                Text(
                                  names[index],
                                ),
                                Row(
                                  children: [],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var icon2 = Icon(Icons.filter_list);
    return IconButton(
      color: Colors.black,
      icon: icon2,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return FilterBox();
          },
        );
      },
    );
  }
}

class FilterBox extends StatefulWidget {
  const FilterBox({
    super.key,
  });

  @override
  State<FilterBox> createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 66),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Filters'),
          Container(
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: filters.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  child: FilterChip(
                      selected: filtersSelected[index],
                      label: Text(filters[index]),
                      onSelected: (bool selected) {
                        setState(() {
                          filtersSelected[index] = selected;
                        });
                      }),
                );
              },
            ),
          ),
          Text('Regions'),
          Container(
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: regions.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  child: FilterChip(
                      selected: regionsSelected[index],
                      label: Text(regions[index]),
                      onSelected: (bool selected) {
                        setState(() {
                          regionsSelected[index] = selected;
                        });
                      }),
                );
              },
            ),
          ),
          Text('Types'),
          Container(
            height: 30,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: types.length,
              itemBuilder: (BuildContext context, int index) {
                return Material(
                  child: FilterChip(
                      selected: typesSelected[index],
                      label: Text(types[index]),
                      onSelected: (bool selected) {
                        setState(() {
                          typesSelected[index] = selected;
                        });
                      }),
                );
              },
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              child: Text('Apply'),
            ),
          )
        ],
      ),
    );
  }
}

class Pokemon extends StatefulWidget {
  @override
  State<Pokemon> createState() => _PokemonState();
}

class _PokemonState extends State<Pokemon> {
  @override
  Widget build(BuildContext context) {
    var subtitleTextStyle = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w500,
    );
    var normalTextStyle18 = TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w400,
    );
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: isabelline,
        toolbarHeight: 66,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        title: Text(
          'Bulbasaur',
          style: TextStyle(
            color: Color(0xFF000000),
            fontSize: 28,
            fontWeight: FontWeight.w700,
            fontFamily: 'Roboto',
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: isabelline,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 7,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
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
                            color: Color.fromRGBO(30, 30, 30, 0.57),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
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
                  padding: const EdgeInsets.all(10.0),
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
                          padding: const EdgeInsets.fromLTRB(30, 10, 30, 30),
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
                  padding: const EdgeInsets.all(10.0),
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
                                  style: subtitleTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Weight',
                                  style: subtitleTextStyle,
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
                                  style: subtitleTextStyle,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Abilities',
                                  style: subtitleTextStyle,
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
                                    Positioned(
                                      right: 8,
                                      child: Icon(
                                        Icons.help,
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
                  padding: const EdgeInsets.all(10.0),
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
                                  CircularPercentIndicator(
                                    backgroundColor: erieBlack,
                                    progressColor: Color(0xFF14CC60),
                                    lineWidth: 7,
                                    radius: 40,
                                    startAngle: 180,
                                    percent: .45,
                                    center: Text(
                                      '45',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF14CC60),
                                      ),
                                    ),
                                    footer: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                  ),
                                  CircularPercentIndicator(
                                    backgroundColor: erieBlack,
                                    lineWidth: 7,
                                    progressColor: Color(0xFFE4C811),
                                    radius: 40,
                                    percent: .45,
                                    startAngle: 180,
                                    center: Text(
                                      '45',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFE4C811),
                                      ),
                                    ),
                                    footer: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircularPercentIndicator(
                                    backgroundColor: erieBlack,
                                    lineWidth: 7,
                                    radius: 40,
                                    startAngle: 180,
                                    progressColor: Color(0xFFEF3E33),
                                    percent: .49,
                                    center: Text(
                                      '49',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFEF3E33),
                                      ),
                                    ),
                                    footer: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                  ),
                                  CircularPercentIndicator(
                                    backgroundColor: erieBlack,
                                    lineWidth: 7,
                                    radius: 40,
                                    percent: .49,
                                    startAngle: 180,
                                    progressColor: Color(0xFF004E98),
                                    center: Text(
                                      '49',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF004E98),
                                      ),
                                    ),
                                    footer: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircularPercentIndicator(
                                    backgroundColor: erieBlack,
                                    lineWidth: 7,
                                    radius: 40,
                                    progressColor: Color(0xFFC589E8),
                                    startAngle: 180,
                                    percent: .60,
                                    center: Text(
                                      '60',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFFC589E8),
                                      ),
                                    ),
                                    footer: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                                  ),
                                  CircularPercentIndicator(
                                    backgroundColor: erieBlack,
                                    progressColor: Color(0xFF2589BD),
                                    lineWidth: 7,
                                    radius: 40,
                                    percent: .60,
                                    startAngle: 180,
                                    center: Text(
                                      '60',
                                      style: TextStyle(
                                        fontFamily: 'Roboto',
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        color: Color(0xFF2589BD),
                                      ),
                                    ),
                                    footer: Padding(
                                      padding: const EdgeInsets.all(10.0),
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
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: boxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
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
                              padding:
                                  const EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Container(
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Text(
                                                '#001',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Roboto',
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ),
                                          ),
                                          Text(
                                            evolutions[index],
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Roboto',
                                                fontSize: 20,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Row(
                                            children: [],
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
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    decoration: boxDecoration,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            'Capture Rate',
                            style: titleTextStyle,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 35),
                          child: CircularPercentIndicator(
                            radius: 60.0,
                            startAngle: 180,
                            percent: 0.18,
                            lineWidth: 10,
                            backgroundColor: erieBlack,
                            progressColor: captureRateColor,
                            center: Text(
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

var boxDecoration = BoxDecoration(
    borderRadius: BorderRadius.all(Radius.circular(20)),
    color: isabelline,
    boxShadow: kElevationToShadow[2]);
var titleTextStyle = TextStyle(
  fontFamily: 'Roboto',
  fontWeight: FontWeight.w700,
  fontSize: 24,
);
