import 'package:flutter/material.dart';

class FittedBoxExample extends StatelessWidget {
  const FittedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    // FittedBox() objects takes all available space, and each FittedBox gets
    // the portion of space according to it's constraints.
    // SizedBox() instead has fixed height/width.
    // FittedBox() is useful when you want to have a widget with a fixed aspect
    return Center(
      child: FittedBox(
        child: Container(
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(20.0),
          color: Colors.purple,
          child: const Text(
            'FittedBox makes the text fit the box by shrinking it to the box size.',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 50),
          ),
        ),
      ),
    );
  }
}
