part of 'currency_conversion_bloc.dart';

sealed class CurrencyConversionState extends Equatable {
  const CurrencyConversionState();

  @override
  List<Object?> get props => [];
}

final class InitCurrencyConversionState extends CurrencyConversionState {
  const InitCurrencyConversionState();
}

final class LoadingCurrencyConversionState extends CurrencyConversionState {
  const LoadingCurrencyConversionState();
}

final class SuccessCurrencyConversionState extends CurrencyConversionState {
  const SuccessCurrencyConversionState(this.currency, this.currencies, this.conversions);

  final Currency currency;

  final List<Currency> currencies;

  final Map<Currency, double>? conversions;




  @override
  List<Object?> get props => [currency, currencies, conversions];
}

final class ErrorCurrencyConversionState extends CurrencyConversionState {
  const ErrorCurrencyConversionState();
}
