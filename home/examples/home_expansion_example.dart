import 'package:flutter/material.dart';

class HomeExpansionPanelExample extends StatefulWidget {
  const HomeExpansionPanelExample({
    super.key,
    required this.index,
    required this.iconData,
  });

  final int index;
  final IconData iconData;

  @override
  State<HomeExpansionPanelExample> createState() => _HomeExpansionPanelExampleState();
}

class _HomeExpansionPanelExampleState extends State<HomeExpansionPanelExample> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      animationDuration: const Duration(seconds: 1),
      expandIconColor: Theme.of(context).textTheme.bodyLarge!.color,
      expansionCallback: (int index, bool isExpanded) {
        debugPrint('isExpanded: $isExpanded');
        setState(() {
          this.isExpanded = isExpanded;
        });
      },
      children: [
        ExpansionPanel(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: Icon(widget.iconData, size: 25),
              title: const Text(
                'Header',
              ),
            );
          },
          body: ListView.separated(
            shrinkWrap: true,
            padding: const EdgeInsetsDirectional.only(
              start: 8,
              end: 8,
              bottom: 8,
            ),
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 10,
            separatorBuilder: (context, index) => const SizedBox(height: 8),
            itemBuilder: (context, index) => const HomeListTileExample(),
          ),
          isExpanded: isExpanded,
        ),
      ],
    );
  }
}

class HomeListTileExample extends StatelessWidget {
  const HomeListTileExample({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onTap: () {},
      title: const Text(
        'Title',
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
      subtitle: const Text(
        'Subtitle',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 13,
        ),
      ),
      trailing: const Icon(Icons.code_outlined),
    );
  }
}
