import 'package:flutter/material.dart';

class SliverAppbarExample extends StatelessWidget {
  const SliverAppbarExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 220,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
            centerTitle: true,
            pinned: true,
            backgroundColor: Colors.purple,
            flexibleSpace: const FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                'Sliver Appbar',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList.separated(
              itemCount: 100,
              separatorBuilder: (context, index) => const SizedBox(height: 12),
              itemBuilder: (context, index) => Container(
                height: 100,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.12),
                ),
                child: Center(
                  child: Text(
                    '$index',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
