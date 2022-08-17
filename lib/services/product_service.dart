import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/models/product_model.dart';

class ProductService extends ChangeNotifier {

  String _itemCategory = 'electronics';
  final _apiShop = 'fakestoreapi.com';
  List<Product> products = [];

  Map<String,List<Product>> categoryProduct = {};
  


    String get itemCategory => _itemCategory;

    set itemCategory(String name){
      _itemCategory = name;
      getProductByCategory(name);
      notifyListeners();
     }
     
     List<Product>? get ProductByCategory => categoryProduct[this.itemCategory];



  ProductService(){
    getAllProducts();
    for (var category in categories) {
      categoryProduct[category.category] = [];
    }

    getProductByCategory(_itemCategory);
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



  getProductByCategory( String categorie) async {

    if (categoryProduct[categorie]!.length > 0 ) {
      return categoryProduct[categorie];
    }

    final url = Uri.https(_apiShop,"/products/category/$categorie");
    final response = await http.get(url);
    final productResponse = productFromJson(response.body);
    categoryProduct[categorie]!.addAll(productResponse.toList());
    print(productResponse);
    notifyListeners();
  }

  
}

