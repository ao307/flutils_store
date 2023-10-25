import 'package:flutter/material.dart';

class RawMagnifierExample extends StatefulWidget {
  const RawMagnifierExample({super.key});

  @override
  State<RawMagnifierExample> createState() => _RawMagnifierExampleState();
}

class _RawMagnifierExampleState extends State<RawMagnifierExample> {
  Offset dragGesturePosition = Offset.zero;
  final String loremIpsum =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec euismod, nisl sed aliquet ultricies, nunc sapien ultricies diam, non condimentum magna diam ut nisl. Donec euismod, nisl sed aliquet ultricies, nunc sapien ultricies diam, non condimentum magna diam ut nisl. Donec euismod, nisl sed aliquet ultricies, nunc sapien ultricies diam, non condimentum magna diam ut nisl. Donec euismod, nisl sed aliquet ultricies, nunc sapien ultricies diam, non condimentum magna diam ut nisl. Donec euismod, nisl sed aliquet ultricies, nunc sapien ultricies diam, non condimentum magna diam ut nisl.';

  bool _isMagnifierEnabled = true;

  void _toggleMagnifier() {
    setState(() {
      _isMagnifierEnabled = !_isMagnifierEnabled;
    });
  }

  void Function(DragUpdateDetails) _onPanUpdate() {
    return (DragUpdateDetails details) => setState(
          () {
            if (_isMagnifierEnabled) {
              dragGesturePosition = details.localPosition;
            }
          },
        );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'Drag on the text to magnify it',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.purple,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              RepaintBoundary(
                child: Stack(
                  children: <Widget>[
                    GestureDetector(
                      onPanUpdate: _onPanUpdate(),
                      child: Text(loremIpsum),
                    ),
                    if (_isMagnifierEnabled)
                      Positioned(
                        left: dragGesturePosition.dx,
                        top: dragGesturePosition.dy,
                        child: const RawMagnifier(
                          decoration: MagnifierDecoration(
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.purple, width: 2),
                            ),
                          ),
                          size: Size(80, 80),
                          magnificationScale: 2,
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _toggleMagnifier,
        label: Text(
          _isMagnifierEnabled ? 'Hide Magnifier' : 'Show Magnifier',
          style: Theme.of(context).floatingActionButtonTheme.extendedTextStyle,
        ),
      ),
    );
  }
}
