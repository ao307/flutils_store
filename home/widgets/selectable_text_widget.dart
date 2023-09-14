import 'package:flutter/material.dart';

class SelectableTextWidget extends StatelessWidget {
  const SelectableTextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SelectableText(
          'Press and hold to select text and then tap on copy\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla euismod, nisl eget ultricies aliquam, nunc sapien ultricies nunc, quis ultricies nisl nisl nec nunc. Donec euismod, nisl eget ultricies aliquam, nunc sapien ultricies nunc, quis ultricies nisl nisl nec nunc. Donec euismod, nisl eget ultricies aliquam, nunc sapien ultricies nunc, quis ultricies nisl nisl nec nunc. Donec euismod, nisl eget ultricies aliquam, nunc sapien ultricies nunc, quis ultricies nisl nisl nec nunc. Donec euismod, nisl eget ultricies aliquam, nunc sapien ultricies nunc, quis ultricies nisl nisl nec nunc. Donec euismod, nisl eget ultricies aliquam, nunc sapien ultricies nunc, quis ultricies nisl nisl nec nunc. Donec euismod, nisl eget ultricies aliquam, nunc sapien ultricies nunc, quis ultricies nisl nisl nec nunc. Donec euismod, nisl eget ultricies aliquam, nunc sapien ultricies nunc, quis ultricies nisl nisl nec nunc.',
        ),
      ),
    );
  }
}
