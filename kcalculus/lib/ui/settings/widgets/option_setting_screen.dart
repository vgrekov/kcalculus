import 'package:flutter/material.dart';
import 'package:kcalculus/ui/settings/widgets/settings_group.dart';

class OptionSettingScreen<T> extends StatelessWidget {
  const OptionSettingScreen({
    super.key,
    required this.title,
    required this.options,
    this.selectedOption,
    required this.optionTitleProvider,
  });

  final String title;

  final List<T> options;

  final T? selectedOption;

  final String Function(T) optionTitleProvider;

  void _selectOption(BuildContext context, T option) {
    Navigator.of(context).pop(option);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SettingsGroup(
            children: [
              for (final option in options)
                ListTile(
                  title: Text(
                    optionTitleProvider(option),
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  trailing: option != selectedOption
                      ? null
                      : Icon(
                          Icons.check,
                          size: 16,
                          color: Theme.of(context).colorScheme.primary,
                        ),
                  onTap: () {
                    _selectOption(context, option);
                  },
                ),
            ],
          ),
        ),
      ),
    );
  }
}
