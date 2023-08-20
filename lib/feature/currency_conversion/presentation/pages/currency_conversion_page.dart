import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/repositories/i_currency_conversion_repository.dart';
import '../../infrastructure/repositories/currency_conversion_repository.dart';
import '../../application/bloc/currency_conversion_bloc.dart';
import '../../infrastructure/sources/mock_currency_conversion_remote_data_source.dart';
import '../controller/currency_conversion_view_controller.dart';

class CurrencyConversionPage extends StatelessWidget {
  const CurrencyConversionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider<ICurrencyConversionRepository>(
      create: (_) => CurrencyConversionRepository(
        MockCurrencyConversionRemoteDataSource(),
      ),
      child: BlocProvider<CurrencyConversionBloc>(
        create: (context) => CurrencyConversionBloc.initial(
          repository:
              RepositoryProvider.of<ICurrencyConversionRepository>(context),
        ),
        child: Builder(
          builder: (context) {
            return CurrencyConversionViewController(
              bloc: BlocProvider.of<CurrencyConversionBloc>(context),
            );
          },
        ),
      ),
    );
  }
}
