import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPokemon(int Id) async {
  final response = await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$Id/'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Pokemon');
  }
}

class Pokemon {
  final String pokeName;
  final int pokeID;
  final int pokeHP;
  final int pokeSpeed;
  final int pokeAttack;
  final int pokeDefense;
  final int pokeSpecialAttack;
  final int pokeSpecialDefense;
  final int height;
  final int weight;
  final String pokeType;
  final String ability;

  const Pokemon({
    required this.pokeName,
    required this.pokeID,
    required this.pokeHP,
    required this.pokeSpeed,
    required this.pokeAttack,
    required this.pokeDefense,
    required this.pokeSpecialAttack,
    required this.pokeSpecialDefense,
    required this.height,
    required this.weight,
    required this.pokeType,
    required this.ability,
  });

  factory Pokemon.fromJson(Map<String, dynamic> json) {
    return Pokemon(
      pokeName: json['name'],
      pokeID: json['id'],
      pokeHP: json['stats'][0]['base_stat'],
      pokeSpeed: json['stats'][5]['base_stat'],
      pokeAttack: json['stats'][1]['base_stat'],
      pokeDefense: json['stats'][2]['base_stat'],
      pokeSpecialAttack: json['stats'][3]['base_stat'],
      pokeSpecialDefense: json['stats'][4]['base_stat'],
      height: json['height'],
      weight: json['weight'],
      pokeType: json['types'][0]['type']['name'],
      ability: json['abilities'][0]['ability']['name'],
    );
  }
}
