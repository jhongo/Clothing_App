import 'package:flutter/material.dart';
import 'package:shop_app/models/product_model.dart';

class CustomProductCard extends StatelessWidget {
  
  final Product product;

  const CustomProductCard({super.key, required this.product,});
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; 
    return Container(
      padding: EdgeInsets.only(top: 20),
      width: size.width,
      height: 300,
      decoration: BoxDecoration(
        color: Color(0xFFffffff),
        borderRadius: BorderRadius.circular(20),
        boxShadow:const [
          BoxShadow(
            color: Color(0xFF3c6e71),
            blurRadius: 5.0,
            offset: Offset(0.5, 0.5)
    
          ),
          BoxShadow(
            color: Color(0xFFffffff),
            blurRadius: 5.0,
            offset: Offset(-1.5, -1.5)
    
          ),
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
      alignment: Alignment.center,
      children: [
        Positioned(
          top: 0,
          child: _ImageProductCard(product: product),
        ),
        Positioned(
          bottom: 25,
          child: _DataContentProduct(product: product),
        ),
        Positioned( top: 2, right: 10, child: ContentStar()),


      ],
    );
  }
}


class ContentStar extends StatefulWidget {
  const ContentStar({Key? key}) : super(key: key);

  @override
  State<ContentStar> createState() => _ContentStarState();
}

class _ContentStarState extends State<ContentStar> {
  
  bool isPressed2 = true;
  bool isHighlighted = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle
      ),
      child: InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onHighlightChanged: (value) {
                setState(() {
                  isHighlighted = !isHighlighted;
                });
              },
              onTap: () {
                setState(() {
                  isPressed2 = !isPressed2;
                });
              },
              child: AnimatedContainer(
                margin: EdgeInsets.all(isHighlighted ? 0 : 2.5),
                height: isHighlighted ? 50 : 45,
                width: isHighlighted ? 50 : 45,
                curve: Curves.fastLinearToSlowEaseIn,
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.2),
                      blurRadius: 20,
                      offset: Offset(5, 10),
                    ),
                  ],
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: isPressed2
                    ? Icon(
                  Icons.favorite_border,
                  color: Colors.black.withOpacity(0.6),
                )
                    : Icon(
                  Icons.favorite,
                  color: Colors.pink.withOpacity(1.0),
                ),
              ),
            ),
    );
  }
}

class _DataContentProduct extends StatelessWidget {
  const _DataContentProduct({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 60,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(product.title,style:const TextStyle(
            color: Color(0xFF0a0908),
            fontWeight: FontWeight.w600,
            fontSize: 13
            ),
          maxLines:1,
          overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 10,),
          Text('\$${product.price}',
          style:const TextStyle(
            color: Color(0xFF274c77),
            fontWeight: FontWeight.w800,
            fontSize: 18
          ),
          )
        ],
      ),
    );
  }
}

class _ImageProductCard extends StatelessWidget {
  const _ImageProductCard({
    Key? key,
    required this.product,
  }) : super(key: key);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      width: 150,
      height: 180,
      color: Color(0xFFffffff),
      child: FadeInImage(
        placeholder:const AssetImage('assets/imgs/loading.gif'), 
        image: NetworkImage(product.image)
        ),
    );
  }
}