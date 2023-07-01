import 'package:flutter/material.dart';

class CustomBottomNavWithoutPackage extends StatelessWidget {
  const CustomBottomNavWithoutPackage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Custom Bottom Nav'),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  static const List<IconData> _iconPaths = [
    Icons.house_outlined,
    Icons.search_outlined,
    Icons.add_circle,
    Icons.notifications_outlined,
    Icons.person_outline,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: Container(
        height: 60,
        margin: const EdgeInsetsDirectional.only(
          bottom: 20,
          start: 20,
          end: 20,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            _iconPaths.length,
            (index) => buildNavItem(
              index: index,
              icon: _iconPaths[index],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNavItem({required int index, required IconData icon}) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: SizedBox(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: _selectedIndex == index ? Colors.purple : Colors.grey,
              size: 30,
            ),
            const SizedBox(height: 5),
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 2,
              width: 20,
              decoration: BoxDecoration(
                color: _selectedIndex == index
                    ? Colors.purple
                    : Colors.transparent,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
