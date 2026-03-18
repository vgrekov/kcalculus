import 'dart:collection';

import 'package:kcalculus/domain/dish/models/dish.dart';
import 'package:kcalculus/domain/edible/models/edible.dart';

/// Retrieves all the dishes that depend on the provided edible as ingredient.
/// Including transitive dependency.
///
/// This uses a simplified version of the [Kahn's algorithm](https://en.wikipedia.org/wiki/Topological_sorting#Kahn's_algorithm)
///
/// Returns dishes with updated ingredients ready to be persisted.
Future<List<Dish>> prepareIngredientDependencyUpdates(
  Edible root, {
  required Future<List<String>> Function(String id) getDishesByIngredient,
  required Future<Dish?> Function(String id) getDish,
}) async {
  if (root.id == null) return const [];

  final resolvedEdibles = <String, Edible>{root.id!: root};

  final graph = <String, List<String>>{};
  final inDegree = <String, int>{root.id!: 0};

  final buildQueue = Queue.of([root]);

  while (buildQueue.isNotEmpty) {
    final edible = buildQueue.removeFirst();

    final dishIds = await getDishesByIngredient(edible.id!);

    graph[edible.id!] = dishIds;

    for (final dishId in dishIds) {
      if (!resolvedEdibles.containsKey(dishId)) {
        final dish = await getDish(dishId);
        if (dish != null) {
          resolvedEdibles[dishId] = dish;
          buildQueue.add(dish);
        }
      }

      inDegree[dishId] = (inDegree[dishId] ?? 0) + 1;
    }
  }

  final result = <Dish>[];

  // `root` is the only node with zero in degree score
  final processQueue = Queue.of([root]);

  while (processQueue.isNotEmpty) {
    var edible = processQueue.removeFirst();

    if (edible is Dish && edible.id != root.id) {
      edible = edible.copyWith(
        ingredients: edible.ingredients.map(
          (i) {
            final e = resolvedEdibles[i.edible.id];
            return e == null ? i : i.copyWith(edible: e);
          },
        ).toList(),
      );

      resolvedEdibles[edible.id!] = edible;

      result.add(edible);
    }

    final dishIds = graph[edible.id];
    if (dishIds != null && dishIds.isNotEmpty) {
      for (final dishId in dishIds) {
        final score = (inDegree[dishId] ?? 0) - 1;
        inDegree[dishId] = score;
        if (score == 0) {
          processQueue.add(resolvedEdibles[dishId]!);
        }
      }
    }
  }

  return result;
}
