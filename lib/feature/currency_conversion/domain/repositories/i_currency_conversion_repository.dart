import '../entities/currency_entity.dart';

abstract interface class ICurrencyConversionRepository {
  Future<List<CurrencyEntity>> getCurrencies();

  Future<Map<CurrencyEntity, double>> getLatestExchangeRates({
    required CurrencyEntity baseCurrency,
    required List<CurrencyEntity> currencies,
  });
}