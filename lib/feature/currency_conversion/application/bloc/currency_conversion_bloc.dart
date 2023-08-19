import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/currency.dart';
import '../../domain/repositories/i_currency_conversion_repository.dart';
import '../../infrastructure/repositories/currency_conversion_repository.dart';

part 'currency_conversion_state.dart';

part 'currency_conversion_event.dart';

final class CurrencyConversionBloc
    extends Bloc<CurrencyConversionEvent, CurrencyConversionState> {
  CurrencyConversionBloc._(super.initialState, this.repository) {
    on<CurrencyConversionEvent>(_eventHandler);
  }

  factory CurrencyConversionBloc.initial({
    CurrencyConversionState? state,
    required ICurrencyConversionRepository repository,
  }) =>
      CurrencyConversionBloc._(
        state ?? const InitCurrencyConversionState(),
        repository,
      );

  final ICurrencyConversionRepository repository;

  FutureOr<void> _eventHandler(
      CurrencyConversionEvent event, Emitter<CurrencyConversionState> emit) {
    return switch (event) {
      _ when event is SetupEvent => _onSetupEvent(event, emit),
      _ => null,
    };
  }

  _onSetupEvent(CurrencyConversionEvent event,
      Emitter<CurrencyConversionState> emit) async {
    emit(const LoadingCurrencyConversionState());
    await Future.delayed(const Duration(seconds: 3));
    emit(const SuccessCurrencyConversionState(
        Currency.usd, [Currency.usd], null));
  }
}
