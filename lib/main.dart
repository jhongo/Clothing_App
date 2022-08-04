import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/screens.dart';
import 'package:shop_app/services/navbar_service.dart';
import 'package:shop_app/services/product_service.dart';

void main() => runApp(

  MultiProvider(
  providers: [
    ChangeNotifierProvider(create:(BuildContext context) => ProductService(), lazy: false,),
    ChangeNotifierProvider(create:(BuildContext context) => NavBarService()),
  ],
  child:MyApp(),
  )
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shop App',
      home: HomeScreen(),
    );
  }
}