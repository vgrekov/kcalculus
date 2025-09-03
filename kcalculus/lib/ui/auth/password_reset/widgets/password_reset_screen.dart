import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/auth/password_reset/view_models/password_reset_ui_state.dart';
import 'package:kcalculus/ui/auth/password_reset/view_models/password_reset_view_model.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/email_input.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/utils/l10n.dart';

class PasswordResetScreen extends ConsumerStatefulWidget {
  const PasswordResetScreen({
    super.key,
    this.email,
  });

  final String? email;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _PasswordResetScreenState();
  }
}

class _PasswordResetScreenState extends ConsumerState<PasswordResetScreen>
    with StateMessenger {
  final _form = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  late final _assignments = <PasswordResetCommand, UiAssignment>{
    PasswordResetCommand.showUnknownErrorNotification:
        _showUnknownErrorNotification,
    PasswordResetCommand.showPasswordResetEmailNotification:
        _showPasswordResetEmailNotification,
    PasswordResetCommand.exit: _exitOnCommand,
  };

  late ProviderSubscription<PasswordResetUiState> _uiStateSubscription;

  @override
  void initState() {
    _uiStateSubscription = ref.listenManual(
      passwordResetViewModel(widget.email),
      (prev, next) {
        _loadUiState(next);
      },
    );

    final uiState = ref.read(passwordResetViewModel(widget.email));
    _loadUiState(uiState);

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();

    _uiStateSubscription.close();

    super.dispose();
  }

  void _loadUiState(PasswordResetUiState uiState) {
    _emailController.text = uiState.email;

    if (uiState.validationError != null) {
      _form.currentState!.validate();
    }
  }

  void _sendPasswordResetEmail() {
    _form.currentState!.save();

    final viewModel = ref.read(passwordResetViewModel(widget.email).notifier);

    viewModel.updateState(
      email: _emailController.text,
    );

    if (!_form.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }

    ProgressOverlay.wrap(
      context,
      viewModel.sendPasswordResetEmail(),
    );
  }

  void _exit() {
    Navigator.of(context).pop();
  }

  String? _validateEmail(String? value) {
    final uiState = ref.read(passwordResetViewModel(widget.email));

    return switch (uiState.validationError) {
      PasswordResetValidationError.invalidEmail =>
        l10n(context).validationErrorEmailInvalid,
      PasswordResetValidationError.userNotFound =>
        l10n(context).validationErrorUserNotFound,
      _ => null,
    };
  }

  void _showUnknownErrorNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(l10n(context).messageUnknownError);
    command.complete();
  }

  void _showPasswordResetEmailNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(
      l10n(context).messagePasswordResetEmailSent(
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
    _exit();

    command.complete();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(passwordResetViewModel(widget.email).notifier);

    return UiSubordinate(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Inattentive(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              l10n(context).screenPasswordReset,
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
                                controller: _emailController,
                                labelText: l10n(context).labelEmail,
                                textInputAction: TextInputAction.done,
                                showCounter: false,
                                validator: _validateEmail,
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                  onPressed: _sendPasswordResetEmail,
                                  child: Text(
                                    l10n(context).actionResetPassword,
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
                        Spacer(),
                        const SizedBox(height: 16),
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
