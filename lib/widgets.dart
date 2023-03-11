import 'package:flutter/material.dart';
import 'filter_box.dart';
import 'literals.dart';
import 'themes_and_styles.dart';

// App Bar Widgets

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    required this.title,
    super.key,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: appBarTitleTextStyle(),
    );
  }
}

class NotificationBadge extends StatelessWidget {
  const NotificationBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: filterButtonNotificationBadge,
      width: filterButtonNotificationBadge,
      decoration: filterNotificationBadgeBoxDecoration(),
      child: const Center(
        child: NotificationBadgeText(),
      ),
    );
  }
}

class NotificationBadgeText extends StatelessWidget {
  const NotificationBadgeText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      filters.length.toString(),
      style: notificationBadgeTextStyle(),
    );
  }
}

Future<dynamic> filterDialogBoxCall(BuildContext context) {
  return showDialog(
    barrierColor: Colors.transparent,
    context: context,
    builder: (context) {
      return const FilterBox();
    },
  );
}

// Search Box

class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: erieBlack,
      cursorHeight: 20,
      onTapOutside: (event) {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus &&
            currentFocus.focusedChild != null) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      },
      decoration: searchBoxInputDecoration(),
    );
  }
}

class SearchBoxIcon extends StatelessWidget {
  const SearchBoxIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Icon(
      Icons.search,
      color: black,
    );
  }
}

// App Body Widgets

class PokemonNumber extends StatelessWidget {
  const PokemonNumber({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '#001',
      style: pokemonNumberTextStyle(),
    );
  }
}

class PokemonName extends StatelessWidget {
  const PokemonName({required this.index, super.key});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Text(
      names[index],
      style: pokemonNameTextStyle(),
    );
  }
}

class FilterCardHeading extends StatelessWidget {
  const FilterCardHeading({
    required this.heading,
    super.key,
  });

  final String heading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 0, 0, 13),
      child: Text(
        heading,
        style: subtitleTextStyle(),
      ),
    );
  }
}
