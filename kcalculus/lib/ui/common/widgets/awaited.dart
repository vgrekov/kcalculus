import 'package:flutter/material.dart';

class Awaited<T> extends StatelessWidget {
  Awaited({
    super.key,
    this.future,
    this.loading,
    this.data,
    this.error,
  }) {
    if (loading == null && data == null && error == null) {
      throw ArgumentError(
          'At least one of "loading", "data" or "error" must be provided.');
    }
  }

  final Future<T>? future;

  final Widget Function(BuildContext)? loading;

  final Widget Function(BuildContext, T? data)? data;

  final Widget Function(BuildContext, Object? error)? error;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        final isLoading = snapshot.connectionState == ConnectionState.waiting;
        if (isLoading) {
          return loading?.call(context) ?? const SizedBox.shrink();
        } else if (snapshot.hasError) {
          return error?.call(context, snapshot.error) ??
              const SizedBox.shrink();
        } else {
          return data?.call(context, snapshot.data) ?? const SizedBox.shrink();
        }
      },
    );
  }
}
