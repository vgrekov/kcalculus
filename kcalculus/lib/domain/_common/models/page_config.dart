class PageConfig<T> {
  const PageConfig({
    required this.size,
    this.offset,
    this.startAfter,
  });

  final int size;

  final int? offset;

  final T? startAfter;
}
