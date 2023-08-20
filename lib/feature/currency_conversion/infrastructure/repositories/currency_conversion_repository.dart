import 'package:flutter/foundation.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/infrastructure/extensions/endpoint.dart';
import '../../domain/entities/currency_entity.dart';
import '../../domain/enum/endpoint.dart';
import '../../domain/repositories/i_currency_conversion_repository.dart';
import '../../domain/sources/i_currency_conversion_remote_data_source.dart';

const _apiKey = 'fca_live_wR2oVlPaTUG7KY1X5VQAyDrLphIwnpCfzuuuRjVV';

final class CurrencyConversionRepository
    implements ICurrencyConversionRepository {
  CurrencyConversionRepository(this.dataSource);

  final ICurrencyConversionRemoteDataSource dataSource;

  @override
  Future<List<CurrencyEntity>> getCurrencies() async {
    final apiRequest = await dataSource.getRequest(headers: {
      "apikey": _apiKey,
    }, endpoint: Endpoint.GET_ALL_CURRENCIES);


    debugPrint(apiRequest.toString());
    final apiCurrenciesList = apiRequest['data'] as Map<String, dynamic>;

    final currencies = <CurrencyEntity>[];
    apiCurrenciesList.forEach((key, value) {
      currencies.add(CurrencyEntity.fromDto(value));
    });

    return currencies;
  }

  @override
  Future<Map<CurrencyEntity, double>> getLatestExchangeRates(
      {required CurrencyEntity baseCurrency, required List<CurrencyEntity> currencies}) {
    // TODO: implement getLatestExchangeRates
    throw UnimplementedError();
  }
}
