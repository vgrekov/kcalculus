part of '../providers.dart';

// Services

final _databaseService = FutureProvider.autoDispose(
  (ref) async {
    final dbService = DatabaseService();

    ref.onDispose(() {
      dbService.dispose();
    });

    return dbService;
  },
);
