import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/services/product_service.dart';
import 'package:shop_app/widgets/custom_product.dart';

class CategoryScreen extends StatelessWidget {
   
  final categorie = categories;
  //  CategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final product = Provider.of<ProductService>(context);
    return Scaffold(

      backgroundColor:const Color(0xFFffffff),
      body: SingleChildScrollView(
        child:Column(
          children: [
              SizedBox(
              height: 180,
            ),
            Container(
              width: double.infinity,
              height: 100,
              color: Color(0xFFf4a261),
            ),
            // CustomProductCard(product:product.ProductByCategory!)
          ],
        ) ,
      )
    );
  }
}