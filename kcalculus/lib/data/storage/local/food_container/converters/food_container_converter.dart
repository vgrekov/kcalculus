import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/data/storage/local/food_container/models/food_container_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/models/units.dart';
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
    );
  }
}

final localFoodContainerConverterProvider =
    NotifierProvider<LocalFoodContainerConverter, void>(
  LocalFoodContainerConverter.new,
);
