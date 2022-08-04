import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/widgets/widgets.dart';
import '../services/product_service.dart';

class CustomGridProduct extends StatelessWidget {
  const CustomGridProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductService>(context);
    return GridView.builder(
      physics:const BouncingScrollPhysics(),
      itemCount: product.products.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          mainAxisExtent: 300),
      itemBuilder: (BuildContext context, int index) {
        final dataProduct = product.products[index];
        return CustomProductCard(
          product: dataProduct,
        ) ;
      },
    );
  }
}
