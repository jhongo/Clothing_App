import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/services/product_service.dart';
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
      padding: EdgeInsets.only(left: 10, right: 10,top: 170),
      width: size.width,
      height: size.height,
      color:Colors.white,
      child: CustomGridProduct()
    );
  }
}

class _HeaderProductScreen extends StatelessWidget {
  const _HeaderProductScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 15, top: 20, right: 15 ),
      width: size.width,
      height: size.height * 0.2,
      color: Colors.white,
      child: Column(
        children:const [
          _ContentProfileAndShop(),
        ],
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