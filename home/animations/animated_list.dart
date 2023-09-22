import 'package:flutter/material.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage({super.key});

  @override
  State<StatefulWidget> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  int length = 5;
  final List<String> _list = List<String>.generate(5, (index) => 'Item $index');

  void _addItem() {
    // insert item at the end of the list
    length++;
    _list.add('Item ${length - 1}');
    _listKey.currentState?.insertItem(_list.length - 1);
  }

  void _removeItem(int index) {
    // remove item from the end of the list
    final item = _list[index];
    _listKey.currentState?.removeItem(
      index,
      (context, animation) => ListTile(
        title: Text(
          item,
          style: const TextStyle(fontSize: 20),
        ),
        trailing: const Icon(Icons.delete),
        onTap: () {
          _removeItem(index);
        },
      ),
      duration: const Duration(milliseconds: 250),
    );
    _list.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedList(
        key: _listKey,
        initialItemCount: _list.length,
        itemBuilder: (context, index, animation) {
          final item = _list[index];
          return SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: ListTile(
              title: Text(
                item,
                style: const TextStyle(fontSize: 20),
              ),
              trailing: IconButton(
                onPressed: () {
                  _removeItem(index);
                },
                icon: const Icon(Icons.delete),
              ),
              onTap: () {},
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addItem();
        },
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
