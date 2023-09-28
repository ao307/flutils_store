import 'package:flutter/material.dart';

class InteractiveViewerExample extends StatelessWidget {
  const InteractiveViewerExample({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: InteractiveViewer(
        maxScale: 10.0,
        // replace the child with your own widget
        child: Image.network(
          'https://imgur.com/YboCVfn.png',
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress == null) {
              return child;
            }
            return const Center(child: CircularProgressIndicator.adaptive());
          },
          errorBuilder: (context, error, stackTrace) =>
              const Center(child: Text('Error loading image')),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
