import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/application/bloc/currency_conversion_bloc.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/domain/entities/currency_entity.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/domain/repositories/i_currency_conversion_repository.dart';
import 'package:mocktail/mocktail.dart';

import '../../../config/tags.dart';

class MockCurrencyConversionRepository extends Mock
    implements ICurrencyConversionRepository {}

void main() {
  late final ICurrencyConversionRepository repository;

  setUpAll(() => repository = MockCurrencyConversionRepository());

  group('Base test', () {
    test(
      'Initial state is InitCurrencyConversion state',
      () {
        final bloc = CurrencyConversionBloc.initial(repository: repository);
        expect(bloc.state, const InitCurrencyConversionState());
      },
      tags: [
        TestTags.logic,
      ],
    );

    test(
      'Bloc has repository that extends [ICurrencyConversionRepository]',
      () {
        final bloc = CurrencyConversionBloc.initial(repository: repository);
        expect(bloc.repository, repository);
        expect(bloc.repository,
            const TypeMatcher<ICurrencyConversionRepository>());
      },
      tags: [
        TestTags.logic,
      ],
    );
  });

  group('[SetUpEvent]', () {
    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[SetUpEvent] emits [LoadingCurrencyConversionState, SuccessCurrencyConversionState] from [InitCurrencyConversionState]',
      setUp: () {
        when(() => repository.getCurrencies())
            .thenAnswer((invocation) async => availableCurrencies);
      },
      build: () => CurrencyConversionBloc.initial(repository: repository),
      act: (bloc) => bloc.add(const SetUpEvent()),
      expect: () => <CurrencyConversionState>[
        const LoadingCurrencyConversionState(),
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ),
      ],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[SetUpEvent] emits [LoadingCurrencyConversionState, SuccessCurrencyConversionState] from [ErrorCurrencyConversionState]',
      setUp: () {
        when(() => repository.getCurrencies())
            .thenAnswer((invocation) async => availableCurrencies);
      },
      seed: () => const ErrorCurrencyConversionState('Unexpected'),
      build: () => CurrencyConversionBloc.initial(repository: repository),
      act: (bloc) => bloc.add(const SetUpEvent()),
      expect: () => <CurrencyConversionState>[
        const LoadingCurrencyConversionState(),
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ),
      ],
      tags: [
        TestTags.logic,
      ],

    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[TryAgainEvent] emits [LoadingCurrencyConversionState, SuccessCurrencyConversionState] from [ErrorCurrencyConversionState]',
      setUp: () {
        when(() => repository.getCurrencies())
            .thenAnswer((invocation) async => availableCurrencies);
      },
      seed: () => const ErrorCurrencyConversionState('Unexpected'),
      build: () => CurrencyConversionBloc.initial(repository: repository),
      act: (bloc) => bloc.add(const TryAgainEvent()),
      expect: () => <CurrencyConversionState>[
        const LoadingCurrencyConversionState(),
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ),
      ],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[SetUpEvent] emits [] if state is [SuccessCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ),
      act: (bloc) => bloc.add(const SetUpEvent()),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[SetUpEvent] emits [] if state is [LoadingCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const LoadingCurrencyConversionState(),
      act: (bloc) => bloc.add(const SetUpEvent()),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );
  });

  group('[AddCurrencyEvent]', () {
    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[AddCurrencyEvent] emits [SuccessCurrencyConversionState] with added Currency',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ),
      act: (bloc) => bloc.add(const AddCurrencyEvent()),
      expect: () => <CurrencyConversionState>[
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ).copyWith(
          currencies: [
            availableCurrencies.first,
          ],
        ),
      ],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[AddCurrencyEvent] emits [] if state is not [LoadingCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const LoadingCurrencyConversionState(),
      act: (bloc) => bloc.add(const AddCurrencyEvent()),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[AddCurrencyEvent] emits [] if state is not [InitCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const InitCurrencyConversionState(),
      act: (bloc) => bloc.add(const AddCurrencyEvent()),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[AddCurrencyEvent] emits [] if state is not [ErrorCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const ErrorCurrencyConversionState('message'),
      act: (bloc) => bloc.add(const AddCurrencyEvent()),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );
  });

  group('[RemoveCurrencyEvent]', () {
    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[RemoveCurrencyEvent] emits [SuccessCurrencyConversionState] with removed Currency',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies.first,
        ],
      ),
      act: (bloc) => bloc.add(
        const RemoveCurrencyEvent(
          0,
        ),
      ),
      expect: () => <CurrencyConversionState>[
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ),
      ],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[RemoveCurrencyEvent] emits [] with index is negative',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies.first,
        ],
      ),
      act: (bloc) => bloc.add(
        const RemoveCurrencyEvent(
          -1,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[RemoveCurrencyEvent] emits [] with index is out of range',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies.first,
        ],
      ),
      act: (bloc) => bloc.add(
        const RemoveCurrencyEvent(
          10,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[RemoveCurrencyEvent] emits [] with state is not [InitCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const InitCurrencyConversionState(),
      act: (bloc) => bloc.add(
        const RemoveCurrencyEvent(
          0,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[RemoveCurrencyEvent] emits [] with state is not [ErrorCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const ErrorCurrencyConversionState('message'),
      act: (bloc) => bloc.add(
        const RemoveCurrencyEvent(
          0,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[RemoveCurrencyEvent] emits [] with state is not [LoadingCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const LoadingCurrencyConversionState(),
      act: (bloc) => bloc.add(
        const RemoveCurrencyEvent(
          0,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );
  });

  group('[ChangeCurrencyEvent]', () {
    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [SuccessCurrencyConversionState] with changed Currency in [Currencies]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies[0],
          availableCurrencies[1],
          availableCurrencies[2],
        ],
      ),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          1,
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ).copyWith(
          currencies: [
            availableCurrencies[0],
            availableCurrencies.last,
            availableCurrencies[2],
          ],
        ),
      ],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [SuccessCurrencyConversionState] with currencies are empty. it will create new currency ',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [],
      ),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          1,
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ).copyWith(
          currencies: [
            availableCurrencies.last,
          ],
        ),
      ],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [SuccessCurrencyConversionState] with base currency changed if index is -1 ',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies.last,
        ],
        currency: availableCurrencies.first,
      ),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          -1,
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ).copyWith(
          currencies: [
            availableCurrencies.last,
          ],
          currency: availableCurrencies.last,
        ),
      ],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeBaseCurrency] emits [SuccessCurrencyConversionState] with base currency changed',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies.last,
        ],
        currency: availableCurrencies.first,
      ),
      act: (bloc) => bloc.add(
        ChangeBaseCurrencyEvent(
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[
        SuccessCurrencyConversionState.fromCurrencies(
          availableCurrencies: availableCurrencies,
        ).copyWith(
          currencies: [
            availableCurrencies.last,
          ],
          currency: availableCurrencies.last,
        ),
      ],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [] if currency is same',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies[0],
          availableCurrencies[1],
          availableCurrencies[2],
        ],
      ),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          1,
          availableCurrencies[1],
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeBaseCurrency] emits [] if currency is same',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies.last,
        ],
        currency: availableCurrencies.last,
      ),
      act: (bloc) => bloc.add(
        ChangeBaseCurrencyEvent(
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [] if index is negative and not -1 ',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies.last,
        ],
      ),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          -7,
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [] if list of currencies are shorter then index ',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => SuccessCurrencyConversionState.fromCurrencies(
        availableCurrencies: availableCurrencies,
      ).copyWith(
        currencies: [
          availableCurrencies.last,
        ],
      ),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          7,
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [] if state is not [InitCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const InitCurrencyConversionState(),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          1,
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [] if state is not [LoadingCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const LoadingCurrencyConversionState(),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          1,
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );

    blocTest<CurrencyConversionBloc, CurrencyConversionState>(
      '[ChangeCurrencyEvent] emits [] if state is not [ErrorCurrencyConversionState]',
      build: () => CurrencyConversionBloc.initial(repository: repository),
      seed: () => const ErrorCurrencyConversionState('message'),
      act: (bloc) => bloc.add(
        ChangeCurrencyEvent(
          1,
          availableCurrencies.last,
        ),
      ),
      expect: () => <CurrencyConversionState>[],
      tags: [
        TestTags.logic,
      ],
    );
  });
}

const availableCurrencies = [
  CurrencyEntity(
      symbol: 'CZK',
      symbolNative: 'Czk',
      name: 'Koruna',
      namePlural: 'Koruny',
      code: 'CZK',
      decimalDigits: 0,
      rounding: 0),
  CurrencyEntity(
      symbol: 'EUR',
      symbolNative: 'EUR',
      name: 'Euro',
      namePlural: 'EUR',
      code: 'EUR',
      decimalDigits: 0,
      rounding: 0),
  CurrencyEntity(
      symbol: 'USD',
      symbolNative: 'USD',
      name: 'United state dollars',
      namePlural: 'USD',
      code: 'USD',
      decimalDigits: 0,
      rounding: 0),
  CurrencyEntity(
      symbol: 'RSD',
      symbolNative: 'RSD',
      name: 'Serbian dinar',
      namePlural: 'Serbian dinar\'s',
      code: 'RSD',
      decimalDigits: 0,
      rounding: 0),
];
