
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies_upgrade/core/utilities/payment_keys.dart';
import 'package:movies_upgrade/series/presentation/views/series_screen.dart';
import 'core/services/service_locator.dart';
import 'main_layout/main_layout_screen.dart';
import 'movie/presentation/views/movies_screen.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Stripe
 // Stripe.publishableKey = PaymentKeys.k1;
  // Optional: Set merchant identifier for Apple Pay
 // Stripe.merchantIdentifier = 'merchant.com.yourapp';
  //await Stripe.instance.applySettings();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.black,
            iconTheme: IconThemeData(color: Colors.white)),
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.inter(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      //home: const MainSeriesScreen(),
      home: const MainLayoutScreen(),
    );
  }
}
