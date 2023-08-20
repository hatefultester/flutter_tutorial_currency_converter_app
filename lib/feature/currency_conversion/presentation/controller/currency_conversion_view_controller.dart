import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/currency_entity.dart';
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
      bloc: bloc..add(const SetUpEvent()),
      buildWhen: (previousState, currentState) {
        return previousState.props != currentState.props;
      },
      builder: (context, state) => switch (state) {
        SuccessCurrencyConversionState state => CurrencyConversionSuccessView(
            state: state,
            onAddCurrency: () => bloc.add(
              const AddCurrencyEvent(),
            ),
            onChangeBaseCurrency: (CurrencyEntity currency) => bloc.add(
              ChangeBaseCurrencyEvent(currency),
            ),
            onChangeCurrency: (int index, CurrencyEntity currency) => bloc.add(
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
      listenWhen: (previous, current) {
        return previous is SuccessCurrencyConversionState &&
            current is SuccessCurrencyConversionState;
      },
      listener: (BuildContext context, CurrencyConversionState state) {

      },
    );
  }
}
