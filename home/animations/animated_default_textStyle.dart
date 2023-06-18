import 'package:flutter/material.dart';

class AnimatedDefaultTextStylePage extends StatefulWidget {
  const AnimatedDefaultTextStylePage({super.key});

  @override
  State<AnimatedDefaultTextStylePage> createState() =>
      _AnimatedDefaultTextStylePageState();
}

class _AnimatedDefaultTextStylePageState
    extends State<AnimatedDefaultTextStylePage> {
  bool _selected = false;
  double _fontSize = 20;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selected = !_selected;
            _fontSize = _selected ? 30 : 20;
          });
        },
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 1),
          style: TextStyle(
            fontSize: _fontSize,
            fontWeight: FontWeight.bold,
          ),
          child: const Text('Click Me!'),
        ),
      ),
    );
  }
}
