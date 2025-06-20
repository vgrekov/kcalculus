import 'package:flutter/services.dart';

Stream<List<int>> streamAsset(
  String key, {
  int chunkSizeInBytes = 4096,
}) async* {
  final data = await rootBundle.load(key);
  final bytes = data.buffer.asUint8List();

  int offset = 0;
  while (offset < bytes.length) {
    final end = (offset + chunkSizeInBytes < bytes.length)
        ? offset + chunkSizeInBytes
        : bytes.length;
    yield bytes.sublist(offset, end);
    offset = end;
  }
}
