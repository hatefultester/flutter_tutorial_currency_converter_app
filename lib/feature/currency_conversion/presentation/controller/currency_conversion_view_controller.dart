import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/currency.dart';
import '../../application/bloc/currency_conversion_bloc.dart';

import '../views/currency_conversion_error_view.dart';
import '../views/currency_conversion_loading_view.dart';
import '../views/currency_conversion_success_view.dart';

class CurrencyConversionViewController extends StatelessWidget {
  const CurrencyConversionViewController({required this.bloc, super.key});

  final CurrencyConversionBloc bloc;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CurrencyConversionBloc, CurrencyConversionState>(
      bloc: bloc..add(const SetupEvent()),
      builder: (context, state) => switch (state) {
        SuccessCurrencyConversionState state => CurrencyConversionSuccessView(
            state: state,
            onAddCurrency: () => bloc.add(
              const AddCurrencyEvent(),
            ),
            onChangeBaseCurrency: (Currency currency) => bloc.add(
              ChangeBaseCurrencyEvent(currency),
            ),
            onChangeCurrency: (int index, Currency currency) => bloc.add(
              ChangeCurrencyEvent(index, currency),
            ),
            onRemoveCurrency: (int index) => bloc.add(
              RemoveCurrencyEvent(index),
            ),
            onGetConversions: () => bloc.add(
              const GetConversionsEvent(),
            ),
          ),
        ErrorCurrencyConversionState state => CurrencyConversionErrorView(
            state: state,
            onTryAgain: () => bloc.add(
              const TryAgainEvent(),
            ),
          ),
        _ => const CurrencyConversionLoadingView(),
      },
      listener: (BuildContext context, CurrencyConversionState state) {},
    );
  }
}
