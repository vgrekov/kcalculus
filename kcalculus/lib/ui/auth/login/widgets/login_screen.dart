import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kcalculus/ui/auth/login/view_models/login_ui_state.dart';
import 'package:kcalculus/ui/auth/login/view_models/login_view_model.dart';
import 'package:kcalculus/ui/auth/new_account/widgets/new_account_screen.dart';
import 'package:kcalculus/ui/auth/password_reset/widgets/password_reset_screen.dart';
import 'package:kcalculus/ui/common/utils/messaging/state_messenger.dart';
import 'package:kcalculus/ui/common/utils/progress_overlay.dart';
import 'package:kcalculus/ui/common/view_models/ui_command.dart';
import 'package:kcalculus/ui/common/widgets/email_input.dart';
import 'package:kcalculus/ui/common/widgets/inattentive.dart';
import 'package:kcalculus/ui/common/widgets/password_input.dart';
import 'package:kcalculus/ui/common/widgets/ui_subordinate.dart';
import 'package:kcalculus/ui/meals/list/widgets/meal_list_screen.dart';
import 'package:kcalculus/utils/l10n.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return _LoginScreenState();
  }
}

class _LoginScreenState extends ConsumerState<LoginScreen> with StateMessenger {
  final _form = GlobalKey<FormState>();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  late final _assignments = <LoginCommand, UiAssignment>{
    LoginCommand.showUnknownErrorNotification: _showUnknownErrorNotification,
    LoginCommand.showUnverifiedEmailNotification:
        _showUnverifiedEmailNotification,
    LoginCommand.showTooManyRequestsNotification:
        _showTooManyRequestsNotification,
    LoginCommand.exit: _exitOnCommand,
  };

  late ProviderSubscription<LoginUiState> _uiStateSubscription;

  @override
  void initState() {
    _uiStateSubscription = ref.listenManual(
      loginViewModel,
      (prev, next) {
        _loadUiState(next);
      },
    );

    super.initState();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();

    _uiStateSubscription.close();

    super.dispose();
  }

  void _loadUiState(LoginUiState uiState) {
    _emailController.text = uiState.email;
    _passwordController.text = uiState.password;

    if (uiState.validationError != null) {
      _form.currentState!.validate();
    }
  }

  void _login() {
    _form.currentState!.save();

    final viewModel = ref.read(loginViewModel.notifier);

    viewModel.updateState(
      email: _emailController.text,
      password: _passwordController.text,
    );

    if (!_form.currentState!.validate()) {
      FocusManager.instance.primaryFocus?.unfocus();
      return;
    }

    ProgressOverlay.wrap(
      context,
      viewModel.login(),
    );
  }

  void _resendVerificationEmail() {
    ref.read(loginViewModel.notifier).resendVerificationEmail();
  }

  void _createNewAccount() async {
    final email = await Navigator.of(context).push<String>(
      MaterialPageRoute(
        builder: (context) => const NewAccountScreen(),
      ),
    );

    if (email != null) {
      _form.currentState!.reset();

      ref.read(loginViewModel.notifier).updateState(
            email: email,
            password: '',
          );
    }
  }

  void _resetPassword() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => PasswordResetScreen(
          email: _emailController.text,
        ),
      ),
    );
  }

  void _continueWithoutAccount() {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MealListScreen(),
      ),
    );
  }

  void _exit() {
    // Navigator.of(context).pop();
    _continueWithoutAccount();
  }

  String? _validateEmail(String? value) {
    final uiState = ref.read(loginViewModel);

    return switch (uiState.validationError) {
      LoginValidationError.invalidEmail =>
        l10n(context).validationErrorEmailInvalid,
      LoginValidationError.userNotFound =>
        l10n(context).validationErrorUserNotFound,
      LoginValidationError.userDisabled =>
        l10n(context).validationErrorUserDisabled,
      LoginValidationError.unverifiedEmail =>
        l10n(context).validationErrorEmailUnverified,
      _ => null,
    };
  }

  String? _validatePassword(String? value) {
    final uiState = ref.read(loginViewModel);

    return switch (uiState.validationError) {
      LoginValidationError.invalidCredentials =>
        l10n(context).validationErrorCredentialsInvalid,
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

  void _showUnverifiedEmailNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final uiState = ref.read(loginViewModel);

    final canSendAgain =
        !(uiState.emailVerificationCooldownEnd?.isAfter(DateTime.now()) ??
            false);

    showNotification(
      l10n(context).messageCheckInboxForInstructions,
      action: canSendAgain
          ? SnackBarAction(
              label: l10n(context).actionSendAgain,
              onPressed: _resendVerificationEmail,
            )
          : null,
      duration: canSendAgain ? Duration(seconds: 5) : null,
    );
    command.complete();
  }

  void _showTooManyRequestsNotification(
    UiCommand command, {
    required BuildContext context,
    required WidgetRef ref,
  }) {
    showNotification(
      l10n(context).messageTooManyRequestsError,
    );
    command.complete();
  }

  void _exitOnCommand(
    UiCommand? command, {
    required BuildContext context,
    required WidgetRef ref,
  }) async {
    _exit();

    command?.complete();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = ref.read(loginViewModel.notifier);

    return UiSubordinate(
      commandProvider: viewModel.commandProvider,
      assignments: _assignments,
      child: Inattentive(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              l10n(context).screenLogin,
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
                                textInputAction: TextInputAction.next,
                                showCounter: false,
                                validator: _validateEmail,
                              ),
                              const SizedBox(height: 16),
                              PasswordInput(
                                controller: _passwordController,
                                labelText: l10n(context).labelPassword,
                                hintText: '',
                                minLength: 1,
                                maxLength: 20,
                                textInputAction: TextInputAction.done,
                                usePasswordValidator: false,
                                showCounter: false,
                                validator: _validatePassword,
                              ),
                              const SizedBox(height: 12),
                              SizedBox(
                                width: double.infinity,
                                child: FilledButton(
                                  onPressed: _login,
                                  child: Text(
                                    l10n(context).actionLogin,
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
                              const SizedBox(height: 8),
                              SizedBox(
                                width: double.infinity,
                                child: TextButton(
                                  onPressed: _resetPassword,
                                  child: Text(
                                    l10n(context).actionForgotPassword,
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
                        const SizedBox(height: 32),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child: OutlinedButton(
                                  onPressed: _createNewAccount,
                                  child: Text(
                                    l10n(context).actionCreateNewAccount,
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
                              const SizedBox(height: 8),
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
      ),
    );
  }
}
