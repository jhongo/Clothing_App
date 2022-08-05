import 'package:flutter/material.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size; 
    return Scaffold(
      body: Stack(
        children: [
          _ContentAllProduct(size: size),
          _HeaderProductScreen(size: size),
        ],
      )
    );
  }
}

class _ContentAllProduct extends StatelessWidget {
  const _ContentAllProduct({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, right: 10,top: 190),
      width: size.width,
      height: size.height,
      color:Colors.white,
      child: CustomGridProduct()
    );
  }
}

class _HeaderProductScreen extends StatelessWidget {
   _HeaderProductScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;
  List category = categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 30, right: 15 ),
      width: size.width,
      height: size.height * 0.2,
      child: Column(
        children: [
          _ContentProfileAndShop(),
          Container(
            width: size.width,
            height: size.height * 0.1,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:category.length,
              itemBuilder:(context, index) {
                final categori = category[index];
                return ItemCategories(
                  categorie: categori,
                );
              },
              ),
          )
          
        ],
      ),
    );
  }
}

class ItemCategories extends StatelessWidget {

  final CategoryModel categorie;

  const ItemCategories({Key? key, required this.categorie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(5),
        width: 65,
        height: 65,
        decoration: BoxDecoration(
        color: Color(0xFFf6fff8),
          shape: BoxShape.circle
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(categorie.icon)
          ],
        ),
      ),
    );
  }
}

class _ContentProfileAndShop extends StatelessWidget {
  const _ContentProfileAndShop({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children:const [
        _AvatarCircle(),
        SizedBox(width: 15,),
        Text('Hi Gabriela Landi', style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w700),),
        Spacer(),
        Icon(Icons.shopping_bag_outlined, size: 30,)
      ],
    );
  }
}

class _AvatarCircle extends StatelessWidget {
  const _AvatarCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(50)
        ),
        child:Image.network('https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        fit:BoxFit.fill ,
        )
      ),
    );
  }
}