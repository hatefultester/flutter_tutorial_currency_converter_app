import 'package:flutter/material.dart';

class CurrencyConversionLoadingView extends StatelessWidget {
  const CurrencyConversionLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
