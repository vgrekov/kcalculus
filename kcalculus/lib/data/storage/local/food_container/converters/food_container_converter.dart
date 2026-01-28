import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/food_container/models/food_container_db_model.dart';
import 'package:kcalculus/domain/_common/models/amount.dart';
import 'package:kcalculus/domain/_common/models/units.dart';
import 'package:kcalculus/domain/dish/models/food_container.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalFoodContainerConverter extends Notifier<void> {
  @override
  void build() {}

  FoodContainerDbModel toDbModel(FoodContainer model, [String? containerId]) {
    return FoodContainerDbModel(
      id: (containerId ?? model.id)!,
      name: model.name,
      description: model.description,
      weight_unit: model.weight.unit.name,
      weight_value: model.weight.value,
      created_at: model.createdAt != null
          ? dt.formatISO8601(model.createdAt!)
          : null,
      updated_at: model.updatedAt != null
          ? dt.formatISO8601(model.updatedAt!)
          : null,
      deleted_at: model.deletedAt != null
          ? dt.formatISO8601(model.deletedAt!)
          : null,
    );
  }

  FoodContainer toModel(FoodContainerDbModel dbModel) {
    return FoodContainer(
      id: dbModel.id,
      name: dbModel.name,
      description: dbModel.description ?? '',
      weight: Amount(
        unit: Unit.of(dbModel.weight_unit),
        value: dbModel.weight_value,
      ),
      createdAt: (dbModel.created_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      updatedAt: (dbModel.updated_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.updated_at!)
          : null,
      deletedAt: (dbModel.deleted_at?.isNotEmpty ?? false)
          ? dt.parseISO8601(dbModel.deleted_at!)
          : null,
    );
  }
}

final localFoodContainerConverterProvider =
    NotifierProvider<LocalFoodContainerConverter, void>(
      LocalFoodContainerConverter.new,
    );
