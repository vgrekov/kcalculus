class PageConfig<T> {
  PageConfig({
    required this.size,
    this.offset,
    this.startAfter,
  }) {
    if (size <= 0) {
      throw ArgumentError('"size" argument must be a positive integer');
    }

    if (offset != null && offset! < 0) {
      throw ArgumentError(
          'If present, "offset" argument must be a non-negative integer');
    }
  }

  final int size;

  final int? offset;

  final T? startAfter;
}
