import 'package:flutils/features/home/presentation/widgets/title_button_reuse_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheets {
  /// show modal bottom sheet
  static Future<Type?> showModalBottomReuse(
    BuildContext context, {
    required Widget child,
  }) {
    return showModalBottomSheet(
      context: context,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.of(context).size.height * 0.8,
        minHeight: MediaQuery.of(context).size.height * 0.2,
      ),
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // title
            const SizedBox(height: 20),
            const Text('This is a bottom sheet'),
            const Divider(),

            Container(
              padding: const EdgeInsets.all(20),
              child: child,
            ),
          ],
        );
      },
    );
  }

  /// show cupertino bottom sheet
  static Future<Type?> showCupertinoBottomReuse(
    BuildContext context, {
    required List<Widget> actions,
    required String title,
    required String message,
  }) {
    return showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) {
        return CupertinoActionSheet(
          title: Text(title),
          message: Text(message),
          actions: actions,
          cancelButton: CupertinoActionSheetAction(
            isDestructiveAction: true,
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        );
      },
    );
  }
}

/// TitleButtonReuse is a custom widget for showing title ,button and onPressed function
/// you can make it easy and pass title ,button text and onPressed function
class AdaptiveBottomSheetExample extends StatelessWidget {
  const AdaptiveBottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TitleButtonReuse(
              text: 'Modal Bottom Sheet',
              textButton: 'Show Modal Bottom Sheet',
              onPressed: () {
                BottomSheets.showModalBottomReuse(
                  context,
                  child: const Text(
                    'lorem ipsum dolor sit amet. consectetur adipiscing elit. '
                    'Donec eget enim vitae ex aliquet fermentum. '
                    'Sed eget nisl vitae nisl aliquam aliquet. '
                    'Donec eget enim vitae ex aliquet fermentum. '
                    'Sed eget nisl vitae nisl aliquam aliquet. '
                    'Donec eget enim vitae ex aliquet fermentum. ',
                  ),
                );
              },
            ),
            TitleButtonReuse(
              text: 'Cupertino Bottom Sheet',
              textButton: 'Show Cupertino Bottom Sheet',
              showDivider: false,
              onPressed: () {
                BottomSheets.showCupertinoBottomReuse(
                  context,
                  title: 'This is an iOS bottom sheet',
                  message: 'This is the message',
                  actions: <Widget>[
                    CupertinoActionSheetAction(
                      child: const Text('Action 1'),
                      onPressed: () {},
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('Action 2'),
                      onPressed: () {},
                    ),
                    CupertinoActionSheetAction(
                      child: const Text('Action 3'),
                      onPressed: () {},
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
