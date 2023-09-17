import 'package:flutils/core/components/widgets.dart';
import 'package:flutils/features/home/presentation/widgets/title_button_reuse_home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dialogs {
  /// show adaptive dialog with title and message
  static void showAdaptiveDialogReuse(
    BuildContext context,
    String title,
    String message,
  ) {
    showAdaptiveDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog.adaptive(
        title: Text(title),
        content: SingleChildScrollView(
          child: Text(message),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  /// show dialog with title and message
  static void showAlertDialog(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// show cupertino dialog with title and message
  static void showCupertinoDialogReuse(
    BuildContext context,
    String title,
    String message,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  /// show about dialog with title and message
  static void showAboutDialogReuse(
    BuildContext context,
    String appName,
    String message,
  ) {
    showAboutDialog(
      context: context,
      applicationName: appName,
      applicationIcon: const MyAppLogo(size: 25),
      children: [
        Text(message),
      ],
    );
  }

  /// show general dialog with title and message
  static void showGeneralDialogReuse(
    BuildContext context,
    String title,
    String message,
  ) {
    showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) {
        return AlertDialog(
          title: Text(title),
          content: SingleChildScrollView(
            child: Text(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

/// TitleButtonReuse is a custom widget for showing title ,button and onPressed function
/// you can make it easy and pass title ,button text and onPressed function
class DialogsPage extends StatelessWidget {
  const DialogsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TitleButtonReuse(
            text: 'Adaptive Dialog',
            textButton: 'Show Adaptive Dialog',
            onPressed: () {
              Dialogs.showAdaptiveDialogReuse(
                context,
                'Adaptive Dialog',
                'The Adaptive Dialog is a dialog that adapts to the platform it is running on.\n\nif you run this app on android it will show android dialog and if you run this app on ios it will show ios dialog',
              );
            },
          ),
          TitleButtonReuse(
            text: 'Alert Dialog',
            textButton: 'Show Alert Dialog',
            onPressed: () {
              Dialogs.showAlertDialog(
                context,
                'Alert Dialog',
                'This is an alert dialog',
              );
            },
          ),
          TitleButtonReuse(
            text: 'Cupertino Dialog',
            textButton: 'Show Cupertino Dialog',
            onPressed: () {
              Dialogs.showCupertinoDialogReuse(
                context,
                'Cupertino Dialog',
                'This is a cupertino dialog',
              );
            },
          ),
          TitleButtonReuse(
            text: 'About Dialog',
            textButton: 'Show About Dialog',
            onPressed: () {
              Dialogs.showAboutDialogReuse(
                context,
                'Flutter Utils',
                'The About Dialog is a dialog that describes your application.',
              );
            },
          ),
          TitleButtonReuse(
            text: 'General Dialog',
            textButton: 'Show General Dialog',
            showDivider: false,
            onPressed: () {
              Dialogs.showGeneralDialogReuse(
                context,
                'General Dialog',
                'This is a general dialog',
              );
            },
          ),
        ],
      ),
    );
  }
}
