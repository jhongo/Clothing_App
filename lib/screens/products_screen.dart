import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/models/category_model.dart';
import 'package:shop_app/screens/screens.dart';
import 'package:shop_app/services/product_service.dart';
import 'package:shop_app/services/tab_service.dart';
import 'package:shop_app/widgets/widgets.dart';

class ProductScreen extends StatelessWidget {
   
  const ProductScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size; 
    final page = Provider.of<TabService>(context);
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller:page.controllerPage,
            physics:const NeverScrollableScrollPhysics(),
            children:[
            _ContentAllProduct(size: size),
             CategoryScreen()
            ]
          ),
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

class _HeaderProductScreen extends StatefulWidget {
  const _HeaderProductScreen({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<_HeaderProductScreen> createState() => _HeaderProductScreenState();
}

class _HeaderProductScreenState extends State<_HeaderProductScreen> with TickerProviderStateMixin {

  List category = categories;

  late TabController controller;

  @override
  void initState() {
    
    controller= TabController(length: 2, vsync: this);
    super.initState();
  }
  
  
  @override
  Widget build(BuildContext context) {
    final tab = Provider.of<TabService>(context);
    final size = MediaQuery.of(context).size;
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      padding: EdgeInsets.only(left: 15, top: 30, right: 15 ),
      width: widget.size.width,
      height: (!tab.isActive) ? widget.size.height * 0.16 : widget.size.height * 0.23,
      child: Column(
        children: [
          const _ContentProfileAndShop(),
          TabBar(
            onTap: (value) => {
              tab.index = value,
              (tab.index == 1) ? tab.isActive = true : tab.isActive = false
            },
            controller: controller,
            labelColor: Color(0xFF10002b),
            indicatorColor: Color(0xFFffffff),
            unselectedLabelColor: Color(0xFF86bbd8),
            
            tabs:const [
              Tab(text: 'Todos',),
              Tab(text: 'Categorias'),
              ]
            ),
            SizedBox(height: 5,),
            AnimatedContainer(
              alignment:Alignment.center,
              duration:const Duration( seconds: 2 ),
              width: (!tab.isActive) ? size.width * 0 : size.width * 0.7 ,
              height: (!tab.isActive) ? 0 : 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: category.length,
                itemBuilder:(context, index) {
                  final nameCategorie = category[index];
                  return ItemCategories(categorie:nameCategorie );
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
    final category = Provider.of<ProductService>(context);
    final tab = Provider.of<TabService>(context);
    return GestureDetector(
      onTap: () {
        category.itemCategory = categorie.category;
        print(category.itemCategory);
      },
      child: AnimatedContainer(
        duration: Duration(seconds: 2),
        margin: EdgeInsets.all(1),
        width: (!tab.isActive) ? 0 : 70,
        height: (!tab.isActive) ? 0 : 70,
        decoration: BoxDecoration(
        color: (category.itemCategory == categorie.category) ? Color(0xFF55828b) : Color(0xFFf2e9e4),
          shape: BoxShape.circle
        ),
        child: Icon(categorie.icon, color: (category.itemCategory == categorie.category) ? Color(0xFFffffff) : Color(0xFF364958) , size:(!tab.isActive) ? 0 : 22,),
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