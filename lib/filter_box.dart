import 'package:flutter/material.dart';
import 'literals.dart';

class FilterBox extends StatefulWidget {
  const FilterBox({
    super.key,
  });

  @override
  State<FilterBox> createState() => _FilterBoxState();
}

class _FilterBoxState extends State<FilterBox> {
  TextStyle subtitleTextStyle() {
    return const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 18,
      fontWeight: FontWeight.w500,
      color: Colors.black,
    );
  }

  RoundedRectangleBorder filterChipShape() {
    return const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(4.0),
      ),
    );
  }

  TextStyle filterChipTextStyle() {
    return const TextStyle(
      fontFamily: 'Roboto',
      fontSize: 16,
      fontWeight: FontWeight.w300,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(10, 7.0 + appBarToolbarHeight, 10, 0),
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          decoration: BoxDecoration(
            color: isabelline,
            borderRadius: const BorderRadius.all(
              Radius.circular(20.0),
            ),
            boxShadow: kElevationToShadow[4],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 13.0),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 0, 13),
                  child: Text(
                    'Filters',
                    style: subtitleTextStyle(),
                  ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 13),
                child: Text(
                  'Regions',
                  style: subtitleTextStyle(),
                ),
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
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 0, 0, 13),
                child: Text(
                  'Types',
                  style: subtitleTextStyle(),
                ),
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
                    padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 16),
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
