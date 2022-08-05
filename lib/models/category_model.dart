

import 'package:flutter/material.dart';

class CategoryModel {

   final String category;
   final IconData icon;

   CategoryModel(this.icon,this.category,);
  
}

List<CategoryModel> categories = [
  CategoryModel(Icons.table_chart_outlined, 'all'),
  CategoryModel(Icons.headset_mic_rounded, 'electronics'),
  CategoryModel(Icons.trip_origin_sharp, 'jewelery'),
  CategoryModel(Icons.person, "men's clothing"),
  CategoryModel(Icons.woman_rounded, "women's clothing"),
];