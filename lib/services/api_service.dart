import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import '../models/product.dart';
import '../models/cart.dart';

class ApiService {
  static const String _baseUrl = 'https://fakestoreapi.com';

  Future<List<Product>> fetchProducts() async {
    // TODO: Fetch products from $_baseUrl/products
    //  Parse JSON response into List<Product>
    //  Handle errors (e.g., non-200 status codes)
    // https://fakestoreapi.com/docs for reference
    try {
      var result = await http.get(Uri.parse("$_baseUrl/products"));
      if (result.statusCode == 200) {
        return (json.decode(result.body) as List<dynamic>)
            .map((product) => Product.fromMap(product))
            .toList();
      } else {
        throw Exception(
            "Error Fetching Products Status Code : ${result.statusCode}");
      }
    } on SocketException {
      throw Exception("Connection Lost");
    } on TimeoutException {
      throw Exception("Connection Time out");
    } catch (e) {
      throw Exception("Unknown Error ${e.toString()}");
    }

    // throw UnimplementedError();
  }
}
