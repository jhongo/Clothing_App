import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/screens.dart';
import 'package:shop_app/services/navbar_service.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

class HomeScreen extends StatelessWidget {
   
  const HomeScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final opcSelect = Provider.of<NavBarService>(context);
    return Scaffold(
      body: SafeArea(
        child: PageView(
          controller: opcSelect.controller,
          physics:const NeverScrollableScrollPhysics(),
          children:const [
            ProductScreen(),
            CarScreen(),
            SettingsScreen(),
            

          ],
        ), 
      ),
      bottomNavigationBar: WaterDropNavBar(
        backgroundColor:const Color(0xFFe8eddf),
        inactiveIconColor:const Color(0xFF333533),
        waterDropColor:const Color(0xFF242423),
        barItems: [
          BarItem(filledIcon: Icons.home, outlinedIcon: Icons.home_outlined),
          BarItem(filledIcon: Icons.shopping_cart, outlinedIcon: Icons.shopping_cart_outlined),
          BarItem(filledIcon: Icons.person, outlinedIcon: Icons.person_outline_outlined),
        ], 
        selectedIndex: opcSelect.opcSelectedGet, 
        onItemSelected: (int index){
          opcSelect.opcSelectedSet = index;
        }) ,
    );
  }
}




