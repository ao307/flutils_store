// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutils/.env.dart';
import 'package:flutils/core/components/webview/web_view_shared.dart';
import 'package:flutils/core/extensions/navigation_extensions.dart';
import 'package:flutils/features/home/presentation/sections/pop_ups/snack_bars_page.dart';
import 'package:flutils/features/home/presentation/widgets/title_button_reuse_home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

///
/// you need to add strip publishable and secret key to .env.dart file
/// and add 'flutter_stripe' package to your pubspec.yaml
///
/// you can handle error in your own way
/// this is just a sample of how to use strip payment
///
class StripPaymentBottomSheetReuse {
  StripPaymentBottomSheetReuse({required this.context});

  late BuildContext context;
  Map<String, dynamic>? paymentIntentClientSecret;

  Future createPaymentIntent() async {
    try {
      final Map<String, dynamic> body = {
        'amount': '2000',
        'currency': 'usd',
      };

      final http.Response response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        body: body,
        headers: {
          'Authorization': 'Bearer $stripeSecretKey',
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      );
      return jsonDecode(response.body);
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }

  void displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
      CustomSnackBar.showFloatingSnackBar(context, message: 'Payment Success');
    } on StripeException catch (e) {
      debugPrint('Error: $e');
      CustomSnackBar.showFloatingSnackBar(
        context,
        message: 'Payment Not Completed',
      );
      throw Exception('Error: $e');
    }
  }

  Future<void> makePayment() async {
    try {
      paymentIntentClientSecret = await createPaymentIntent();
      debugPrint('paymentIntentClientSecret: $paymentIntentClientSecret');

      const googlePay = PaymentSheetGooglePay(
        merchantCountryCode: 'usd',
        currencyCode: 'usd',
        testEnv: true,
      );

      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          paymentIntentClientSecret:
              paymentIntentClientSecret!['client_secret'],
          googlePay: googlePay,
          appearance: PaymentSheetAppearance(
            colors: PaymentSheetAppearanceColors(
              background: Theme.of(context).scaffoldBackgroundColor,
              componentBackground: Theme.of(context).scaffoldBackgroundColor,
              componentText: Theme.of(context).textTheme.bodyLarge!.color,
              placeholderText: Theme.of(context).textTheme.bodyLarge!.color,
              primary: Colors.purple,
              primaryText: Theme.of(context).textTheme.bodyLarge!.color,
              secondaryText: Theme.of(context).textTheme.bodyLarge!.color,
              icon: Theme.of(context).iconTheme.color,
            ),
          ),
          merchantDisplayName: 'Flutter Utils',
        ),
      );

      // display payment sheet
      displayPaymentSheet();
    } catch (e) {
      debugPrint('Error: $e');
      throw Exception('Error: $e');
    }
  }
}

class StripePaymentBottomSheetPage extends StatefulWidget {
  const StripePaymentBottomSheetPage({super.key});

  @override
  State<StripePaymentBottomSheetPage> createState() =>
      _StripePaymentBottomSheetPageState();
}

class _StripePaymentBottomSheetPageState
    extends State<StripePaymentBottomSheetPage> {
  @override
  void initState() {
    Stripe.publishableKey = stripePublishableKey;
    super.initState();
  }

  bool isPaymentSheetLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TitleButtonReuse(
              text: 'Test Credentials',
              textButton: 'Get It',
              onPressed: () async {
                context.navigateToPage(
                  const WebViewWidget(
                    title: 'Stripe Test Credentials',
                    url: 'https://stripe.com/docs/testing#cards',
                    copyLink: true,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            if (isPaymentSheetLoading)
              const CircularProgressIndicator.adaptive()
            else
              TitleButtonReuse(
                textButton: 'Pay Now',
                text: 'Payment With Bottom Sheet',
                showDivider: false,
                onPressed: () async {
                  isPaymentSheetLoading = true;
                  setState(() {});
                  await StripPaymentBottomSheetReuse(context: context)
                      .makePayment();
                  isPaymentSheetLoading = false;
                  setState(() {});
                },
              ),
          ],
        ),
      ),
    );
  }
}
