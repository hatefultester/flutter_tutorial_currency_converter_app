import 'package:equatable/equatable.dart';

class CurrencyEntity extends Equatable {
  const CurrencyEntity({
    required this.symbol,
    required this.symbolNative,
    required this.name,
    required this.namePlural,
    required this.code,
    required this.decimalDigits,
    required this.rounding,
  });

  factory CurrencyEntity.fromDto(Map<String, dynamic> dto) {
    final symbol = dto['symbol'];
    if (symbol == null) throw ArgumentError('symbol can\'t be empty');
    final symbolNative = dto['symbol_native'];
    if (symbolNative == null)
      throw ArgumentError('symbol native can\'t be empty');
    final name = dto['name'];
    if (name == null) throw ArgumentError('name can\'t be empty');
    final code = dto['code'];
    if (code == null) throw ArgumentError('code can\'t be empty');
    final namePlural = dto['name_plural'];
    if (namePlural == null) throw ArgumentError('code can\'t be empty');
    final decimalDigits = dto['decimal_digits'] as int;
    if (decimalDigits == null) throw ArgumentError('code can\'t be empty');
    final rounding = dto['rounding'] as int;
    if (rounding == null) throw ArgumentError('code can\'t be empty');

    return CurrencyEntity(
      symbol: symbol,
      symbolNative: symbolNative,
      name: name,
      namePlural: namePlural,
      code: code,
      decimalDigits: decimalDigits,
      rounding: rounding,
    );
  }

  final String symbol;
  final String symbolNative;
  final String name;
  final String namePlural;
  final String code;
  final int decimalDigits;
  final int rounding;

  @override
  List<Object?> get props =>
      [symbol, symbolNative, name, namePlural, code, decimalDigits, rounding];
}
