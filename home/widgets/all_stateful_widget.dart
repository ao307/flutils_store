import 'package:flutils/config/themes/colors.dart';
import 'package:flutils/core/extensions/size_extensions.dart';
import 'package:flutils/core/utils/app_sizes.dart';
import 'package:flutter/material.dart';

class AllStatefulWidgetsPage extends StatefulWidget {
  const AllStatefulWidgetsPage({Key? key}) : super(key: key);

  @override
  State<AllStatefulWidgetsPage> createState() => _AllStatefulWidgetsPageState();
}

class _AllStatefulWidgetsPageState extends State<AllStatefulWidgetsPage> {
  int _counter = 0;

  bool _checkboxValue = false;

  int? _radioValue;

  bool _switchValue = false;

  final TextEditingController _textEditingController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  double _sliderValue = 0.0;

  RangeValues _rangeSliderValues = const RangeValues(0, 50);

  int _currentStep = 0;

  final InputBorder _inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.grey,
    ),
    borderRadius: BorderRadius.circular(20),
  );

  final InputBorder _focusedInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: AppColors.cPrimary,
    ),
    borderRadius: BorderRadius.circular(20),
  );

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(AppPadding.largePadding),
      children: [
        const Text('StatefulWidget:'),
        Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('You have pressed the button $_counter times.'),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
                child: const Text('Press me!'),
              ),
            ],
          ),
        ),
        const Text('Checkbox:'),
        CheckboxListTile(
          title: const Text('Check me!'),
          value: _checkboxValue,
          onChanged: (bool? value) {
            setState(() {
              _checkboxValue = value!;
            });
          },
        ),
        const Text('Radio:'),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RadioListTile<int>(
              title: const Text('Option 1'),
              value: 1,
              groupValue: _radioValue,
              onChanged: (int? value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
            RadioListTile<int>(
              title: const Text('Option 2'),
              value: 2,
              groupValue: _radioValue,
              onChanged: (int? value) {
                setState(() {
                  _radioValue = value;
                });
              },
            ),
          ],
        ),
        const Text('Switch:'),
        SwitchListTile(
          title: const Text('Toggle me!'),
          value: _switchValue,
          onChanged: (bool value) {
            setState(() {
              _switchValue = value;
            });
          },
        ),
        const Text('TextField:'),
        TextField(
          controller: _textEditingController,
          decoration: InputDecoration(
            hintText: 'Enter some text...',
            enabledBorder: _inputBorder,
            focusedBorder: _focusedInputBorder,
            border: _inputBorder,
          ),
        ),
        const Text('Form:'),
        Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  labelText: 'Name',
                  enabledBorder: _inputBorder,
                  focusedBorder: _focusedInputBorder,
                  border: _inputBorder,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                  labelText: 'Email',
                  enabledBorder: _inputBorder,
                  focusedBorder: _focusedInputBorder,
                  border: _inputBorder,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email.';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter a valid email address.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Form submitted successfully.'),
                      ),
                    );
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
        const Text('Slider:'),
        Slider(
          value: _sliderValue,
          max: 100,
          divisions: 10,
          label: '$_sliderValue',
          onChanged: (double value) {
            setState(() {
              _sliderValue = value;
            });
          },
        ),
        const Text('RangeSlider:'),
        RangeSlider(
          values: _rangeSliderValues,
          max: 100,
          divisions: 10,
          labels: RangeLabels(
            '${_rangeSliderValues.start}',
            '${_rangeSliderValues.end}',
          ),
          onChanged: (RangeValues values) {
            setState(() {
              _rangeSliderValues = values;
            });
          },
        ),
        const Text('Stepper:'),
        Stepper(
          currentStep: _currentStep,
          onStepContinue: () {
            if (_currentStep < 2) {
              setState(() {
                _currentStep++;
              });
            }
          },
          onStepCancel: () {
            if (_currentStep > 0) {
              setState(() {
                _currentStep--;
              });
            }
          },
          steps: [
            Step(
              title: const Text('Step 1'),
              content: const Text('This is step 1.'),
              isActive: _currentStep == 0,
            ),
            Step(
              title: const Text('Step 2'),
              content: const Text('This is step 2.'),
              isActive: _currentStep == 1,
            ),
            Step(
              title: const Text('Step 3'),
              content: const Text('This is step 3.'),
              isActive: _currentStep == 2,
            ),
          ],
        ),
      ].paddingDirectional(
        bottom: AppPadding.smallPadding,
      ),
    );
  }
}
