import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:prova_flutter/src/errors/httprepositoruerrors.dart';

import '../../errors/validationerrorshttp.dart';
import 'adapterhttp.dart';

class HttpRepository extends ChangeNotifier implements AdapterHttp {
  final String baseUrl = "https://my-json-server.typicode.com";

  @override
  Future<void> postValidation(Map<String, dynamic> data) async {
    final String url = '$baseUrl/Douglasbm040/mock-api/db';

    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );
      if (response.statusCode == 200) {
        print('Resposta do servidor: ${response.body}');
      } else {
        HttpRepositoryErrors(statusCode: response.statusCode, message: response.body);

      }
    } catch (error) {
      throw ValidationErrorHttp(message: error.toString());
    }
  }
}
