import 'dart:async';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ServiceFactory {
  static final String serverLoginServices = "http://159.203.172.206:2020";

  final String routeAuthLogin = '/auth/login';

  final String serverPrimary = serverLoginServices;

  final String routeBasePrimary = '/api/v1';

  final Map<String, String> headers = {
    HttpHeaders.contentTypeHeader: 'application/json',
  };

  Future<String> handleMethod(String method, String url, {String send}) async {
    try {
      method = method.toUpperCase();
      print('$method: $url');
      if (method == 'POST' || method == 'PUT') print('Request Body: $send');

      Response response;
      switch (method) {
        case 'DELETE':
          response = await http.delete(url, headers: headers);
          break;
        case 'POST':
          response = await http.post(url, headers: headers, body: send);
          break;
        default:
          response = await http.get(url, headers: headers);
          break;
      }

      if (response.statusCode >= 200 && response.statusCode < 300) {
        print('Response: ${response.body}');
        return response.body;
      } else {
        throw Exception(
            'Failed to load ${response.request.method} code: ${response.statusCode}');
      }
    } catch (e) {
      print('$e');
      return null;
    }
  }
}
