
import 'package:flutter/material.dart';

import '../../application/bloc/currency_conversion_bloc.dart';

class CurrencyConversionErrorView extends StatelessWidget {
  const CurrencyConversionErrorView({required this.state, required this.onTryAgain, super.key, });

  final ErrorCurrencyConversionState state;

  final void Function() onTryAgain;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
