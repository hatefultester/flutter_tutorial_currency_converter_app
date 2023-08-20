import '../../domain/enum/endpoint.dart';

extension EndpointToUrl on Endpoint {
  String get url => switch (this) {
        Endpoint.GET_ALL_CURRENCIES =>
          'https://api.freecurrencyapi.com/v1/currencies',
        Endpoint.GET_CONVERSION_RATES =>
          'https://api.freecurrencyapi.com/v1/latest',
      };
}
