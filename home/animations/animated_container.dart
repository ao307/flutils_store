import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatefulWidget {
  const AnimatedContainerPage({super.key});

  @override
  State<AnimatedContainerPage> createState() => _AnimatedContainerPageState();
}

class _AnimatedContainerPageState extends State<AnimatedContainerPage> {
  double _width = 100;
  double _height = 100;
  Color _color = Colors.red;

  void _changeState() {
    setState(() {
      if (_width == 100) {
        _width = 200;
        _height = 200;
        _color = Colors.purple;
      } else {
        _width = 100;
        _height = 100;
        _color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          _changeState();
        },
        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          width: _width,
          height: _height,
          color: _color,
          child: const Center(
            child: Text(
              'Tap me!',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
