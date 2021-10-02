import 'package:carousel_slider/carousel_slider.dart';
import 'package:delta_soft_task/models/productModel.dart';
import 'package:delta_soft_task/views/ProductDetails.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:delta_soft_task/controllers/productController.dart';

class Home extends StatelessWidget {
  final productController = Get.put(ProductController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Container(
            decoration:BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(5.0)
            ),

            child: Icon(Icons.widgets_outlined),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              width: 32,
              decoration:BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(5.0)
              ),

              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Container(
            decoration: BoxDecoration(
              color: Colors.deepOrange[100],
              borderRadius: BorderRadius.circular(10)
            ),
            width: 80, height: 30,
            
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.home), SizedBox(width: 2,),
                Text('Home',style:Theme.of(context).textTheme.bodyText1!.copyWith(color: Colors.deepOrange)),
              ],
            ),
          ),label: 'Home',),
          BottomNavigationBarItem(icon: Icon(Icons.favorite),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Home'),
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:15),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('Hello Salma',style: Theme.of(context).textTheme.headline6,),
                      Image.asset('assets/images/emoj.png',width: 20,height: 20,),
                    ],
                  ),
                  Text('Lets get someyhing ?',style:Theme.of(context).textTheme.caption),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                clipBehavior: Clip.antiAliasWithSaveLayer,

                child: CarouselSlider(
                    items: [
                      Image.asset('assets/images/banner3.png',),
                      Image.asset('assets/images/banner2.png',)
                    ],
                    options: CarouselOptions(
                      aspectRatio: 17/9,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      autoPlay: true,
                      reverse: false,
                      autoPlayInterval: Duration(seconds: 5),
                      autoPlayAnimationDuration: Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1.0,
                    )),
              ),
            ),

            Obx(()=>Container(
              child: GridView.count(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                mainAxisSpacing: 7,
                crossAxisSpacing: 7,
                childAspectRatio: 0.5 / 0.7,
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                children: List.generate(productController.products.length, (index) => shopItem(productController.products[index],context),),

              ),
            )),

          ],
        ),
      ),


    );
  }

  Widget shopItem(Product product, context){
    return InkWell(
     // onTap: ()=>Navigator.of(context).push(ProductDetails()),
      onTap: ()=> Get.to(ProductDetails(product)),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 4,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.vertical(top:Radius.circular(20))),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left :10.0),
                          child: Container(
                            child: Text('50% OFF',style: Theme.of(context).textTheme.caption!.copyWith(fontWeight: FontWeight.bold),),
                            width: 55 ,
                            height: 16,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                        Spacer(),
                        IconButton(icon: Icon(Icons.favorite,size: 18,color: Colors.grey,),onPressed: (){},)
                      ],
                    ),
                    Hero(
                        tag: 'product${product.id}',
                        child: Image.asset('assets/images/${product.productImage}',width: 120,height: 120,fit: BoxFit.contain,))
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.productName,style:Theme.of(context).textTheme.caption),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Text('${product.price}\$',style:Theme.of(context).textTheme.bodyText1),
                        SizedBox(width: 2,),
                        Text('${product.oldPrice}\$',style:Theme.of(context).textTheme.caption!.copyWith(decoration: TextDecoration.lineThrough)),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
