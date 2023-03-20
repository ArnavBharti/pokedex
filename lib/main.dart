import 'package:flutter/material.dart';
import 'package:pokedex/pokemon_list_screen.dart';
import 'filter_box.dart';
import 'literals.dart';

void main() {
  runApp(const PokedexApp());
}

class PokedexApp extends StatelessWidget {
  const PokedexApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: appBar(context),
        backgroundColor: isabelline,
        body: const PokemonListScreen(),
      ),
    );
  }
}

AppBar appBar(BuildContext context) {
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
    title: Text(
      pokemonListTitle,
      style: TextStyle(
        color: black,
        fontSize: appBarTitleFontSize,
        fontWeight: appBarTitleFontWeight,
        fontFamily: appBarTitleFontFamily,
      ),
    ),
    leading: Align(
      alignment: Alignment.center,
      child: Container(
        padding: EdgeInsets.zero,
        height: appBarLeaderSize,
        width: appBarLeaderSize,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Material(
              child: IconButton(
                color: black,
                icon: const Icon(Icons.filter_list),
                onPressed: () {
                  showDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return const FilterBox();
                    },
                  );
                },
              ),
            ),
            Positioned(
              top: 10.0,
              right: 10.0,
              child: Container(
                height: filterButtonNotificationBadge,
                width: filterButtonNotificationBadge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadiusDirectional.circular(
                      filterButtonNotificationBadge / 2 + 1),
                  color: cinnabar,
                ),
                child: Center(
                  child: Text(
                    filters.length.toString(),
                    style: TextStyle(
                      fontFamily: notificationBadgeFontFamily,
                      fontSize: notificationBadgeFontSize,
                      color: isabelline,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
