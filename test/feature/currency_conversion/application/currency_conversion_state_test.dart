import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/application/bloc/currency_conversion_bloc.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/domain/entities/currency_entity.dart';

import '../../../config/tags.dart';
import 'currency_conversion_bloc_test.dart';

void main() {
  group('InitCurrencyConversionState', () {
    test(
      'Equality test',
      () {
        const initState = InitCurrencyConversionState();
        const nextState = InitCurrencyConversionState();
        const loadingState = LoadingCurrencyConversionState();
        const errorState = ErrorCurrencyConversionState('message');
        final successState = SuccessCurrencyConversionState.fromCurrencies(
            availableCurrencies: [availableCurrencies.first]);
        expect(initState == nextState, isTrue);
        expect(initState == loadingState, isFalse);
        expect(initState == errorState, isFalse);
        expect(initState == successState, isFalse);
        expect(initState.props, [const TypeMatcher<Type>()]);
      },
      tags: [
        TestTags.unit,
      ],
    );
  });
  group('LoadingCurrencyConversionState', () {
    test(
      'Equality test',
      () {
        const loadingState = LoadingCurrencyConversionState();
        const nextLoadingStateState = LoadingCurrencyConversionState();
        const initState = InitCurrencyConversionState();
        const errorState = ErrorCurrencyConversionState('message');
        final successState = SuccessCurrencyConversionState.fromCurrencies(
            availableCurrencies: [availableCurrencies.first]);
        expect(loadingState == nextLoadingStateState, isTrue);
        expect(loadingState == initState, isFalse);
        expect(loadingState == errorState, isFalse);
        expect(loadingState == successState, isFalse);
        expect(loadingState.props, [const TypeMatcher<Type>()]);
      },
      tags: [
        TestTags.unit,
      ],
    );
  });

  group('SuccessCurrencyConversionState', () {
    test(
      '[fromCurrencies] returns [SuccessCurrencyConversionState]',
      () {
        const currencies = availableCurrencies;
        final state = SuccessCurrencyConversionState.fromCurrencies(
            availableCurrencies: currencies);
        expect(state.availableCurrencies, currencies);
        expect(state.currency, currencies.first);
        expect(state.currencies, <CurrencyEntity>[]);
        expect(state.snackBarMessage, isNull);
        expect(state.validationMessage, isNull);
        expect(state.conversions, isNull);
        expect(state.showLoadingOverlay, false);
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      '[fromCurrencies] throws [AssertionError] if currencies are empty',
          () {
        expect(() => SuccessCurrencyConversionState.fromCurrencies(
            availableCurrencies: const <CurrencyEntity>[]), throwsAssertionError);
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      '[copyWith] returns expected instance',
          () {
            const currencies = availableCurrencies;
            final state = SuccessCurrencyConversionState.fromCurrencies(
                availableCurrencies: currencies);
            expect(state.availableCurrencies, currencies);
            expect(state.currency, currencies.first);
            expect(state.currencies, <CurrencyEntity>[]);
            expect(state.snackBarMessage, isNull);
            expect(state.validationMessage, isNull);
            expect(state.conversions, isNull);
            expect(state.showLoadingOverlay, false);

            expect(state.copyWith(showLoadingOverlay: true).showLoadingOverlay, true);
            expect(state.copyWith(validationMessage: 'valid').validationMessage, 'valid');
            expect(state.copyWith(snackBarMessage: 'snack').snackBarMessage, 'snack');
            expect(state.copyWith(currencies: availableCurrencies).currencies, availableCurrencies);
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      '[copyWith] resets [showSnackbarMessage, showValidationMessage, showLoadingOverlay] if they are not present',
          () {
        const currencies = availableCurrencies;
        final state = SuccessCurrencyConversionState.fromCurrencies(
            availableCurrencies: currencies);
        expect(state.availableCurrencies, currencies);
        expect(state.currency, currencies.first);
        expect(state.currencies, <CurrencyEntity>[]);
        expect(state.snackBarMessage, isNull);
        expect(state.validationMessage, isNull);
        expect(state.conversions, isNull);
        expect(state.showLoadingOverlay, false);
        final state1 = state.copyWith(snackBarMessage: 'snack', validationMessage: 'valid', showLoadingOverlay: true);

        expect(state1.availableCurrencies, currencies);
        expect(state1.currency, currencies.first);
        expect(state1.currencies, <CurrencyEntity>[]);
        expect(state1.snackBarMessage, 'snack');
        expect(state1.validationMessage, 'valid');
        expect(state1.conversions, isNull);
        expect(state1.showLoadingOverlay, true);
        final state2 = state1.copyWith(currency: currencies.last);
        expect(state2.availableCurrencies, currencies);
        expect(state2.currency, currencies.last);
        expect(state2.currencies, <CurrencyEntity>[]);
        expect(state2.snackBarMessage, isNull);
        expect(state2.validationMessage, isNull);
        expect(state2.conversions, isNull);
        expect(state2.showLoadingOverlay, false);
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      'compare test returns even if [showLoadingOverlay, showValidationMessage, showSnackBarMessage] are different',
          () {
        const currencies = availableCurrencies;
        final state = SuccessCurrencyConversionState.fromCurrencies(
            availableCurrencies: currencies);
        final nextState = SuccessCurrencyConversionState.fromCurrencies(
            availableCurrencies: currencies).copyWith(
          snackBarMessage: 'Snackbar',
          validationMessage: 'Validation',
          showLoadingOverlay: true,
        );
        expect(state == nextState, isTrue);
        expect(state.props, nextState.props);
      },
      tags: [
        TestTags.unit,
      ],
    );
  });

  group('ErrorCurrencyConversionState', () {
    test(
      'Equality test',
      () {
        const errorStateOne = ErrorCurrencyConversionState('message');
        const errorStateOneDuplicate = ErrorCurrencyConversionState('message');
        const errorStateWithAnotherMessage =
            ErrorCurrencyConversionState('mes');
        const loadingState = LoadingCurrencyConversionState();
        const initState = InitCurrencyConversionState();
        final successState = SuccessCurrencyConversionState.fromCurrencies(
            availableCurrencies: [availableCurrencies.first]);
        expect(errorStateOne, errorStateOneDuplicate);
        expect(errorStateOne == errorStateWithAnotherMessage, isFalse);
        expect(errorStateOne == initState, isFalse);
        expect(errorStateOne == loadingState, isFalse);
        expect(errorStateOne == successState, isFalse);
      },
      tags: [
        TestTags.unit,
      ],
    );
  });
}
