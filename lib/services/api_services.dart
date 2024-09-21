import 'dart:developer';

import 'package:alisons_flutter_test/model/product_model.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get/get.dart';

class ApiServices extends GetxService {
  static const String baseUrl = 'https://swan.alisonsnewdemo.online/api';

  final storage = GetStorage();

  String get token => storage.read('token') ?? '';

  Future<bool> login(String emailPhone, String password) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/login?email_phone=$emailPhone&password=$password'),
      );
      log('login response $response');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        if (data['success'] == 1) {
          final token = data['customerdata']['token'];
          await storage.write('token', token);
          return true;
        }
      }
      return false;
    } catch (e) {
      print('Login error: $e');
      return false;
    }
  }

  Future<List<Product>> fetchProducts({int page = 1}) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/products/en?id=bDy&token=$token&page=$page'),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        log('${response.body}');
        final productList = (data['products']['return']['data'] as List)
            .map((item) => Product.fromJson(item))
            .toList();
        return productList;
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }
}
