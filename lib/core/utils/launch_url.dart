import 'package:url_launcher/url_launcher.dart';

/// A service for launching URLs
Future<bool> launchExternalUrl(String uri) async {
  return await launchUrl(Uri.parse(uri));
}
