import 'package:flutils/features/home/presentation/widgets/title_button_reuse_home.dart';
import 'package:flutter/material.dart';

/// the default of behavior: SnackBarBehavior.fixed
/// you can change it to SnackBarBehavior.floating to make it floating
/// I have added example of floating snackbar in the code you can try it
class CustomSnackBar {
  /// simple snackbar
  static void showSimpleSnackBar(
    BuildContext context, {
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// show snackbar with action
  static void showSnackBarWithAction(
    BuildContext context, {
    required String message,
    required String actionLabel,
    required VoidCallback action,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      action: SnackBarAction(
        label: actionLabel,
        onPressed: () {
          action();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Show floating snackbar
  static void showFloatingSnackBar(
    BuildContext context, {
    required String message,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// show snackbar with custom icon
  static void showErrorSnackBar(
    BuildContext context, {
    required String errorMessage,
  }) {
    final snackBar = SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// snackbar with error icon and action
  static void showErrorSnackBarWithAction(
    BuildContext context, {
    required String errorMessage,
    required String actionLabel,
    required VoidCallback action,
  }) {
    final snackBar = SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.error,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              errorMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.red,
      action: SnackBarAction(
        textColor: Colors.white,
        label: actionLabel,
        onPressed: () {
          action();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// snackbar with success icon and action
  static void showSuccessSnackBarWithAction(
    BuildContext context, {
    required String successMessage,
    required String actionLabel,
    required VoidCallback action,
  }) {
    final snackBar = SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.check_circle,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              successMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.green,
      action: SnackBarAction(
        textColor: Colors.white,
        label: actionLabel,
        onPressed: () {
          action();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// snackbar with warning icon and action
  static void showWarningSnackBarWithAction(
    BuildContext context, {
    required String warningMessage,
    required String actionLabel,
    required VoidCallback action,
  }) {
    final snackBar = SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.warning,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              warningMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.orange,
      action: SnackBarAction(
        textColor: Colors.white,
        label: actionLabel,
        onPressed: () {
          action();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// snackbar with info icon and action
  static void showInfoSnackBarWithAction(
    BuildContext context, {
    required String infoMessage,
    required String actionLabel,
    required VoidCallback action,
  }) {
    final snackBar = SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(
            Icons.info,
            color: Colors.white,
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(
              infoMessage,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: Colors.blue,
      action: SnackBarAction(
        textColor: Colors.white,
        label: actionLabel,
        onPressed: () {
          action();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  // snackbar with custom icon and action
  static void showCustomSnackBarWithAction(
    BuildContext context, {
    required String message,
    required String actionLabel,
    required VoidCallback action,
    required IconData icon,
    required Color iconColor,
    required Color backgroundColor,
  }) {
    final snackBar = SnackBar(
      content: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            icon,
            color: iconColor,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      action: SnackBarAction(
        textColor: Colors.white,
        label: actionLabel,
        onPressed: () {
          action();
        },
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}

/// TitleButtonReuse is a custom widget for showing title ,button and onPressed function
/// you can make it easy and pass title ,button text and onPressed function
class SnackBarsPage extends StatelessWidget {
  const SnackBarsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          TitleButtonReuse(
            text: 'Simple SnackBar',
            textButton: 'Show Simple SnackBar',
            onPressed: () {
              CustomSnackBar.showSimpleSnackBar(
                context,
                message: 'Simple SnackBar',
              );
            },
          ),
          TitleButtonReuse(
            text: 'SnackBar with Action',
            textButton: 'Show SnackBar with Action',
            onPressed: () {
              CustomSnackBar.showSnackBarWithAction(
                context,
                message: 'SnackBar with Action',
                actionLabel: 'Action',
                action: () {
                  debugPrint('SnackBar with Action');
                },
              );
            },
          ),
          TitleButtonReuse(
            text: 'Floating SnackBar',
            textButton: 'Show Floating SnackBar',
            onPressed: () {
              CustomSnackBar.showFloatingSnackBar(
                context,
                message: 'Floating SnackBar',
              );
            },
          ),
          TitleButtonReuse(
            text: 'SnackBar with Error Icon',
            textButton: 'Show SnackBar with Error Icon',
            onPressed: () {
              CustomSnackBar.showErrorSnackBar(
                context,
                errorMessage: 'SnackBar with Error Icon',
              );
            },
          ),
          TitleButtonReuse(
            text: 'SnackBar with Error Icon and Action',
            textButton: 'Show SnackBar with Error Icon and Action',
            onPressed: () {
              CustomSnackBar.showErrorSnackBarWithAction(
                context,
                errorMessage: 'SnackBar with Error Icon and Action',
                actionLabel: 'Action',
                action: () {
                  debugPrint('SnackBar with Error Icon and Action');
                },
              );
            },
          ),
          TitleButtonReuse(
            text: 'SnackBar with Success Icon and Action',
            textButton: 'Show SnackBar with Success Icon and Action',
            onPressed: () {
              CustomSnackBar.showSuccessSnackBarWithAction(
                context,
                successMessage: 'SnackBar with Success Icon and Action',
                actionLabel: 'Action',
                action: () {
                  debugPrint('SnackBar with Success Icon and Action');
                },
              );
            },
          ),
          TitleButtonReuse(
            text: 'SnackBar with Warning Icon and Action',
            textButton: 'Show SnackBar with Warning Icon and Action',
            onPressed: () {
              CustomSnackBar.showWarningSnackBarWithAction(
                context,
                warningMessage: 'SnackBar with Warning Icon and Action',
                actionLabel: 'Action',
                action: () {
                  debugPrint('SnackBar with Warning Icon and Action');
                },
              );
            },
          ),
          TitleButtonReuse(
            text: 'SnackBar with Info Icon and Action',
            textButton: 'Show SnackBar with Info Icon and Action',
            onPressed: () {
              CustomSnackBar.showInfoSnackBarWithAction(
                context,
                infoMessage: 'SnackBar with Info Icon and Action',
                actionLabel: 'Action',
                action: () {
                  debugPrint('SnackBar with Info Icon and Action');
                },
              );
            },
          ),
          TitleButtonReuse(
            text: 'SnackBar with Custom Icon and Action',
            textButton: 'Show SnackBar with Custom Icon and Action',
            showDivider: false,
            onPressed: () {
              CustomSnackBar.showCustomSnackBarWithAction(
                context,
                message: 'SnackBar with Custom Icon and Action',
                actionLabel: 'Action',
                action: () {
                  debugPrint('SnackBar with Custom Icon and Action');
                },
                icon: Icons.favorite,
                iconColor: Colors.white,
                backgroundColor: Colors.purple,
              );
            },
          ),
        ],
      ),
    );
  }
}
