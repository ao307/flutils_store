import 'package:flutter/material.dart';

class ExpandedExample extends StatelessWidget {
  const ExpandedExample({super.key});

  @override
  Widget build(BuildContext context) {
    // Expanded() objects takes all available space, and each Expanded gets the
    // portion of space according to it's flex.
    // SizedBox() instead has fixed height/width.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          child: Container(
            alignment: Alignment.center,
            color: Colors.red,
            child: const Text(
              'Item1: flex=1',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            color: Colors.green,
            child: const Text(
              'Item2: flex=2',
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Expanded(
          flex: 3,
          child: Container(
            alignment: Alignment.center,
            color: Colors.purple,
            child: const Text('Item3, flex=3', textAlign: TextAlign.center),
          ),
        ),
      ],
    );
  }
}
