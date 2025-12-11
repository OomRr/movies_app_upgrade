// 1. Create Payment Intent (API Call)
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;
import 'package:movies_upgrade/core/utilities/payment_keys.dart';

Future<Map<String, dynamic>?> createPaymentIntent({
  required String amount,
  required String currency,
}) async {
  try {
    // YOU SHOULD MOVE THIS LOGIC TO YOUR OWN SERVER IN PRODUCTION
    Map<String, dynamic> body = {
      'amount': amount, // Amount in cents (e.g., 1000 = $10.00)
      'currency': currency,
      'payment_method_types[]': 'card',
    };
    var response = await http.post(
      Uri.parse('https://api.stripe.com/v1/payment_intents'),
      body: body,
      headers: {
        'Authorization': 'Bearer ${PaymentKeys.k2}',
        // Your Secret Key
        'Content-Type': 'application/x-www-form-urlencoded',
      },
    );
    return jsonDecode(response.body);
  } catch (err) {
    log('Error creating payment intent: ${err.toString()}');
    return null;
  }
}

// 2. Initialize Payment Sheet
Future<void> initPaymentSheet({
  required BuildContext context,
  required int amount,
  String currency = 'USD',
}) async {
  try {
    // A. Create the PaymentIntent
    final data = await createPaymentIntent(
      amount: inCents(amount).toString(),
      currency: currency,
    ); // 1000 cents = $10

    if (data == null) return;

    // B. Initialize the Payment Sheet
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        // Set to true for custom flow
        customFlow: false,
        // Main params
        merchantDisplayName: 'Flutter Stripe',
        paymentIntentClientSecret: data['client_secret'],
        // Customer keys
        customerEphemeralKeySecret: data['ephemeralKey'],
        customerId: data['customer'],

        //  style: ThemeMode.dark,
      ),
    );
    // C. Display the payment sheet
    await displayPaymentSheet(context: context);
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Error: $e')));
  }
}

// 3. Display Payment Sheet
Future<void> displayPaymentSheet({required BuildContext context}) async {
  try {
    // Present the sheet
    await Stripe.instance.presentPaymentSheet();

    // If call succeeds, payment is successful
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Payment Successful!')));
  } on StripeException catch (e) {
    // Handle error (e.g., user cancelled)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error: ${e.error.localizedMessage}')),
    );
  } catch (e) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Error: $e')));
  }
}

inCents(int dollars) {
  return dollars * 100;
}
