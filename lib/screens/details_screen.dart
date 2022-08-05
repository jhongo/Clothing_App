import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  final Product product;
   
  const DetailsScreen({Key? key, required this.product}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFFffffff),
      body: Stack(
        children: [
      
          Positioned(
            top: -30,
            child: Container(
              width: size.width,
              height: size.height,
              child: FadeInImage(
                placeholder: AssetImage('assets/imgs/loading.gif'), 
                image: NetworkImage(product.image),
                fit: BoxFit.contain,
                fadeInCurve: Curves.slowMiddle,
                )),
          ),
      
          Positioned(
            right: 0,
            bottom: 50,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)  ),
              child: BackdropFilter(
                filter:ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                child: AnimatedContainer(
                  duration: Duration(seconds: 2),
                  curve: Curves.easeIn,
                  width: 330,
                  height: 310,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(20), bottomLeft: Radius.circular(20)  ),
                    color: Color(0xFF3c6e71).withOpacity(0.5),
                  ),
                  child:Column(
                    children: [
                      const SizedBox(height: 10,),
                      Text(product.title, style:const TextStyle(
                        color: Color(0xFFedf6f9), fontWeight: FontWeight.bold, fontSize: 20),
                        maxLines: 2,
                        ),
                      Row(
                        children: [
                          const SizedBox(width: 10,),
                          const Icon(Icons.star_half_rounded),
                          Text('${product.rating.rate}', style: TextStyle(fontWeight: FontWeight.w600),),
                          Text('(${product.rating.count})', style: TextStyle(fontWeight: FontWeight.w600),),

                        ],),
                        const SizedBox(height: 10,),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        height: 150,
                        child: Text(product.description, style: TextStyle(color: Color(0xFFedf6f9)),),
                      ),
                      Spacer(),
                      Row(
                        children: [
                          const SizedBox(width: 20,),
                          Text('\$${product.price}', style: TextStyle(color: Color(0xFF343a40), fontSize: 25, fontWeight: FontWeight.w600 ),),
                
                          Spacer(),
                          Container(
                            width: 140,
                            height: 60,
                            decoration:const BoxDecoration(
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20)),
                              color: Colors.black,
                            ),
                            child: Center(child: Text('Agregar al carrito', style: TextStyle(color: Color(0xFFffffff)),)),
                          )
                        ],
                      )
                    ],
                  ) ,
                ),
              ),
            ),
          ),
      
          const Positioned(top: 50,child: _HeaderDeatils())
      
      
        ],
      )
    );
  }
}

class _HeaderDeatils extends StatelessWidget {
  const _HeaderDeatils({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 400,
      height: 50,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed:() {
              Navigator.pop(context);
            },
            ),
            Spacer(),
            Icon(Icons.shopping_bag_rounded, size: 30,color: Color(0xFF2f3e46), )
        ],
      ),
    );
  }
}