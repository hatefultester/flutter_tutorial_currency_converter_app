import 'package:flutter/material.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/presentation/widgets/scaffold_with_gradient.dart';

class CurrencyConversionLoadingView extends StatelessWidget {
  const CurrencyConversionLoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ScaffoldWithGradient(
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
