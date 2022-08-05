import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/product_model.dart';
import 'package:shop_app/screens/screens.dart';
import 'package:shop_app/widgets/widgets.dart';
import '../services/product_service.dart';

class CustomGridProduct extends StatelessWidget {

  _onDetails(Product products,BuildContext context)async {
    await Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder:(context, animation, secondaryAnimation) {
          return FadeTransition(
            opacity: animation,
            child: DetailsScreen(product: products,),
            );
        }, )
    );
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductService>(context);
    return GridView.builder(
      clipBehavior: Clip.none,
      padding:const EdgeInsets.symmetric(horizontal: 10),
      physics:const BouncingScrollPhysics(),
      itemCount: product.products.length,
      gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 25,
          crossAxisSpacing: 25,
          mainAxisExtent: 300),
      itemBuilder: (BuildContext context, int index) {
        final dataProduct = product.products[index];
        return GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              PageRouteBuilder(
                pageBuilder:(context, animation, secondaryAnimation) {
                  return FadeTransition(
                    opacity: animation,
                    child: DetailsScreen(product: dataProduct), 
                    
                    );
                },
                )
            );
          },
          child: CustomProductCard(
            product: dataProduct,
          ),
        );
      },
    );
  }
}
