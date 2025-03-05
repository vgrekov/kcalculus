import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/domain/models/food.dart';
import 'package:kcalculus/ui/common/widgets/edible_main_info.dart';
import 'package:kcalculus/ui/foods/share/view_models/food_share_view_model.dart';
import 'package:kcalculus/utils/l10n.dart';
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
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        body: Padding(
          padding: EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              QrImageView(
                data: data,
                dataModuleStyle: QrDataModuleStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
                eyeStyle: QrEyeStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  eyeShape: QrEyeShape.square,
                ),
                version: QrVersions.auto,
              ),
              const SizedBox(height: 16),
              EdibleMainInfo(edible: food),
            ],
          ),
        ),
        bottomNavigationBar: Container(
          color: Theme.of(context).colorScheme.surfaceContainer,
          padding: const EdgeInsets.only(
            left: 32,
            right: 32,
            bottom: 32,
            top: 16,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  l10n(context).actionClose,
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
