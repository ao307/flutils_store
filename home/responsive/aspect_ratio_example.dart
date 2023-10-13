import 'package:flutter/material.dart';

class AspectRatioExample extends StatelessWidget {
  const AspectRatioExample({super.key});

  @override
  Widget build(BuildContext context) {
    // AspectRatio() objects takes all available space, and each AspectRatio gets
    // the portion of space according to it's aspectRatio.
    // SizedBox() instead has fixed height/width.
    // AspectRatio() is useful when you want to have a widget with a fixed aspect
    return Center(
      child: AspectRatio(
        aspectRatio: 1.6,
        child: Container(
          margin: const EdgeInsets.all(20.0),
          color: Colors.purple,
          alignment: Alignment.center,
          child: const Text('Aspect Ratio 1.6'),
        ),
      ),
    );
  }
}
