import 'package:flutter/material.dart';

class ListViewSeparatedPage extends StatelessWidget {
  const ListViewSeparatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 40,
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index) => const Divider(height: 30),
      itemBuilder: (context, index) => ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          child: Text(
            '$index',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          'Item $index',
          style: const TextStyle(fontSize: 18.0),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, size: 18.0),
      ),
    );
  }
}
