import 'dart:convert';
import 'package:http/http.dart' as http;

Future<Pokemon> fetchPokemon(int id) async {
  final response =
      await http.get(Uri.parse('https://pokeapi.co/api/v2/pokemon/$id/'));

  if (response.statusCode == 200) {
    return Pokemon.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Pokemon');
  }
}

Future<PokemonSpecies> fetchPokemonSpecies(int id) async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/pokemon-species/$id/'));

  if (response.statusCode == 200) {
    return PokemonSpecies.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Pokemon');
  }
}

Future<PokemonEvo> fetchPokemonEvo(int id) async {
  final response = await http
      .get(Uri.parse('https://pokeapi.co/api/v2/evolution-chain/$id/'));

  if (response.statusCode == 200) {
    return PokemonEvo.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load Pokemon');
  }
}

class PokemonEvo {
  final List<String> evoChain;

  const PokemonEvo({
    required this.evoChain,
  });

  factory PokemonEvo.fromJson(Map<String, dynamic> json) {
    List<String> evoChain = [json['chain']['species']['name']];
    for (var i = 0; i < json['chain']['evolves_to'].length; i++) {
      evoChain.add(json['chain']['evolves_to'][i]['species']['name']);
      if (json['chain']['evolves_to'][i]['evolves_to'].length > 0) {
        evoChain.add(
            json['chain']['evolves_to'][i]['evolves_to'][0]['species']['name']);
      }
    }
    return PokemonEvo(
      evoChain: evoChain,
    );
  }
}

class PokemonSpecies {
  final int captureRate;
  final String flavorText;

  const PokemonSpecies({
    required this.captureRate,
    required this.flavorText,
  });

  factory PokemonSpecies.fromJson(Map<String, dynamic> json) {
    return PokemonSpecies(
      captureRate: json['capture_rate'],
      flavorText: json['flavor_text_entries'][0]['flavor_text'],
    );
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
  final String pokeDescription;
  final String sprite;

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
    required this.pokeDescription,
    required this.sprite,
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
      pokeDescription: '',
      sprite: json['sprites']['front_default'],
    );
  }
}
