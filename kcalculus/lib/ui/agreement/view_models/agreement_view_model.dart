import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:kcalculus/data/storage/storage.dart';
import 'package:kcalculus/ui/agreement/view_models/agreement_colors.dart';

const kAgreementVersion = 1;

class AgreementViewModel
    extends AutoDisposeFamilyNotifier<Future<String>, AgreementColors> {
  static final _kAgreementVersionFormatter = NumberFormat('000');

  static const _kAgreementAssetPattern = 'assets/agreements/{version}.html';

  static const _kBackgroundColorTemplate = "'{background-color}'";

  static const _kTextColorTemplate = "'{text-color}'";

  @override
  Future<String> build(AgreementColors arg) async {
    String asset = _kAgreementAssetPattern.replaceAll(
      '{version}',
      _kAgreementVersionFormatter.format(kAgreementVersion),
    );

    var html = await rootBundle.loadString(asset);

    return html
        .replaceAll(
          _kBackgroundColorTemplate,
          _colorToRgba(arg.backgroundColor),
        )
        .replaceAll(
          _kTextColorTemplate,
          _colorToRgba(arg.textColor),
        );
  }

  void sign() async {
    final settings = await ref.read(appSettingsRepositoryProvider.future);
    ref.read(appSettingsRepositoryProvider.notifier).saveSettings(
          settings.copyWith(signedAgreementVersion: kAgreementVersion),
        );
  }

  String _colorToRgba(Color color) {
    int r = _denormalizeChannel(color.r);
    int g = _denormalizeChannel(color.g);
    int b = _denormalizeChannel(color.b);
    double a = color.a;

    return 'rgba($r, $g, $b, $a)';
  }

  int _denormalizeChannel(double channel) {
    return (channel * 255.0).round() & 0xff;
  }
}

final agreementViewModel = NotifierProvider.autoDispose
    .family<AgreementViewModel, Future<String>, AgreementColors>(
  AgreementViewModel.new,
);
