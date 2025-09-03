import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/auth/new_account/view_models/new_account_ui_state.dart';
import 'package:kcalculus/ui/auth/new_account/view_models/new_account_view_model.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/email_input.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/ui/common/widgets/password_input.dart';
import 'package:kcalculus/ui/common/widgets/text_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/utils/l10n.dart';

class NewAccountScreen extends ConsumerStatefulWidget {
  const NewAccountScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _NewAccountScreenState();
  }
}

class _NewAccountScreenState extends ConsumerState<NewAccountScreen>
    with StateMessenger {
  final _form = GlobalKey<FormState>();

  final _displayNameController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  final _passwordConfirmationController = TextEditingController();

  late FocusNode _emailFocusNode;

  late FocusNode _passwordFocusNode;

  late FocusNode _passwordConfirmationFocusNode;

  late final _assignments = <NewAccountCommand, UiAssignment>{
    NewAccountCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
    NewAccountCommand.showEmailVerificationNotification:
        _showEmailVerificationNotification,
    NewAccountCommand.exit: _exitOnCommand,
  };

  late ProviderSubscription<NewAccountUiState> _uiStateSubscription;

  @override
  void initState() {
    _emailFocusNode = FocusNode();
    _passwordFocusNode = FocusNode();
    _passwordConfirmationFocusNode = FocusNode();

    _uiStateSubscription = ref.listenManual(
      newAccountViewModel,
      (prev, next) {
        _loadUiState(next);
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmationController.dispose();

    _passwordConfirmationFocusNode.dispose();
    _passwordFocusNode.dispose();
    _emailFocusNode.dispose();

    _uiStateSubscription.close();

    super.dispose();
  }

  void _loadUiState(NewAccountUiState uiState) {
    _displayNameController.text = uiState.displayName;
    _emailController.text = uiState.email;
    _passwordController.text = uiState.password;
    _passwordConfirmationController.text = uiState.passwordConfirmation;

    if (uiState.validationError != null) {
      _form.currentState!.validate();
    }
  }

  void _createAccount() {
    _form.currentState!.save();

    final viewModel = ref.read(newAccountViewModel.notifier);

    viewModel.updateState(
      displayName: _displayNameController.text.trim(),
      email: _emailController.text,
      password: _passwordController.text,
      passwordConfirmation: _passwordConfirmationController.text,
    );

    if (!_form.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }

    ProgressOverlay.wrap(
      context,
      viewModel.createAccount(),
    );
  }

  String? _validateDisplayName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return l10n(context).validationErrorDisplayNameRequired;
    }

    return null;
  }

  String? _validateEmail(String? value) {
    final uiState = ref.read(newAccountViewModel);

    return switch (uiState.validationError) {
      NewAccountValidationError.invalidEmail =>
        l10n(context).validationErrorEmailInvalid,
      NewAccountValidationError.emailAlreadyInUse =>
        l10n(context).validationErrorEmailAlreadyInUse,
      _ => null,
    };
  }

  String? _validatePassword(String? value) {
    final uiState = ref.read(newAccountViewModel);

    return switch (uiState.validationError) {
      NewAccountValidationError.weakPassword =>
        l10n(context).validationErrorPasswordTooWeak,
      _ => null,
    };
  }

  String? _validatePasswordConfirmation(String? value) {
    _form.currentState!.save();

    if (value != _passwordController.text) {
      return l10n(context).validationErrorPasswordMismatch;
    }

    return null;
  }

  void _exit([String? email]) {
    Navigator.of(context).pop(email);
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  void _showEmailVerificationNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(
      l10n(context).messageEmailVerificationSent(
        command.payload as String,
      ),
      duration: Duration(seconds: 4),
    );
    command.complete();
  }

  void _exitOnCommand(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    _exit(command.payload as String?);

    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(newAccountViewModel.notifier);

    return UiSubordinate(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Inattentive(
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
                              TextInput(
                                controller: _displayNameController,
                                labelText:
                                    '${l10n(context).labelDisplayName} *',
                                maxLength: 50,
                                maxLines: 1,
                                textCapitalization: TextCapitalization.words,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (value) {
                                  _emailFocusNode.requestFocus();
                                },
                                validator: _validateDisplayName,
                              ),
                              const SizedBox(height: 16),
                              EmailInput(
                                controller: _emailController,
                                focusNode: _emailFocusNode,
                                labelText: '${l10n(context).labelEmail} *',
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (value) {
                                  _passwordFocusNode.requestFocus();
                                },
                                validator: _validateEmail,
                              ),
                              const SizedBox(height: 16),
                              PasswordInput(
                                controller: _passwordController,
                                focusNode: _passwordFocusNode,
                                labelText: '${l10n(context).labelPassword} *',
                                minLength: 6,
                                maxLength: 20,
                                textInputAction: TextInputAction.next,
                                onFieldSubmitted: (value) {
                                  _passwordConfirmationFocusNode.requestFocus();
                                },
                                validator: _validatePassword,
                              ),
                              const SizedBox(height: 16),
                              PasswordInput(
                                controller: _passwordConfirmationController,
                                focusNode: _passwordConfirmationFocusNode,
                                labelText:
                                    '${l10n(context).labelPasswordConfirmation} *',
                                minLength: 6,
                                maxLength: 20,
                                textInputAction: TextInputAction.done,
                                validator: _validatePasswordConfirmation,
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
                        Expanded(
                          child: const SizedBox.expand(),
                        ),
                        const SizedBox(height: 32),
                      ],
                    ),
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
