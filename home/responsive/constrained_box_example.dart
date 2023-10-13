import 'package:flutter/material.dart';

class ConstrainedBoxExample extends StatelessWidget {
  const ConstrainedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    // ConstrainedBox() objects takes all available space, and each ConstrainedBox gets
    // the portion of space according to it's constraints.
    // SizedBox() instead has fixed height/width.
    // ConstrainedBox() is useful when you want to have a widget with a fixed aspect
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          minWidth: 100.0,
          minHeight: 100.0,
          maxWidth: 200.0,
          maxHeight: 200.0,
        ),
        child: Container(
          color: Colors.purple,
          margin: const EdgeInsets.all(20.0),
          alignment: Alignment.center,
          child: const Text(
            'ConstrainedBox minWidth=100, minHeight=100, maxWidth=200, maxHeight=200',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
