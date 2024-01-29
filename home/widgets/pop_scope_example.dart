import 'package:flutils/core/utils/most_used_functions.dart';
import 'package:flutter/material.dart';

class PopScopeExample extends StatelessWidget {
  const PopScopeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: (value) async {
        MostUsedFunctions.showSnackBarFun(context, 'On Will Pop Scope Works!');
      },
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'PopScope is a widget that works when you back to the previous page.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
