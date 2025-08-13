import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/common/widgets/email_input.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/ui/common/widgets/password_input.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class NewAccountScreen extends ConsumerStatefulWidget {
  const NewAccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewAccountScreenState();
  }
}

class _NewAccountScreenState extends ConsumerState<NewAccountScreen> {
  final _form = GlobalKey<FormState>();

  void _createAccount() {
    _form.currentState!.validate();
  }

  void _continueWithoutAccount() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const MealListScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Inattentive(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            l10n(context).screenNewAccount,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onSurface,
                ),
          ),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) => SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 32,
                            ),
                            child: Text(
                              l10n(context).appName,
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                          ),
                        ),
                      ),
                      Form(
                        key: _form,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            EmailInput(
                              labelText: l10n(context).labelEmail,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 16),
                            PasswordInput(
                              labelText: l10n(context).labelPassword,
                              minLength: 8,
                              maxLength: 14,
                              textInputAction: TextInputAction.next,
                            ),
                            const SizedBox(height: 16),
                            PasswordInput(
                              labelText:
                                  l10n(context).labelPasswordConfirmation,
                              minLength: 8,
                              maxLength: 14,
                              textInputAction: TextInputAction.done,
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: FilledButton(
                                onPressed: _createAccount,
                                child: Text(
                                  l10n(context).actionCreateNewAccount,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton(
                                onPressed: _continueWithoutAccount,
                                child: Text(
                                  l10n(context).actionContinueWithoutAccount,
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelLarge!
                                      .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
