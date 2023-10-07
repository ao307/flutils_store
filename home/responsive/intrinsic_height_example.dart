import 'package:flutter/material.dart';

const largeTestText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
    'Sed nonne merninisti licere mihi ista probare, quae sunt a te dicta? '
    'Refert tamen, quo modo. Duo Reges: constructio interrete. ';

const smallTestText =
    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. ';

class IntrinsicHeightExample extends StatelessWidget {
  const IntrinsicHeightExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const Text(
          "IntrinsicHeight is commonly used when you want to enforce a consistent height for widgets within a Row. It works by finding the maximum intrinsic height among its children and then sizing all children to that maximum height, ensuring uniformity in the row's appearance. This can be helpful when you have various widgets in a row, such as Text and Image widgets, and you want them to align properly, maintaining a consistent height despite their varying content.",
          textAlign: TextAlign.start,
        ),
        const Divider(height: 60.0),
        const Text('Before IntrinsicHeight:'),
        const SizedBox(height: 16.0),
        SizedBox(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(8.0),
                  child: const Center(child: Text(largeTestText)),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: const Center(child: Text(smallTestText)),
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 60.0),
        const Text('After IntrinsicHeight:'),
        const SizedBox(height: 16.0),
        IntrinsicHeight(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.green,
                  padding: const EdgeInsets.all(8.0),
                  child: const Center(child: Text(largeTestText)),
                ),
              ),
              Expanded(
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.all(8.0),
                  child: const Center(child: Text(smallTestText)),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
