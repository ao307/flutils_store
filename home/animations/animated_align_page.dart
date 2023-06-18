import 'package:flutter/material.dart';

class AnimatedAlignPage extends StatefulWidget {
  const AnimatedAlignPage({super.key});

  @override
  State<AnimatedAlignPage> createState() => _AnimatedAlignPageState();
}

class _AnimatedAlignPageState extends State<AnimatedAlignPage> {
  bool _selected = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selected = !_selected;
          });
        },
        child: AnimatedAlign(
          duration: const Duration(seconds: 1),
          alignment: _selected ? Alignment.topRight : Alignment.bottomLeft,
          child: Container(
            height: 100,
            width: 100,
            color: Colors.purple,
          ),
        ),
      ),
    );
  }
}
