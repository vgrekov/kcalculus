part of '../providers.dart';

// Services

final _databaseServiceProvider = FutureProvider.autoDispose(
  (ref) async {
    final dbService = DatabaseService();

    ref.onDispose(() {
      dbService.dispose();
    });

    return dbService;
  },
);
