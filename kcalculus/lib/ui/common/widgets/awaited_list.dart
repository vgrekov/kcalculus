import 'package:flutter/material.dart';
import 'package:kcalculus/ui/common/widgets/awaited.dart';

class AwaitedList<T> extends StatelessWidget {
  AwaitedList({
    super.key,
    this.future,
    this.loading,
    this.data,
    this.empty,
    this.error,
  }) {
    if (loading == null && data == null && empty == null && error == null) {
      throw ArgumentError(
          'At least one of "loading", "data" or "error" must be provided.');
    }
  }

  final Future<List<T>>? future;

  final Widget Function(BuildContext)? loading;

  final Widget Function(BuildContext, List<T> data)? data;

  final Widget Function(BuildContext)? empty;

  final Widget Function(BuildContext, Object? error)? error;

  @override
  Widget build(BuildContext context) {
    return Awaited<List<T>>(
      future: future,
      loading: loading,
      error: error,
      data: (context, data) {
        if (data?.isNotEmpty == true) {
          return this.data?.call(context, data!) ?? const SizedBox.shrink();
        } else {
          return this.empty?.call(context) ?? const SizedBox.shrink();
        }
      },
    );
  }
}
