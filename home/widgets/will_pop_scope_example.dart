import 'package:flutils/core/utils/most_used_functions.dart';
import 'package:flutter/material.dart';

class WillPopScopeExample extends StatelessWidget {
  const WillPopScopeExample({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        MostUsedFunctions.showSnackBarFun(context, 'On Will Pop Scope Works!');
        return false;
      },
      child: const Center(
        child: Text(
          'WillPopScope is a widget that works when you back to the previous page.',
        ),
      ),
    );
  }
}
