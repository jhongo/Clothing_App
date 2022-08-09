

import 'package:flutter/material.dart';

class CategoryModel {

   final String category;
   final IconData icon;

   CategoryModel(this.icon,this.category,);
  
}

List<CategoryModel> categories = [
  CategoryModel(Icons.computer, 'electronics'),
  CategoryModel(Icons.watch, 'jewelery'),
  CategoryModel(Icons.man, "men's clothing"),
  CategoryModel(Icons.woman, "women's clothing"),
];