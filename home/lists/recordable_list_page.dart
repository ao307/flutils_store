import 'package:flutter/material.dart';

class RecordableListPage extends StatefulWidget {
  const RecordableListPage({super.key});

  @override
  State<StatefulWidget> createState() => _RecordableListPageState();
}

class _RecordableListPageState extends State<RecordableListPage> {
  List<String> items = List.generate(20, (index) => 'Item ${index + 1}');

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          // description of the page
          const Text(
            'Press and hold an item to start dragging. Drag an item between two other items to insert it between them.',
          ),

          Expanded(
            child: ReorderableListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  key: Key('$index'),
                  title: Text(items[index]),
                );
              },
              onReorder: (oldIndex, newIndex) {
                setState(() {
                  if (newIndex > oldIndex) {
                    newIndex -= 1;
                  }
                  final item = items.removeAt(oldIndex);
                  items.insert(newIndex, item);
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
