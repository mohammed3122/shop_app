import 'dart:convert';
import 'package:http/http.dart' as http;

class Api {
  Future<List<dynamic>> get({required String url}) async {
    http.Response api = await http.get(Uri.parse(url));
    if (api.statusCode == 200) {
      return jsonDecode(api.body);
    }
    throw Exception(
      'there is an err in StatueCode , now Statue code is ${api.statusCode} and body is ${api.body}',
    );
  }

  Future<Map<String, dynamic>> add({
    required String url,
    required String productName,
    required dynamic productPrice,
    required String? productDesc,
    required String productCategory,
  }) async {
    http.Response api = await http.post(
      Uri.parse(url),
      body: {
        'title': productName,
        'price': productPrice,
        'description': productDesc,
        'category': productCategory,
      },
    );
    if (api.statusCode == 201) {
      return jsonDecode(api.body);
    }
    throw Exception(
      'there is an err in StatueCode , now Statue code is ${api.statusCode} and body is ${api.body}',
    );
  }

  Future<Map<String, dynamic>> update({
    required String url,
    required dynamic productName,
    required dynamic productPrice,
    required dynamic productDesc,
    required dynamic productCategory,
  }) async {
    http.Response api = await http.put(
      Uri.parse(url),
      body: {
        'title': productName,
        'price': productPrice,
        'description': productDesc,
        'category': productCategory,
      },
      headers: {'Content-Type': 'application/x-www-form-urlencoded'},
    );
    if (api.statusCode == 200) {
      return jsonDecode(api.body);
    }
    throw Exception(
      'there is an err in StatueCode , now Statue code is ${api.statusCode} and body is ${api.body}',
    );
  }
}
