import 'dart:convert';
import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/food.dart';

final foodShareViewModel = Provider.family.autoDispose<String, Food>(
  (ref, arg) {
    String json = jsonEncode(arg.toJsonForSharing());
    List<int> bytes = utf8.encode(json);
    List<int> compressedBytes = gzip.encode(bytes);
    return base64.encode(compressedBytes);
  },
);
