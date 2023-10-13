import 'package:flutter/material.dart';

class FractionallySizedBoxExample extends StatelessWidget {
  const FractionallySizedBoxExample({super.key});

  @override
  Widget build(BuildContext context) {
    // FractionallySizedBox() objects takes all available space, and each
    // FractionallySizedBox gets the portion of space according to it's widthFactor
    // and heightFactor.
    // SizedBox() instead has fixed height/width.
    // FractionallySizedBox() is useful when you want to have a widget with a fixed aspect ratio (width/height)
    return Center(
      child: FractionallySizedBox(
        widthFactor: 0.5,
        heightFactor: 0.5,
        child: Container(
          color: Colors.purple,
          alignment: Alignment.center,
          child: const Text(
            'FractionallySizedBox widthFactor=0.5, heightFactor=0.5',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
