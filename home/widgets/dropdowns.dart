import 'package:flutils/core/extensions/size_extensions.dart';
import 'package:flutils/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class DropdownPage extends StatefulWidget {
  const DropdownPage({Key? key}) : super(key: key);

  @override
  State<DropdownPage> createState() => _DropdownPageState();
}

class _DropdownPageState extends State<DropdownPage> {
  List<String> options = ['Option 1', 'Option 2', 'Option 3'];

  String? selectedOption = 'Option 1';

  List<Map<String, dynamic>> optionsWithIcons = [
    {'text': 'Option 1', 'icon': Icons.ac_unit},
    {'text': 'Option 2', 'icon': Icons.access_alarm},
    {'text': 'Option 3', 'icon': Icons.access_time},
  ];

  late Map<String, dynamic> selectedOptionWithIcon;

  @override
  void initState() {
    selectedOptionWithIcon = optionsWithIcons[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppPadding.largePadding),
      children: [
        const Text('Dropdown Button:'),
        DropdownButton<String>(
          value: selectedOption,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue;
            });
          },
          iconSize: 36,
          underline: const SizedBox(),
        ),
        const Text('Dropdown Button with Size and Color:'),
        DropdownButton<String>(
          value: selectedOption,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue;
            });
          },
          iconSize: 36,
          underline: const SizedBox(),
        ),
        const Text('Dropdown Button with Borders:'),
        DropdownButton<String>(
          value: selectedOption,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Text(option),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue;
            });
          },
          iconSize: 36,
          underline: Container(
            height: 2,
            color: Colors.grey[400],
          ),
        ),
        const Text('Dropdown Button with Custom Icons:'),
        DropdownButton<Map<String, dynamic>>(
          value: selectedOptionWithIcon,
          items: optionsWithIcons.map((option) {
            return DropdownMenuItem<Map<String, dynamic>>(
              value: option,
              child: Row(
                children: [
                  Icon(option['icon']),
                  const SizedBox(width: 8),
                  Text(option['text']),
                ],
              ),
            );
          }).toList(),
          onChanged: (Map<String, dynamic>? newValue) {
            setState(() {
              selectedOptionWithIcon = newValue!;
            });
          },
          iconSize: 36,
          underline: const SizedBox(),
        ),
        const Text('Dropdown Button with Custom Design:'),
        DropdownButton<String>(
          value: selectedOption,
          items: options.map((String option) {
            return DropdownMenuItem<String>(
              value: option,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(option),
              ),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedOption = newValue;
            });
          },
          iconSize: 36,
          underline: const SizedBox(),
        ),
      ].paddingDirectional(
        bottom: AppPadding.smallPadding,
      ),
    );
  }
}
