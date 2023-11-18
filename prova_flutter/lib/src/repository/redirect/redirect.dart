import 'package:flutter/widgets.dart';
import 'package:prova_flutter/src/repository/redirect/adapterredirect.dart';
import 'package:url_launcher/url_launcher.dart';

class Redirect extends ChangeNotifier implements AdapterRedirect  {
  @override
  Future<void> redirectWEB(String url) async {
    if (!await launchUrl(Uri.parse(url))) {
      throw Exception('Could not launch $url');
    }
  }
}
