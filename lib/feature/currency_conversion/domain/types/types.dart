typedef CurrencyConversionDtoResponse = ({
  Map<String, double> data,
});

typedef CurrencyDto = ({
  String symbol,
  String name,
  String symbol_native,
  int decimal_digits,
  int rounding,
  String code,
  String native_plural,
});

typedef CurrenciesListDtoResponse = ({
  Map<String, CurrencyDto> data,
});
