import 'package:flutter/material.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/presentation/widgets/scaffold_with_gradient.dart';

import '../../application/bloc/currency_conversion_bloc.dart';

class CurrencyConversionErrorView extends StatelessWidget {
  const CurrencyConversionErrorView({
    required this.state,
    required this.onTryAgain,
    super.key,
  });

  final ErrorCurrencyConversionState state;

  final void Function() onTryAgain;

  @override
  Widget build(BuildContext context) {
    return ScaffoldWithGradient(
      child: Column(
        children: [
          Text(state.message),
          ElevatedButton(
            onPressed: onTryAgain,
            child: const Text('Try again'),
          ),
        ],
      ),
    );
  }
}
