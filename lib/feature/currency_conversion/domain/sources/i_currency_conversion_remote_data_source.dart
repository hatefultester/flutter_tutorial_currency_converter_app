
import '../enum/endpoint.dart';

abstract interface class ICurrencyConversionRemoteDataSource {
  Future<dynamic> getRequest({
    required Map<String, String> headers,
    required Endpoint endpoint,
  });
}
