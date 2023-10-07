import 'package:flutils/core/utils/most_used_functions.dart';
import 'package:flutter/material.dart';

class WillPopScopeExample extends StatelessWidget {
  const WillPopScopeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MostUsedFunctions.showSnackBarFun(context, 'On Will Pop Scope Works!');
        // if you want to prevent the user from going back to the previous page make it return false;
        return true;
      },
      child: const Padding(
        padding: EdgeInsets.all(16),
        child: Center(
          child: Text(
            'WillPopScope is a widget that works when you back to the previous page.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
