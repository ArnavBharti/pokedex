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

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Hello World'),
          leading: FilterButton(),
        ),
        backgroundColor: Color(0xFFF6F0ED),
        body: Pokemons(),
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

class Pokemons extends StatefulWidget {
  @override
  State<Pokemons> createState() => _PokemonsState();
}

class _PokemonsState extends State<Pokemons> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Hello World'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              Container(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    child: Text('#001'),
                  ),
                  Row(
                    children: [],
                  )
                ],
              )
            ],
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Description'),
                Text(
                    'A strange seed was planted on its back at birth. The plant sprouts and grows with this POKéMON.')
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Info'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Height'),
                    Text('Weight'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('0.7 m'),
                    Text('6.9 kg'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Category'),
                    Text('Abilities'),
                  ],
                ),
                Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Seed'),
                        Text('Overgrow'),
                      ],
                    ),
                    Positioned(
                      right: 50,
                      child: Icon(Icons.help),
                    )
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Stats'),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularPercentIndicator(
                          radius: 40,
                          startAngle: 180,
                          percent: .45,
                          center: Text('45'),
                          footer: Text('HP'),
                        ),
                        CircularPercentIndicator(
                          radius: 40,
                          percent: .45,
                          startAngle: 180,
                          center: Text('45'),
                          footer: Text('HP'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularPercentIndicator(
                          radius: 40,
                          startAngle: 180,
                          percent: .49,
                          center: Text('49'),
                          footer: Text('Attack'),
                        ),
                        CircularPercentIndicator(
                          radius: 40,
                          percent: .49,
                          startAngle: 180,
                          center: Text('49'),
                          footer: Text('Defense'),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircularPercentIndicator(
                          radius: 40,
                          startAngle: 180,
                          percent: .60,
                          center: Text('60'),
                          footer: Text('Special Attack'),
                        ),
                        CircularPercentIndicator(
                          radius: 40,
                          percent: .60,
                          startAngle: 180,
                          center: Text('60'),
                          footer: Text('Special Defense'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Evolutions'),
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: evolutions.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Stack(
                        children: [
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  child: Text('#001'),
                                ),
                                Text(
                                  evolutions[index],
                                ),
                                Row(
                                  children: [],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Capture Rate'),
                Container(
                  child: CircularPercentIndicator(
                    radius: 60.0,
                    startAngle: 180,
                    percent: 0.18,
                    center: Text('18%'),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
