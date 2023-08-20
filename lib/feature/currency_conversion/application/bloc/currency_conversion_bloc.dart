import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/currency_entity.dart';
import '../../domain/repositories/i_currency_conversion_repository.dart';

part 'currency_conversion_state.dart';

part 'currency_conversion_event.dart';

/// [CurrencyConversionBloc] - Currency Conversion Business logic component
/// holds [CurrencyConversionState] which represents current state
/// handles [CurrencyConversionEvent]'s that triggers private methods which emits new state
final class CurrencyConversionBloc
    extends Bloc<CurrencyConversionEvent, CurrencyConversionState> {
  /// Constructor is private to prevent unpredictable instantiation
  CurrencyConversionBloc._(super.initialState, this.repository) {
    on<CurrencyConversionEvent>(
      (event, emit) => switch (event) {
        AddCurrencyEvent _ => _onAddCurrency(emit),
        RemoveCurrencyEvent event => _onRemoveCurrency(event.index, emit),
        ChangeCurrencyEvent event =>
          _onChangeCurrency(event.index, event.currency, emit),
        ChangeBaseCurrencyEvent event =>
          _onChangeCurrency(-1, event.currency, emit),
        GetConversionsEvent _ => getConversion(emit),
        _ => _onSetUp(emit)
      },
    );
  }

  /// public initial constructor allows to create [CurrencyConversionBloc]
  /// with specific [ICurrencyConversionRepository]
  factory CurrencyConversionBloc.initial({
    required ICurrencyConversionRepository repository,
  }) =>
      CurrencyConversionBloc._(
        const InitCurrencyConversionState(),
        repository,
      );

  /// repository allows to perform logical/api operation's on the background
  /// [Bloc] itself should only perform logical operation on [Bloc] level
  /// which means operations that does not involve [State] are resolved on
  /// infrastructure layer here
  final ICurrencyConversionRepository repository;


  FutureOr<void> _onSetUp(Emitter<CurrencyConversionState> emit) async {
    if (state is! InitCurrencyConversionState &&
        state is! ErrorCurrencyConversionState) return;
    emit(const LoadingCurrencyConversionState());
    final repoCall = await repository.getCurrencies();
    emit(SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: repoCall));
  }

  FutureOr<void> _onAddCurrency(Emitter<CurrencyConversionState> emit) async {
    if (state is! SuccessCurrencyConversionState) return;
    final catchState = state as SuccessCurrencyConversionState;
    final currencies = catchState.currencies;
    final CurrencyEntity value = catchState.availableCurrencies.firstWhere(
      (element) => !currencies.contains(element),
      orElse: () => catchState.availableCurrencies.first,
    );
    final currenciesUpdated = List<CurrencyEntity>.from(currencies)..add(value);
    emit(catchState.copyWith(currencies: currenciesUpdated));
  }

  FutureOr<void> _onRemoveCurrency(
      int index, Emitter<CurrencyConversionState> emit) async {
    if (index < 0) return;
    if (state is! SuccessCurrencyConversionState) return;
    final catchState = state as SuccessCurrencyConversionState;
    final currencies = catchState.currencies;
    if (index >= currencies.length) return;
    final updatedCurrencies = List<CurrencyEntity>.from(currencies)
      ..removeAt(index);
    emit(catchState.copyWith(currencies: updatedCurrencies));
  }

  FutureOr<void> _onChangeCurrency(int index, CurrencyEntity currency,
      Emitter<CurrencyConversionState> emit) async {
    if (index < -1) return;
    if (state is! SuccessCurrencyConversionState) return;
    final catchState = state as SuccessCurrencyConversionState;
    if (index == -1) {
      emit(catchState.copyWith(currency: currency));
      return;
    }
    final currencies = catchState.currencies;
    if (currencies.isEmpty) {
      final updatedCurrencies = List<CurrencyEntity>.from(currencies);
      updatedCurrencies.add(currency);
      emit(catchState.copyWith(currencies: updatedCurrencies));
    } else if (index < currencies.length) {
      final updatedCurrencies = List<CurrencyEntity>.from(currencies);
      updatedCurrencies[index] = currency;
      emit(catchState.copyWith(currencies: updatedCurrencies));
    }
  }

  FutureOr<void> getConversion(Emitter<CurrencyConversionState> emit) async {
    if (state is! SuccessCurrencyConversionState) return;
    final catchState = state as SuccessCurrencyConversionState;
    emit(catchState.copyWith(showLoadingOverlay: true));
    try {
      final conversions = await repository.getLatestExchangeRates(
          baseCurrency: catchState.currency, currencies: catchState.currencies);
      emit(catchState.copyWith(conversions: conversions));
    } on Exception catch (e) {
      emit(catchState.copyWith(snackBarMessage: 'Error'));
    }
  }
}
