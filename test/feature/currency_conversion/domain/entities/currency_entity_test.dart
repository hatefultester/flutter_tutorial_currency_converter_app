import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/domain/entities/currency_entity.dart';

import '../../application/currency_conversion_bloc_test.dart';

void main() {

  group('[fromDto]', () {
    test('valid map returns currency entity', () {
      final currencyMap =  {
      "symbol": "€",
      "name": "Euro",
      "symbol_native": "€",
      "decimal_digits": 2,
      "rounding": 0,
      "code": "EUR",
      "name_plural": "Euros"
      };
    final act = CurrencyEntity.fromDto(currencyMap);
    expect(act.rounding, 0);
    expect(act.code, 'EUR');
    expect(act.namePlural, 'Euros');
    expect(act.decimalDigits, 2);
    expect(act.symbol, "€");
    expect(act.symbolNative, "€");
    expect(act.name, "Euro");

    });
    test('invalid map throws argument error', () {
      final currencyMap =  {
        "symbol": "€",
        "name": "Euro",
        "rounding": 0,
        "name_plural": "Euros"
      };
      expect(() => CurrencyEntity.fromDto(currencyMap), throwsArgumentError);
    });
  });

}
