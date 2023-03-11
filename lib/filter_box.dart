import 'package:flutter/material.dart';
import 'package:pokedex/themes_and_styles.dart';
import 'package:pokedex/widgets.dart';

import 'literals.dart';

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
