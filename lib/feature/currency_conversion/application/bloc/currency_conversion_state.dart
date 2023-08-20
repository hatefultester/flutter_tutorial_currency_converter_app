part of 'currency_conversion_bloc.dart';

sealed class CurrencyConversionState extends Equatable {
  const CurrencyConversionState();

  @override
  List<Object?> get props => [runtimeType];
}

final class InitCurrencyConversionState extends CurrencyConversionState {
  const InitCurrencyConversionState();
}

final class LoadingCurrencyConversionState extends CurrencyConversionState {
  const LoadingCurrencyConversionState();
}

final class SuccessCurrencyConversionState extends CurrencyConversionState {
  const SuccessCurrencyConversionState({
    required this.currency,
    required this.currencies,
    required this.availableCurrencies,
    required this.conversions,
    required this.validationMessage,
    required this.snackBarMessage,
    required this.showLoadingOverlay,
  });

  final CurrencyEntity currency;

  final List<CurrencyEntity> currencies;

  final List<CurrencyEntity> availableCurrencies;

  final Map<CurrencyEntity, double>? conversions;

  final String? snackBarMessage;

  final String? validationMessage;

  final bool showLoadingOverlay;

  SuccessCurrencyConversionState copyWith({
    CurrencyEntity? currency,
    List<CurrencyEntity>? currencies,
    List<CurrencyEntity>? availableCurrencies,
    Map<CurrencyEntity, double>? conversions,
    String? validationMessage,
    String? snackBarMessage,
    bool? showLoadingOverlay,
  }) =>
      SuccessCurrencyConversionState(
        showLoadingOverlay: showLoadingOverlay ?? false,
        snackBarMessage: snackBarMessage,
        validationMessage: validationMessage,
        conversions: conversions ?? this.conversions,
        currency: currency ?? this.currency,
        currencies: currencies ?? this.currencies,
        availableCurrencies: availableCurrencies ?? this.availableCurrencies,
      );

  factory SuccessCurrencyConversionState.fromCurrencies(
      {required List<CurrencyEntity> availableCurrencies}) {
    assert(availableCurrencies.isNotEmpty, "availableCurrencies can't be empty!");
    return SuccessCurrencyConversionState(
      currencies: const [],
      availableCurrencies: availableCurrencies,
      currency: availableCurrencies.first,
      showLoadingOverlay: false,
      conversions: null,
      snackBarMessage: null,
      validationMessage: null,
    );
  }

  @override
  List<Object?> get props => [currency, currencies, conversions, availableCurrencies];
}

final class ErrorCurrencyConversionState extends CurrencyConversionState {
  const ErrorCurrencyConversionState(this.message);

  final String message;

  @override
  List<Object?> get props => [message];
}
