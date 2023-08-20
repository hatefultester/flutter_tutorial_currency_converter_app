import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/application/bloc/currency_conversion_bloc.dart';

import '../../../config/tags.dart';
import 'currency_conversion_bloc_test.dart';

void main() {
  group('CurrencyConversionEvent unit tests', () {
    test(
      '[AddCurrencyEvent] complete test',
      () {
        const event = AddCurrencyEvent();
        expect(
          event,
          const TypeMatcher<AddCurrencyEvent>(),
        );
        expect(event.props, <Object?>[]);
        expect(event, const AddCurrencyEvent());
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      '[ChangeCurrencyEvent] complete test',
      () {
        final event = ChangeCurrencyEvent(1, availableCurrencies.first);
        final event2 = ChangeCurrencyEvent(0, availableCurrencies.first);
        expect(
          event,
          const TypeMatcher<ChangeCurrencyEvent>(),
        );
        expect(
          event2,
          const TypeMatcher<ChangeCurrencyEvent>(),
        );
        expect(
          event.props,
          <Object?>[availableCurrencies.first, 1],
        );
        expect(
          event2.props,
          <Object?>[
            availableCurrencies.first,
            0,
          ],
        );
        expect(event == event2, isFalse);
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      '[RemoveCurrencyEvent] complete test',
      () {
        const event = RemoveCurrencyEvent(1);
        const event2 = RemoveCurrencyEvent(0);
        expect(
          event,
          const TypeMatcher<RemoveCurrencyEvent>(),
        );
        expect(
          event2,
          const TypeMatcher<RemoveCurrencyEvent>(),
        );
        expect(
          event.props,
          <Object?>[1],
        );
        expect(
          event2.props,
          <Object?>[0],
        );
        expect(event == event2, isFalse);
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      '[GetConversionsEvent] complete test',
      () {
        const event = GetConversionsEvent();
        const event2 = GetConversionsEvent();
        expect(
          event,
          const TypeMatcher<GetConversionsEvent>(),
        );
        expect(
          event2,
          const TypeMatcher<GetConversionsEvent>(),
        );
        expect(
          event.props,
          <Object?>[],
        );
        expect(
          event2.props,
          <Object?>[],
        );
        expect(event == event2, isTrue);
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      '[TryAgainEvent] complete test',
      () {
        const event = TryAgainEvent();
        const event2 = TryAgainEvent();
        expect(
          event,
          const TypeMatcher<TryAgainEvent>(),
        );
        expect(
          event2,
          const TypeMatcher<TryAgainEvent>(),
        );
        expect(
          event.props,
          <Object?>[],
        );
        expect(
          event2.props,
          <Object?>[],
        );
        expect(event == event2, isTrue);
      },
      tags: [
        TestTags.unit,
      ],
    );

    test(
      '[TryAgainEvent] complete test',
      () {
        const event = SetUpEvent();
        const event2 = SetUpEvent();
        expect(
          event,
          const TypeMatcher<SetUpEvent>(),
        );
        expect(
          event2,
          const TypeMatcher<SetUpEvent>(),
        );
        expect(
          event.props,
          <Object?>[],
        );
        expect(
          event2.props,
          <Object?>[],
        );
        expect(event == event2, isTrue);
      },
      tags: [
        TestTags.unit,
      ],
    );
  });
}
