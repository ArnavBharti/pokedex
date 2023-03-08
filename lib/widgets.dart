import 'package:flutter/material.dart';
import 'literals.dart';
import 'themes_and_styles.dart';

// App Bar Widgets

AppBar appBar(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: isabelline,
    toolbarHeight: appBarToolbarHeight,
    shape: bottomRoundedRectangleBorder(appBarShapeRadius),
    title: AppBarTitle(title: title),
    leading: const AppBarLeader(),
  );
}

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

class AppBarLeader extends StatelessWidget {
  const AppBarLeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Align(
      alignment: Alignment.center,
      child: FilterButton(),
    );
  }
}

class FilterButton extends StatefulWidget {
  const FilterButton({
    super.key,
  });

  @override
  State<FilterButton> createState() => _FilterButtonState();
}

class _FilterButtonState extends State<FilterButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.zero,
      height: appBarLeaderSize,
      width: appBarLeaderSize,
      child: Stack(
        alignment: Alignment.center,
        children: const [
          FilterIconButton(),
          Positioned(
            top: 10.0,
            right: 10.0,
            child: NotificationBadge(),
          ),
        ],
      ),
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

class FilterIconButton extends StatelessWidget {
  const FilterIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: black,
      icon: filterIcon,
      onPressed: () {
        filterDialogBoxCall(context);
      },
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
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 7.0 + appBarToolbarHeight, 10, 0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: filterCardBoxDecoration(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 13.0),
                child: FilterCardHeading(
                  heading: 'Filters',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 13.0),
                child: SizedBox(
                  height: 32,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: filters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Material(
                        color: isabelline,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: FilterChip(
                              padding: EdgeInsets.zero,
                              selectedColor: filterChipSelected,
                              showCheckmark: false,
                              selected: filtersSelected[index],
                              label: Text(filters[index]),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              side: BorderSide.none,
                              shape: filterChipShape(),
                              pressElevation: 0.0,
                              labelStyle: filterChipTextStyle(),
                              elevation: 4,
                              onSelected: (bool selected) {
                                setState(() {
                                  filtersSelected[index] = selected;
                                });
                              }),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const FilterCardHeading(
                heading: 'Regions',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 13.0),
                child: SizedBox(
                  height: 32,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: regions.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Material(
                        color: isabelline,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: FilterChip(
                              padding: EdgeInsets.zero,
                              selectedColor: filterChipSelected,
                              showCheckmark: false,
                              selected: regionsSelected[index],
                              label: Text(regions[index]),
                              labelPadding:
                                  const EdgeInsets.symmetric(horizontal: 6.0),
                              side: BorderSide.none,
                              shape: filterChipShape(),
                              pressElevation: 0.0,
                              labelStyle: filterChipTextStyle(),
                              elevation: 4,
                              onSelected: (bool selected) {
                                setState(() {
                                  regionsSelected[index] = selected;
                                });
                              }),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const FilterCardHeading(
                heading: 'Types',
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 13.0),
                child: SizedBox(
                  height: 39,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: types.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Material(
                        color: isabelline,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 19),
                          child: FilterChip(
                              padding: EdgeInsets.zero,
                              selectedColor: filterChipSelected,
                              showCheckmark: false,
                              selected: typesSelected[index],
                              label: Row(
                                children: [
                                  const Icon(
                                      Icons.energy_savings_leaf), // SVG !!
                                  Text(types[index]),
                                ],
                              ),
                              labelPadding: const EdgeInsets.symmetric(
                                horizontal: 6.0,
                              ),
                              side: BorderSide.none,
                              shape: filterChipShape(),
                              pressElevation: 0.0,
                              labelStyle: filterChipTextStyle(),
                              elevation: 4,
                              onSelected: (bool selected) {
                                setState(() {
                                  typesSelected[index] = selected;
                                });
                              }),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.fromLTRB(16, 3, 16, 3),
                    margin: EdgeInsets.fromLTRB(0, 15, 0, 16),
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.horizontal(
                        left: Radius.circular(20),
                        right: Radius.circular(20),
                      ),
                      color: Color(0xFFEF3E33),
                    ),
                    child: const Text(
                      'Apply',
                      style: TextStyle(
                          color: black,
                          fontFamily: 'Roboto',
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
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
