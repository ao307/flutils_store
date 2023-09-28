import 'package:flutter/material.dart';

class SwipeToDismissPage extends StatefulWidget {
  const SwipeToDismissPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SwipeToDismissPageState();
  }
}

class _SwipeToDismissPageState extends State<SwipeToDismissPage> {
  final _items = List<String>.generate(20, (i) => 'Item ${i + 1}');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final String item = _items[index];
        // Each Dismissible must contain a Key. Keys allow Flutter to uniquely
        // identify Widgets.
        return Dismissible(
          key: Key(item),
          // We also need to provide a function that tells our app what to do
          // after an item has been swiped away.
          onDismissed: (DismissDirection dir) {
            setState(() => _items.removeAt(index));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  dir == DismissDirection.startToEnd
                      ? '$item removed.'
                      : '$item liked.',
                ),
                action: SnackBarAction(
                  label: 'UNDO',
                  onPressed: () {
                    setState(() => _items.insert(index, item));
                  },
                ),
              ),
            );
          },
          // Show a red background as the item is swiped away
          background: Container(
            color: Colors.red,
            padding: const EdgeInsetsDirectional.only(start: 16.0),
            alignment: AlignmentDirectional.centerStart,
            child: const Icon(Icons.delete, color: Colors.white),
          ),
          // Background when swiping from right to left
          secondaryBackground: Container(
            color: Colors.green,
            alignment: AlignmentDirectional.centerEnd,
            padding: const EdgeInsetsDirectional.only(end: 16.0),
            child: const Icon(Icons.thumb_up, color: Colors.white),
          ),
          child: ListTile(
            title: Center(child: Text(_items[index])),
          ),
        );
      },
    );
  }
}
