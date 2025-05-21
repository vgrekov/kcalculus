import 'package:kcalculus/data/services/local/database/food_container/food_container_db_model.dart';
import 'package:kcalculus/domain/models/amount.dart';
import 'package:kcalculus/domain/models/food_container.dart';
import 'package:kcalculus/domain/models/units.dart';
import 'package:kcalculus/utils/datetime.dart' as dt;

class LocalFoodContainerConverter {
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
      createdAt: dbModel.created_at != null
          ? dt.parseISO8601(dbModel.created_at!)
          : null,
      updatedAt: dbModel.updated_at != null
          ? dt.parseISO8601(dbModel.updated_at!)
          : null,
    );
  }
}
