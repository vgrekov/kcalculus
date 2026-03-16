import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:kcalculus/data/_common/providers.dart';
import 'package:kcalculus/data/app_config/models/app_config.dart';
import 'package:kcalculus/data/app_config/services/app_config_service.dart';
import 'package:kcalculus/data/open_food_facts/models/product_api_model.dart';
import 'package:logging/logging.dart';

final _log = Logger('OpenFoodFactsService');

class OpenFoodFactsService extends Notifier<void> {
  @override
  void build() {}

  Uri _getProductByBarcodeUrl(
    String barcode, {
    required AppConfig appConfig,
  }) =>
      Uri.parse(
        '${appConfig.openFoodFacts.baseUrl}/api/v2/product/$barcode',
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

  Map<String, String> _getUserAgent({
    required String appName,
    required String version,
    required AppConfig appConfig,
  }) {
    return {
      'User-Agent':
          '$appName/$version (${appConfig.openFoodFacts.contactEmail})',
    };
  }

  Future<ProductApiModel?> getProductByBarcode(String barcode) async {
    _log.finer('getProductByBarcode() START');

    final appConfig = await ref.read(appConfigServiceProvider.future);
    if (appConfig == null) {
      _log.info('Unable to make OFF call due to no app config');
      return null;
    }

    final httpClient = ref.read(openFoodFactsHttpClientProvider);
    final appInfo = await ref.read(appInfoProvider.future);

    _log.finest('getProductByBarcode() Getting product by barcode: $barcode');

    final response = await httpClient
        .get(
          _getProductByBarcodeUrl(
            barcode,
            appConfig: appConfig,
          ),
          headers: _getUserAgent(
            appName: appInfo.appName,
            version: appInfo.version,
            appConfig: appConfig,
          ),
        )
        .timeout(
          Duration(milliseconds: appConfig.openFoodFacts.timeoutMillis),
        );

    _log.finer(
      'getProductByBarcode() Response status code: ${response.statusCode}',
    );

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

final openFoodFactsHttpClientProvider = Provider<http.Client>(
  (ref) => http.Client(),
);

final openFoodFactsServiceProvider =
    NotifierProvider<OpenFoodFactsService, void>(
      OpenFoodFactsService.new,
    );
