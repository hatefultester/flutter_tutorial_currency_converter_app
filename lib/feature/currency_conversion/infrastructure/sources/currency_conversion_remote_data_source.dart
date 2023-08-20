
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_tutorial_currency_converter_app/feature/currency_conversion/infrastructure/extensions/endpoint.dart';
import 'package:http/http.dart' as http;
import '../../domain/enum/endpoint.dart';
import '../../domain/sources/i_currency_conversion_remote_data_source.dart';


final class CurrencyConversionRemoteDataSource
    implements ICurrencyConversionRemoteDataSource {
  
  @override
  Future getRequest({
    required Map<String, String> headers,
    required Endpoint endpoint,
  }) async {
    try {
      Uri? uri = Uri.tryParse(endpoint.url);
      if (uri == null) return;
      final response = await http.get(uri, headers: headers);
      if (response.statusCode == 200) return jsonDecode(response.body);
    } on Exception catch (e) {
      debugPrint(e.toString());
    }
  }
}
