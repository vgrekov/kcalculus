import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/food/models/food.dart';

final foodShareViewModel = Provider.family.autoDispose<String, Food>(
  (ref, arg) {
    final json = jsonEncode(arg.toJsonForSharing());
    final bytes = utf8.encode(json);
    final compressedBytes = gzip.encode(bytes);
    return base64.encode(compressedBytes);
  },
);
