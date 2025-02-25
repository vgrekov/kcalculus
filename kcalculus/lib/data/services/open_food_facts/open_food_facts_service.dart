import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:kcalculus/data/services/open_food_facts/product_api_model.dart';
import 'package:logging/logging.dart';
import 'package:package_info_plus/package_info_plus.dart';

final _log = Logger('OpenFoodFactsService');

class OpenFoodFactsService {
  OpenFoodFactsService({
    required String openFoodFactsBaseUrl,
    required String contactEmail,
  })  : _openFoodFactsBaseUrl = openFoodFactsBaseUrl,
        _contactEmail = contactEmail;

  final String _openFoodFactsBaseUrl;

  final String _contactEmail;

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
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String appName = packageInfo.appName;
    String version = packageInfo.version;

    return {
      'User-Agent': '$appName/$version ($_contactEmail)',
    };
  }

  Future<ProductApiModel?> getProductByBarcode(String barcode) async {
    _log.finer('getProductByBarcode() START');

    _log.finest('getProductByBarcode() Getting product by barcode: $barcode');

    final response = await http.get(
      _getProductByBarcodeUrl(barcode),
      headers: await _getUserAgent(),
    );

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
