import 'dart:io';

import 'package:flutter/material.dart';

extension CheckInternetExtension on Object {
  Future<bool> checkInternet() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } on SocketException catch (_) {
      return false;
    }
  }
}

class InternetCheckExtensionPage extends StatefulWidget {
  const InternetCheckExtensionPage({super.key});

  @override
  State<InternetCheckExtensionPage> createState() =>
      _InternetCheckExtensionPageState();
}

class _InternetCheckExtensionPageState
    extends State<InternetCheckExtensionPage> {
  bool _isConnected = false;
  bool _isLoading = false;

  Future<void> _checkInternet() async {
    setState(() {
      _isLoading = true;
    });
    final result = await checkInternet();
    setState(() {
      _isConnected = result;
      _isLoading = false;
    });
  }

  @override
  void initState() {
    _checkInternet();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (_isLoading)
              const Center(
                child: CircularProgressIndicator.adaptive(),
              )
            else
              Text(
                _isConnected ? 'Connected' : 'Not Connected',
                style: TextStyle(
                  fontSize: 20,
                  color: _isConnected ? Colors.green : Colors.red,
                ),
              ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                _checkInternet();
                debugPrint('result: $_isConnected');
              },
              child: const Text('Check Internet'),
            ),
          ],
        ),
      ),
    );
  }
}
