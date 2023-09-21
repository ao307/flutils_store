import 'package:flutter/material.dart';

class AnimatedIconsPage extends StatefulWidget {
  const AnimatedIconsPage({super.key});

  @override
  State<AnimatedIconsPage> createState() => _AnimatedIconsPageState();
}

class _AnimatedIconsPageState extends State<AnimatedIconsPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  Tween<double>? tAnimation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    tAnimation = Tween<double>(begin: 0.0, end: 1.0)
      ..animate(_animationController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView(
        padding: const EdgeInsets.all(20.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 50.0,
          childAspectRatio: 0.8,
          mainAxisSpacing: 50.0,
        ),
        children: <Widget>[
          AnimatedIcon(
            icon: AnimatedIcons.add_event,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.arrow_menu,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.close_menu,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.ellipsis_search,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.event_add,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.home_menu,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.list_view,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_arrow,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.menu_home,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.pause_play,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.search_ellipsis,
            progress: _animationController,
          ),
          AnimatedIcon(
            icon: AnimatedIcons.view_list,
            progress: _animationController,
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        heroTag: UniqueKey(),
        key: UniqueKey(),
        onPressed: () {
          setState(() {
            if (_animationController.status == AnimationStatus.completed) {
              _animationController.reverse();
            } else {
              _animationController.forward();
            }
          });
        },
        label: const Text(
          'Change Animation',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
