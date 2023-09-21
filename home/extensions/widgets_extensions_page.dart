import 'package:flutter/material.dart';

///
extension TextWidgetExtensions on String {
  Text get txt => Text(this, style: const TextStyle());
}

///
extension SizedBoxExtension on num {
  SizedBox get sizedHeight => SizedBox(height: toDouble());

  SizedBox get sizedWidth => SizedBox(width: toDouble());
}

///
extension PaddingList on List<Widget> {
  List<Widget> paddingDirectional({
    double? top,
    double? bottom,
    double? start,
    double? end,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsetsDirectional.only(
          top: top ?? 0,
          bottom: bottom ?? 0,
          start: start ?? 0,
          end: end ?? 0,
        ),
        child: e,
      ),
    ).toList();
  }

  List<Widget> paddingSymmetric({
    double? vertical,
    double? horizontal,
  }) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.symmetric(
          vertical: vertical ?? 0,
          horizontal: horizontal ?? 0,
        ),
        child: e,
      ),
    ).toList();
  }

  List<Widget> paddingAll(double? padding) {
    return map(
      (e) => Padding(
        padding: EdgeInsets.all(padding ?? 0),
        child: e,
      ),
    ).toList();
  }
}

///
class WidgetsExtensionsPage extends StatelessWidget {
  const WidgetsExtensionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        """
1. **TextWidgetExtensions (String Extension):**
   
This extension is used to simplify the creation of `Text` widgets in Flutter. It adds a `txt` property to `String` objects, allowing you to create `Text` widgets with a specific font size. 

For example, instead of writing:
```dart
Text('Hello, Flutter!', style: TextStyle(fontSize: 20))
```

You can use the extension like this:
```dart
'Hello, Flutter!'.txt
```

This makes the code cleaner and more readable, especially when you have multiple text widgets with the same style.

2. **SizedBoxExtension (Numeric Extension):**

This extension simplifies the creation of `SizedBox` widgets, which are used to specify fixed dimensions (height and width) in Flutter. It adds two properties, `sizedHeight` and `sizedWidth`, to numeric values (e.g., `int` or `double`).

- `sizedHeight` allows you to create a `SizedBox` with a specific height.
- `sizedWidth` allows you to create a `SizedBox` with a specific width.

For example, instead of writing:
```dart
SizedBox(height: 100.0)
```

You can use the extension like this:
```dart
100.sizedHeight
```

This simplifies the code when you need to set fixed dimensions.

3. **PaddingList (List<Widget> Extension):**

This extension is useful when you have a list of widgets and you want to apply padding to each widget in the list. It provides three methods for adding padding to the widgets:

- `paddingDirectional` adds directional (top, bottom, start, end) padding to each widget in the list. You can specify different padding values for each direction.

- `paddingSymmetric` adds symmetric (vertical and horizontal) padding to each widget in the list. You can specify vertical and horizontal padding values.

- `paddingAll` adds the same padding to all sides (top, bottom, start, end) of each widget in the list.

For example, if you have a list of buttons and want to add some padding to each button, you can use these methods to apply the padding easily.

```dart
[Widgets].paddingDirectional(bottom: 20) // Adds 20 padding to the bottom of each widget in the list.
```

These extensions help in reducing code duplication and make your code more concise and maintainable, especially when working with repetitive UI elements."""
            .txt,
      ].paddingDirectional(bottom: 20),
    );
  }
}
