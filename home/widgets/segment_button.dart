import 'package:flutter/cupertino.dart';

class CupertinoSlidingSegmentedControlWidgets extends StatefulWidget {
  const CupertinoSlidingSegmentedControlWidgets({super.key});

  @override
  State<CupertinoSlidingSegmentedControlWidgets> createState() =>
      _CupertinoSlidingSegmentedControlWidgetsState();
}

class _CupertinoSlidingSegmentedControlWidgetsState
    extends State<CupertinoSlidingSegmentedControlWidgets> {
  int _currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CupertinoSlidingSegmentedControl(
        groupValue: _currentSelection,
        children: const <int, Widget>{
          0: Text('First'),
          1: Text('Second'),
          2: Text('Third'),
        },
        onValueChanged: (int? newValue) {
          setState(() {
            _currentSelection = newValue ?? 0;
          });
        },
      ),
    );
  }
}
