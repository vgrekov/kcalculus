import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kcalculus/_data/app_config/models/app_config.dart';
import 'package:kcalculus/data/services/open_food_facts/product_api_model.dart';
import 'package:logging/logging.dart';

final _log = Logger('OpenFoodFactsService');

class OpenFoodFactsService {
  OpenFoodFactsService({
    required String appName,
    required String version,
    required http.Client httpClient,
    AppConfig? appConfig,
  })  : _appName = appName,
        _version = version,
        _httpClient = httpClient,
        _appConfig = appConfig;

  final String _appName;

  final String _version;

  final http.Client _httpClient;

  final AppConfig? _appConfig;

  Uri _getProductByBarcodeUrl(String barcode) => Uri.parse(
        '${_appConfig!.openFoodFactsBaseUrl}/api/v2/product/$barcode',
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
      'User-Agent': '$_appName/$_version (${_appConfig!.contactEmail})',
    };
  }

  Future<ProductApiModel?> getProductByBarcode(String barcode) async {
    _log.finer('getProductByBarcode() START');

    if (_appConfig == null) {
      _log.info('Unable to make OFF call due to no app config');
      return null;
    }

    _log.finest('getProductByBarcode() Getting product by barcode: $barcode');

    final response = await _httpClient
        .get(
          _getProductByBarcodeUrl(barcode),
          headers: await _getUserAgent(),
        )
        .timeout(Duration(milliseconds: _appConfig.openFoodFactsTimeoutMillis));

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
