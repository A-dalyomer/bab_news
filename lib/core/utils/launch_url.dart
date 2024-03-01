import 'package:url_launcher/url_launcher.dart';

Future<bool> launchExternalUrl(String uri) async {
  return await launchUrl(Uri.parse(uri));
}
