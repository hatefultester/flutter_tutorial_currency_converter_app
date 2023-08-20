import '../../domain/enum/endpoint.dart';
import '../../domain/sources/i_currency_conversion_remote_data_source.dart';

final class MockCurrencyConversionRemoteDataSource
    implements ICurrencyConversionRemoteDataSource {
  @override
  Future getRequest({
    required Map<String, String> headers,
    required Endpoint endpoint,
  }) async {
    return await Future.delayed(
      const Duration(seconds: 3),
    ).then(
      (_) => switch (endpoint) {
        _ when endpoint == Endpoint.GET_ALL_CURRENCIES => mockAllCurrenciesData,
        _ when endpoint == Endpoint.GET_CONVERSION_RATES => mockConversionRateData,
        _ => {"data": {}},
      },
    );
  }
}

const Map<String, dynamic> mockConversionRateData = {
  "data": {
    "AUD": 1.561170186,
    "BGN": 1.7960903231,
    "BRL": 4.9706408184,
    "CAD": 1.3554102449,
    "CHF": 0.8815801329,
    "CNY": 7.2799612978,
    "CZK": 22.0790731931,
    "DKK": 6.8551807338,
    "EUR": 0.9193201004,
    "GBP": 0.7855600788,
    "HKD": 7.8337309297,
    "HRK": 7.0392009598,
    "HUF": 351.5212938058,
    "IDR": 15269.097816279,
    "ILS": 3.8004907406,
    "INR": 83.1276620346,
    "ISK": 132.2678709743,
    "JPY": 145.4221401576,
    "KRW": 1337.7929588467,
    "MXN": 17.0518617597,
    "MYR": 4.646650535,
    "NOK": 10.6508417123,
    "NZD": 1.6886703156,
    "PHP": 56.1532573612,
    "PLN": 4.0975004546,
    "RON": 4.5474607015,
    "RUB": 93.0226329924,
    "SEK": 10.9843114107,
    "SGD": 1.3568301477,
    "THB": 35.3982444043,
    "TRY": 27.0412553116,
    "USD": 1,
    "ZAR": 18.9677729138
  }
};

const Map<String, dynamic> mockAllCurrenciesData = {
  "data": {
    "EUR": {
      "symbol": "€",
      "name": "Euro",
      "symbol_native": "€",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "EUR",
      "name_plural": "Euros"
    },
    "USD": {
      "symbol": "\$",
      "name": "US Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "USD",
      "name_plural": "US dollars"
    },
    "JPY": {
      "symbol": "¥",
      "name": "Japanese Yen",
      "symbol_native": "￥",
      "decimal_digits": 0,
      "rounding": 0,
      "code": "JPY",
      "name_plural": "Japanese yen"
    },
    "BGN": {
      "symbol": "BGN",
      "name": "Bulgarian Lev",
      "symbol_native": "лв.",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "BGN",
      "name_plural": "Bulgarian leva"
    },
    "CZK": {
      "symbol": "Kč",
      "name": "Czech Republic Koruna",
      "symbol_native": "Kč",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "CZK",
      "name_plural": "Czech Republic korunas"
    },
    "DKK": {
      "symbol": "Dkr",
      "name": "Danish Krone",
      "symbol_native": "kr",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "DKK",
      "name_plural": "Danish kroner"
    },
    "GBP": {
      "symbol": "£",
      "name": "British Pound Sterling",
      "symbol_native": "£",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "GBP",
      "name_plural": "British pounds sterling"
    },
    "HUF": {
      "symbol": "Ft",
      "name": "Hungarian Forint",
      "symbol_native": "Ft",
      "decimal_digits": 0,
      "rounding": 0,
      "code": "HUF",
      "name_plural": "Hungarian forints"
    },
    "PLN": {
      "symbol": "zł",
      "name": "Polish Zloty",
      "symbol_native": "zł",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "PLN",
      "name_plural": "Polish zlotys"
    },
    "RON": {
      "symbol": "RON",
      "name": "Romanian Leu",
      "symbol_native": "RON",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "RON",
      "name_plural": "Romanian lei"
    },
    "SEK": {
      "symbol": "Skr",
      "name": "Swedish Krona",
      "symbol_native": "kr",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "SEK",
      "name_plural": "Swedish kronor"
    },
    "CHF": {
      "symbol": "CHF",
      "name": "Swiss Franc",
      "symbol_native": "CHF",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "CHF",
      "name_plural": "Swiss francs"
    },
    "ISK": {
      "symbol": "Ikr",
      "name": "Icelandic Króna",
      "symbol_native": "kr",
      "decimal_digits": 0,
      "rounding": 0,
      "code": "ISK",
      "name_plural": "Icelandic krónur"
    },
    "NOK": {
      "symbol": "Nkr",
      "name": "Norwegian Krone",
      "symbol_native": "kr",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "NOK",
      "name_plural": "Norwegian kroner"
    },
    "HRK": {
      "symbol": "kn",
      "name": "Croatian Kuna",
      "symbol_native": "kn",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "HRK",
      "name_plural": "Croatian kunas"
    },
    "RUB": {
      "symbol": "RUB",
      "name": "Russian Ruble",
      "symbol_native": "руб.",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "RUB",
      "name_plural": "Russian rubles"
    },
    "TRY": {
      "symbol": "TL",
      "name": "Turkish Lira",
      "symbol_native": "TL",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "TRY",
      "name_plural": "Turkish Lira"
    },
    "AUD": {
      "symbol": "AU\$",
      "name": "Australian Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "AUD",
      "name_plural": "Australian dollars"
    },
    "BRL": {
      "symbol": "R\$",
      "name": "Brazilian Real",
      "symbol_native": "R\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "BRL",
      "name_plural": "Brazilian reals"
    },
    "CAD": {
      "symbol": "CA\$",
      "name": "Canadian Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "CAD",
      "name_plural": "Canadian dollars"
    },
    "CNY": {
      "symbol": "CN¥",
      "name": "Chinese Yuan",
      "symbol_native": "CN¥",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "CNY",
      "name_plural": "Chinese yuan"
    },
    "HKD": {
      "symbol": "HK\$",
      "name": "Hong Kong Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "HKD",
      "name_plural": "Hong Kong dollars"
    },
    "IDR": {
      "symbol": "Rp",
      "name": "Indonesian Rupiah",
      "symbol_native": "Rp",
      "decimal_digits": 0,
      "rounding": 0,
      "code": "IDR",
      "name_plural": "Indonesian rupiahs"
    },
    "ILS": {
      "symbol": "₪",
      "name": "Israeli New Sheqel",
      "symbol_native": "₪",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "ILS",
      "name_plural": "Israeli new sheqels"
    },
    "INR": {
      "symbol": "Rs",
      "name": "Indian Rupee",
      "symbol_native": "টকা",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "INR",
      "name_plural": "Indian rupees"
    },
    "KRW": {
      "symbol": "₩",
      "name": "South Korean Won",
      "symbol_native": "₩",
      "decimal_digits": 0,
      "rounding": 0,
      "code": "KRW",
      "name_plural": "South Korean won"
    },
    "MXN": {
      "symbol": "MX\$",
      "name": "Mexican Peso",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "MXN",
      "name_plural": "Mexican pesos"
    },
    "MYR": {
      "symbol": "RM",
      "name": "Malaysian Ringgit",
      "symbol_native": "RM",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "MYR",
      "name_plural": "Malaysian ringgits"
    },
    "NZD": {
      "symbol": "NZ\$",
      "name": "New Zealand Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "NZD",
      "name_plural": "New Zealand dollars"
    },
    "PHP": {
      "symbol": "₱",
      "name": "Philippine Peso",
      "symbol_native": "₱",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "PHP",
      "name_plural": "Philippine pesos"
    },
    "SGD": {
      "symbol": "S\$",
      "name": "Singapore Dollar",
      "symbol_native": "\$",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "SGD",
      "name_plural": "Singapore dollars"
    },
    "THB": {
      "symbol": "฿",
      "name": "Thai Baht",
      "symbol_native": "฿",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "THB",
      "name_plural": "Thai baht"
    },
    "ZAR": {
      "symbol": "R",
      "name": "South African Rand",
      "symbol_native": "R",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "ZAR",
      "name_plural": "South African rand"
    }
  }
};
