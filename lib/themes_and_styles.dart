import 'package:flutter/material.dart';
import 'literals.dart';
import 'widgets.dart';

RoundedRectangleBorder bottomRoundedRectangleBorder(double radius) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(radius),
      bottomRight: Radius.circular(radius),
    ),
  );
}

TextStyle appBarTitleTextStyle() {
  return TextStyle(
    color: black,
    fontSize: appBarTitleFontSize,
    fontWeight: appBarTitleFontWeight,
    fontFamily: appBarTitleFontFamily,
  );
}

BoxDecoration filterNotificationBadgeBoxDecoration() {
  return BoxDecoration(
    borderRadius:
        BorderRadiusDirectional.circular(filterButtonNotificationBadge / 2 + 1),
    color: cinnabar,
  );
}

TextStyle notificationBadgeTextStyle() {
  return TextStyle(
    fontFamily: notificationBadgeFontFamily,
    fontSize: notificationBadgeFontSize,
    color: isabelline,
  );
}

OutlineInputBorder searchBoxOutlineInputBorder() {
  return OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: searchBoxBorderRadius(searchBoxRadius),
  );
}

BorderRadius searchBoxBorderRadius(double radius) {
  return BorderRadius.horizontal(
    left: Radius.circular(radius),
    right: Radius.circular(radius),
  );
}

InputDecoration searchBoxInputDecoration() {
  return InputDecoration(
    isDense: true,
    fillColor: silver,
    contentPadding: EdgeInsets.zero,
    filled: true,
    focusedBorder: searchBoxOutlineInputBorder(),
    border: searchBoxOutlineInputBorder(),
    prefixIcon: const SearchBoxIcon(),
  );
}

BoxDecoration pokemonCardBoxDecoration() {
  return BoxDecoration(
    borderRadius: allCircularRoundBorder(pokemonCardBorderRadius),
    color: erieBlack,
  );
}

BorderRadius allCircularRoundBorder(double radius) {
  return BorderRadius.all(
    Radius.circular(radius),
  );
}

TextStyle pokemonNumberTextStyle() {
  return TextStyle(
      color: white,
      fontFamily: 'Roboto',
      fontSize: pokemonNumberFontStyle,
      fontWeight: pokemonNumberFontWeight);
}

TextStyle pokemonNameTextStyle() {
  return TextStyle(
      color: white,
      fontFamily: 'Roboto',
      fontSize: pokemonNameFontSize,
      fontWeight: pokemonNameFontWeight);
}

BoxDecoration filterCardBoxDecoration() {
  return BoxDecoration(
    color: isabelline,
    borderRadius: allCircularRoundBorder(20.0),
    boxShadow: kElevationToShadow[4],
  );
}

TextStyle subtitleTextStyle() {
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: Colors.black,
  );
}

RoundedRectangleBorder filterChipShape() {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.all(
      Radius.circular(4.0),
    ),
  );
}

TextStyle filterChipTextStyle() {
  return TextStyle(
    fontFamily: 'Roboto',
    fontSize: 16,
    fontWeight: FontWeight.w300,
  );
}

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
