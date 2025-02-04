part of '../providers.dart';

// Services

final _databaseServiceProvider = Provider.autoDispose(
  (ref) {
    final dbService = DatabaseService();

    ref.onDispose(() {
      dbService.dispose();
    });

    return dbService;
  },
);
