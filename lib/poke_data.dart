import 'pokeapi.dart';

Map<int, Pokemon> pokemonList = {};

createPokeList() {
  for (int i = 1; i <= 151; i++) {
    // fetchPokemon(i).then((value) {
    //   pokemonList.add(value);
    // });
    fetchPokemon(i).then((value) {
      pokemonList[i] = value;
    });
  }
   return pokemonList;
}

Future<void> main(List<String> args) async {
  var pokemonMap = createPokeList();
  for (int i = 1; i <= 151; i++) {
    print(pokemonMap[i]?.pokeID);
  }
}
