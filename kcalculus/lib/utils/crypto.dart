import 'dart:async';
import 'dart:convert';

import 'package:crypto/crypto.dart';

class HashTap implements StreamTransformer<List<int>, List<int>> {
  HashTap({
    required this.hash,
  }) {
    _digestSink = _SingleValueSink<Digest>();
    _byteSink = hash.startChunkedConversion(_digestSink);
    _transformer = StreamTransformer<List<int>, List<int>>.fromHandlers(
      handleData: _handleData,
      handleDone: _handleDone,
    );
  }

  final Hash hash;

  late final _SingleValueSink<Digest> _digestSink;

  late final ByteConversionSink _byteSink;

  late final StreamTransformer<List<int>, List<int>> _transformer;

  Digest get digest => _digestSink.value;

  @override
  Stream<List<int>> bind(Stream<List<int>> stream) {
    return _transformer.bind(stream);
  }

  @override
  StreamTransformer<RS, RT> cast<RS, RT>() {
    return _transformer.cast<RS, RT>();
  }

  void _handleData(List<int> chunk, EventSink<List<int>> sink) {
    _byteSink.add(chunk);
    sink.add(chunk);
  }

  void _handleDone(EventSink<List<int>> sink) {
    _byteSink.close();
    sink.close();
  }
}

class _SingleValueSink<T> implements Sink<T> {
  T? _value;

  T get value => _value!;

  @override
  void add(T value) {
    if (_value != null) {
      throw StateError('Value already present');
    }

    _value = value;
  }

  @override
  void close() {
    if (_value == null) {
      throw StateError('Value missing');
    }
  }
}
