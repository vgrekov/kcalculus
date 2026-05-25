import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

class EmailService extends Notifier<void> {
  @override
  void build() {}

  Future<bool> composeEmail({
    required String to,
    String? subject,
    String? body,
  }) => launchUrl(
    Uri(
      scheme: 'mailto',
      path: to,
      query: _encodeQueryParameters(
        {
          'subject': ?subject,
          'body': ?body,
        },
      ),
    ),
  );

  String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map(
          (MapEntry<String, String> e) =>
              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
        )
        .join('&');
  }
}

final emailServiceProvider = NotifierProvider<EmailService, void>(
  EmailService.new,
);
