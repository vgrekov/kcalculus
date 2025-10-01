import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/auth/services/auth_service.dart';
import 'package:kcalculus/data/auth/utils/auth.dart';
import 'package:kcalculus/data/storage/firestore/user_data/models/user_data_firestore_model.dart';
import 'package:kcalculus/data/storage/firestore/user_data/services/user_data_service.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/domain/nutrition/models/nutrient.dart';

class FirestoreDefaultNutrientRepository extends DefaultNutrientRepository {
  static final _kNutrientsByName = {
    for (final nutrient in Nutrient.values) nutrient.name: nutrient
  };

  @override
  FutureOr<List<Nutrient>> build() {
    ref.watch(authServiceProvider);

    return Auth.guard(
      (user) async {
        final userData = await _userDataService.getById(user.uid);

        return userData?.defaultNutrients != null
            ? _defaultNutrientsFromJson(userData!.defaultNutrients!)
            : _getAppDefaults();
      },
      onNotAuthenticated: _getAppDefaults,
    );
  }

  FirestoreUserDataService get _userDataService =>
      ref.read(firestoreUserDataServiceProvider.notifier);

  @override
  Future<void> saveAll(List<Nutrient> nutrients) {
    return Auth.guard((user) async {
      var userData = await _userDataService.getById(user.uid);

      if (userData == null) {
        await _userDataService.add(
          UserDataFirestoreModel(
            id: user.uid,
            defaultNutrients: _defaultNutrientsFromDomain(nutrients),
          ),
        );
      } else {
        await _userDataService.update(
          userData.copyWith(
            defaultNutrients: _defaultNutrientsFromDomain(nutrients),
          ),
        );
      }

      state = AsyncData(nutrients);
    });
  }

  Future<List<Nutrient>> _getAppDefaults() async {
    final ref = FirebaseDatabase.instance.ref('default_nutrients');
    final snapshot = await ref.get();
    final data = List<String>.from(snapshot.value as List);

    return _defaultNutrientsFromJson(data);
  }

  List<Nutrient> _defaultNutrientsFromJson(List<String> json) {
    return json
        .where(
          (n) => _kNutrientsByName.containsKey(n),
        )
        .map(
          (n) => Nutrient.of(n),
        )
        .toList();
  }

  List<String> _defaultNutrientsFromDomain(List<Nutrient> nutrients) {
    return nutrients.map((n) => n.name).toList();
  }
}

final firestoreDefaultNutrientRepositoryProvider =
    AsyncNotifierProvider<DefaultNutrientRepository, List<Nutrient>>(
  FirestoreDefaultNutrientRepository.new,
);
