import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/utils/l10n.dart';
import 'package:kcalculus/widgets/screen_tab_bar.dart';

class FoodsScreen extends ConsumerStatefulWidget {
  const FoodsScreen({super.key});

  @override
  ConsumerState<FoodsScreen> createState() {
    return _FoodsScreenState();
  }
}

class _FoodsScreenState extends ConsumerState<FoodsScreen> {
  final _searchController = TextEditingController();

  void _updateSearchQuery(String query) {}

  void _resetSearchQuery() {}

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          l10n(context).screenFoods,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onPrimaryContainer,
              ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                hintStyle: TextStyle(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.5),
                  fontWeight: FontWeight.normal,
                ),
                hintText: l10n(context).hintEdibleSearchBox,
                isDense: true,
                suffixIcon: IconButton(
                    onPressed: _resetSearchQuery,
                    icon: const Icon(
                      Icons.clear,
                    )),
              ),
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface,
              ),
              textCapitalization: TextCapitalization.words,
              onChanged: _updateSearchQuery,
            ),
          ),
        ),
      ),
      body: const Center(
        child: Text(
          "TBD",
        ),
      ),
      bottomNavigationBar: const ScreenTabBar(
        selectedTab: ScreenTab.foods,
      ),
    );
  }
}
