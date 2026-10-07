import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kcalculus/domain/_common/models/subscription_state.dart';

part 'paywall_ui_state.freezed.dart';

@freezed
sealed class PaywallUiState with _$PaywallUiState {
  const factory PaywallUiState({
    required SubscriptionState subscriptionState,
    @Default(false) bool isProcessing,
  }) = _PaywallUiState;
}
