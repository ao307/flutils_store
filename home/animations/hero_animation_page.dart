import 'package:flutter/material.dart';

class HeroAnimationPage extends StatelessWidget {
  const HeroAnimationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const DetailPage(),
              ),
            );
          },
          leading: const Hero(
            tag: 'hero-tag',
            key: ValueKey('hero-tag'),
            child: CircleAvatar(
              radius: 24,
              backgroundImage: AssetImage(
                'assets/images/launcher_icon.png',
              ),
            ),
          ),
          title: const Text('Hero Animation'),
          subtitle: const Text('Tap to see hero animation'),
        ),
      ],
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: const Center(
        child: Hero(
          tag: 'hero-tag',
          key: ValueKey('hero-tag'),
          child: Image(
            image: AssetImage(
              'assets/images/launcher_icon.png',
            ),
          ),
        ),
      ),
    );
  }
}
