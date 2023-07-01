import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveBottomSheetExample extends StatelessWidget {
  const AdaptiveBottomSheetExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('Show Android Bottom Sheet'),
              onPressed: () {
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Column(
                      children: [
                        // title
                        const SizedBox(height: 20),
                        const Text(
                          'This is a bottom sheet',
                        ),
                        const Divider(),

                        Expanded(
                          child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: CircleAvatar(
                                  child: Text('$index'),
                                ),
                                title: Text(
                                  'Lorem Ipsum $index',
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                subtitle: const Text(
                                  'Lorem ipsum dolor sit amet',
                                  style: TextStyle(
                                    fontSize: 12,
                                  ),
                                ),
                                trailing: const Icon(
                                  Icons.arrow_forward_ios,
                                  size: 14,
                                ),
                                onTap: () {},
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              child: const Text('Show iOS Bottom Sheet'),
              onPressed: () {
                showCupertinoModalPopup(
                  context: context,
                  builder: (BuildContext context) {
                    return CupertinoActionSheet(
                      title: const Text('This is an iOS bottom sheet'),
                      message: const Text('This is the message'),
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
