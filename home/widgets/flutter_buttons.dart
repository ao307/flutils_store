import 'package:flutils/config/themes/colors.dart';
import 'package:flutils/core/extensions/size_extensions.dart';
import 'package:flutils/core/res/app_sizes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlutterButtons extends StatelessWidget {
  const FlutterButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppPadding.largePadding),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const BackButton(),
              const CloseButton(),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.favorite),
              ),
              PopupMenuButton(
                itemBuilder: (BuildContext context) {
                  return List<PopupMenuEntry<dynamic>>.generate(
                    3,
                    (int index) {
                      return PopupMenuItem(
                        value: index,
                        child: Text('Menu Item $index'),
                      );
                    },
                  );
                },
              ),
            ],
          ),
          TextButton(
            onPressed: () {},
            child: const Text('Text Button'),
          ),
          TextButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.remove),
            label: const Text('Text Button with Icon'),
          ),
          OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.cPrimary,
              side: const BorderSide(
                color: AppColors.cPrimary,
              ),
            ),
            child: const Text('Outlined Button'),
          ),
          OutlinedButton.icon(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.cPrimary,
              side: const BorderSide(
                color: AppColors.cPrimary,
              ),
            ),
            icon: const Icon(Icons.edit),
            label: const Text('Outlined Button with Icon'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Elevated Button'),
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Elevated Button with Icon'),
          ),
          FloatingActionButton(
            heroTag: 'fab1',
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          FloatingActionButton.extended(
            heroTag: 'fab2',
            onPressed: () {},
            icon: const Icon(Icons.add),
            label: const Text('Extended FAB'),
          ),
          CupertinoButton(
            onPressed: () {},
            color: AppColors.cPrimary,
            pressedOpacity: 0.5,
            child: const Text('Cupertino Button'),
          ),
        ].paddingDirectional(
          bottom: AppPadding.mediumPadding,
        ),
      ),
    );
  }
}
