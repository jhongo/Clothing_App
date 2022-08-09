import 'package:flutter/material.dart';
import 'package:shop_app/models/category_model.dart';

class CategoryScreen extends StatelessWidget {
   
  final categorie = categories;
  //  CategoryScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(

      backgroundColor:const Color(0xFFffffff),
      body: SingleChildScrollView(
        child:Column(
          children:const [
              SizedBox(
              height: 180,
            ),
          ],
        ) ,
      )
    );
  }
}