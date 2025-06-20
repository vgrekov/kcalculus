import 'dart:async';

class Batcher<T> extends StreamTransformerBase<T, List<T>> {
  Batcher(this.batchSize) {
    if (batchSize <= 0) {
      throw ArgumentError.value(
        batchSize,
        'batchSize',
        'Must be a positive integer',
      );
    }
  }

  final int batchSize;

  @override
  Stream<List<T>> bind(Stream<T> stream) async* {
    final buffer = [];

    await for (final item in stream) {
      buffer.add(item);
      if (buffer.length >= batchSize) {
        yield List.unmodifiable(buffer);
        buffer.clear();
      }
    }

    if (buffer.isNotEmpty) {
      yield List.unmodifiable(buffer);
      buffer.clear();
    }
  }
}
