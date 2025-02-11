import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/foods/share/view_models/food_share_view_model.dart';
import 'package:qr_flutter/qr_flutter.dart';

class FoodShareScreen extends ConsumerWidget {
  const FoodShareScreen({
    super.key,
    required this.food,
  });

  final Food food;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(foodShareViewModel(food));

    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(16),
      ),
      padding: EdgeInsets.all(32),
      child: SizedBox(
        width: double.infinity,
        child: QrImageView(
          data: data,
          dataModuleStyle: QrDataModuleStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          eyeStyle: QrEyeStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            eyeShape: QrEyeShape.square,
          ),
          version: QrVersions.auto,
        ),
      ),
    );
  }
}
