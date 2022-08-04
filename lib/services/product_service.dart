import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:shop_app/models/product_model.dart';

class ProductService extends ChangeNotifier {

  final _apiShop = 'fakestoreapi.com';
  List<Product> products = [];

  ProductService(){
    getAllProducts();
  }

  getAllProducts() async {

    final url = Uri.https(_apiShop,'/products');
    final response = await http.get(url);
    
    // print('Response status: ${response.statusCode}');
    // print('Response body: ${response.body}');

    final newResponse = productFromJson(response.body);
    products.addAll(newResponse); 
    notifyListeners();

  }

  
}

