import 'package:flutter/material.dart';

import '../../application/bloc/currency_conversion_bloc.dart';
import '../../domain/entities/currency.dart';

class CurrencyConversionSuccessView extends StatelessWidget {
  const CurrencyConversionSuccessView({
    required this.state,
    required this.onAddCurrency,
    required this.onChangeBaseCurrency,
    required this.onChangeCurrency,
    required this.onRemoveCurrency,
    required this.onGetConversions,
    super.key,
  });

  final SuccessCurrencyConversionState state;

  final void Function() onAddCurrency;
  final void Function(Currency currency) onChangeBaseCurrency;
  final void Function(int index, Currency currency) onChangeCurrency;
  final void Function(int index) onRemoveCurrency;
  final void Function() onGetConversions;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      floatingActionButton: null,
      body: const SingleChildScrollView(
        child: Column(
          children: [

          ],
        ),
      ),
    );
  }
}
