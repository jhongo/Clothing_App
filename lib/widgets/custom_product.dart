import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

class CustomProductCard extends StatelessWidget {
  
  final Product product;

  const CustomProductCard({super.key, required this.product});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    return Container(
      width: size.width,
      height: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        gradient:const LinearGradient(
          begin: Alignment(-1, -1),
          end: Alignment(1, 1),
          colors:[
            Color(0xFFE6E6E6),
            Color(0xFFFFFFFF),
            ] 
          ),
          boxShadow:const [
            BoxShadow(
              color: Color(0xFFCCCCCC),
              blurRadius: 20,
              offset: Offset(20, 20)
            ),
            BoxShadow(
              color: Color(0xFFFFFFFF),
              blurRadius: 20,
              offset: Offset(-20, -20)
            )
          ]
      ),
      child: _ContentProduct(product: product,),
    );
  }
}

class _ContentProduct extends StatelessWidget {
  final Product product;
  const _ContentProduct({
    Key? key, required this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity ,
          height: 150,
          color: Colors.indigo,
          child: Image.network(product.image),
        )
      ],
    );
  }
}