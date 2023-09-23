import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

extension TextWithCopyExtension on Text {
  Widget withCopy(BuildContext context) {
    return InkWell(
      onLongPress: () {
        final textToCopy = data; // the text you want to copy
        Clipboard.setData(ClipboardData(text: textToCopy ?? ''));
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text('Copied to clipboard'),
          ),
        );
      },
      child: this, // the text widget
    );
  }
}

class CopyTextExtensionPage extends StatelessWidget {
  const CopyTextExtensionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: const Text(
          'Make a long press on this text to copy it.',
          textAlign: TextAlign.center,
        ).withCopy(context),
      ),
    );
  }
}
