import 'package:flutter/material.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/presentation/widgets/container_selector.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/presentation/widgets/scaffold_with_gradient.dart';

import '../../application/bloc/currency_conversion_bloc.dart';
import '../../domain/entities/currency_entity.dart';

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
  final void Function(CurrencyEntity currency) onChangeBaseCurrency;
  final void Function(int index, CurrencyEntity currency) onChangeCurrency;
  final void Function(int index) onRemoveCurrency;
  final void Function() onGetConversions;

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();

    return ScaffoldWithGradient(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 95,
            ),
            Center(
              child: Text(
                "Převodník měn".toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            ContainerSelector(
                options: state.availableCurrencies,
                onChanged: onChangeBaseCurrency,
            selectedCurrency: state.currency,
            height: 180,
            ),
            Center(
              child: Text(
                "Na".toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            ContainerSelector(
              height: 140,
              options: List.from(state.availableCurrencies)
                ..remove(state.currency),
              onChanged: (currency) => onChangeCurrency(0, currency),
              selectedCurrency: state.currencies.firstOrNull,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "částka na převod".toUpperCase(),
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: controller,
                decoration:  InputDecoration(
                  prefixIcon: Center(child: Text(state.currency.code,)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Color.fromRGBO(255, 122, 0, 1),

                    ),
                    borderRadius: BorderRadius.circular(16),

                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: ElevatedButton(child: Text('Převeď měnu'), onPressed: onGetConversions,)),
            ),
          ],
        ),
      ),
    );
  }
}
