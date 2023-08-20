part of 'currency_conversion_bloc.dart';

sealed class CurrencyConversionEvent extends Equatable {
  const CurrencyConversionEvent();

  @override
  List<Object?> get props => [];
}

final class AddCurrencyEvent extends CurrencyConversionEvent {
  const AddCurrencyEvent();
}

final class ChangeBaseCurrencyEvent extends CurrencyConversionEvent {
  const ChangeBaseCurrencyEvent(this.currency);

  final CurrencyEntity currency;

  @override
  List<Object?> get props => [currency];
}

final class ChangeCurrencyEvent extends CurrencyConversionEvent {
  const ChangeCurrencyEvent(this.index, this.currency);

  final int index;
  final CurrencyEntity currency;

  @override
  List<Object?> get props => [currency, index];
}

final class RemoveCurrencyEvent extends CurrencyConversionEvent {
  const RemoveCurrencyEvent(this.index);

  final int index;

  @override
  List<Object?> get props => [index];
}

final class GetConversionsEvent extends CurrencyConversionEvent {
  const GetConversionsEvent();
}

final class TryAgainEvent extends CurrencyConversionEvent {
  const TryAgainEvent();
}

final class SetUpEvent extends CurrencyConversionEvent {
  const SetUpEvent();
}