import 'package:flutter/material.dart';

class ListWheelScrollViewExample extends StatefulWidget {
  const ListWheelScrollViewExample({super.key});

  @override
  State<ListWheelScrollViewExample> createState() =>
      _ListWheelScrollViewExampleState();
}

class _ListWheelScrollViewExampleState
    extends State<ListWheelScrollViewExample> {
  final List<String> cities = [
    'Cairo',
    'London',
    'New York',
    'Paris',
    'Tokyo',
    'Dubai',
    'Rome',
    'Berlin',
    'Beijing',
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListWheelScrollView.useDelegate(
        itemExtent: 120,
        diameterRatio: 1.5,
        childDelegate: ListWheelChildLoopingListDelegate(
          children: List.generate(
            cities.length,
            (index) => Center(
              child: Text(
                cities[index],
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: index == _selectedIndex
                      ? Colors.purple
                      : Colors.grey[400],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedIndex = index % cities.length;
          });
        },
      ),
    );
  }
}
