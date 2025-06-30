import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kcalculus/data/services/open_food_facts/product_api_model.dart';
import 'package:logging/logging.dart';

final _log = Logger('OpenFoodFactsService');

class OpenFoodFactsService {
  OpenFoodFactsService({
    required String openFoodFactsBaseUrl,
    required String contactEmail,
    required String appName,
    required String version,
    required http.Client httpClient,
    required int timeoutMillis,
  })  : _openFoodFactsBaseUrl = openFoodFactsBaseUrl,
        _contactEmail = contactEmail,
        _appName = appName,
        _version = version,
        _httpClient = httpClient,
        _timeoutMillis = timeoutMillis;

  final String _openFoodFactsBaseUrl;

  final String _contactEmail;

  final String _appName;

  final String _version;

  final http.Client _httpClient;

  final int _timeoutMillis;

  Uri _getProductByBarcodeUrl(String barcode) => Uri.parse(
        '$_openFoodFactsBaseUrl/api/v2/product/$barcode',
      ).replace(
        queryParameters: {
          'product_type': 'food',
          'fields': [
            'product_name',
            'brands',
            'serving_quantity',
            'serving_quantity_unit',
            'nutrition_data_per',
            'nutriments',
          ].join(','),
        },
      );

  Future<Map<String, String>> _getUserAgent() async {
    return {
      'User-Agent': '$_appName/$_version ($_contactEmail)',
    };
  }

  Future<ProductApiModel?> getProductByBarcode(String barcode) async {
    _log.finer('getProductByBarcode() START');

    _log.finest('getProductByBarcode() Getting product by barcode: $barcode');

    final response = await _httpClient
        .get(
          _getProductByBarcodeUrl(barcode),
          headers: await _getUserAgent(),
        )
        .timeout(Duration(milliseconds: _timeoutMillis));

    _log.finer(
        'getProductByBarcode() Response status code: ${response.statusCode}');

    _log.finest('getProductByBarcode() Response body ${response.body}');

    if (response.statusCode != 200) {
      return null;
    }

    final Map<String, dynamic> bodyJson = jsonDecode(response.body);

    final status = bodyJson['status'] as int;
    if (status != 1) {
      return null;
    }

    final product = ProductApiModel.fromJson(
      bodyJson['product'] as Map<String, dynamic>,
    );

    _log.finer('getProductByBarcode() END');

    return product;
  }
}
