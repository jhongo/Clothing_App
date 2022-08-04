

import 'package:flutter/material.dart';

class CategoryModel {

   final String category;
   final IconData icon;

   CategoryModel(this.icon,this.category,);
  
}

List<CategoryModel> categories = [
  CategoryModel(Icons.camera_alt_rounded, 'electronics'),
  CategoryModel(Icons.camera_alt_rounded, 'jewelery'),
  CategoryModel(Icons.camera_alt_rounded, "men's clothing"),
  CategoryModel(Icons.camera_alt_rounded, "women's clothing"),
];