import 'package:flutter/material.dart';
import 'feature/currency_conversion/presentation/pages/currency_conversion_page.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CurrencyConversionPage(),
    );
  }
}
