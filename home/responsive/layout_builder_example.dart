import 'package:flutter/material.dart';

class LayoutBuilderExample extends StatelessWidget {
  const LayoutBuilderExample({super.key});

  @override
  Widget build(BuildContext context) {
    // LayoutBuilder() is a widget that provides the parent widget constraints
    // to it's builder function.
    // In this example, we use it to decide which layout to use according to
    // the screen width.
    // We could also use MediaQuery.of(context).size.width, but LayoutBuilder is more efficient.
    return LayoutBuilder(
      builder: (context, constraints) {
        return Center(
          child: Text(
            'Screen sizes\nHeight: ${constraints.maxHeight}\nWidth: ${constraints.maxWidth}',
            textAlign: TextAlign.start,
            style: const TextStyle(fontSize: 20.0),
          ),
        );
      },
    );
  }
}
