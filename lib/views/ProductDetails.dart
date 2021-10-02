import 'package:delta_soft_task/controllers/productController.dart';
import 'package:delta_soft_task/models/cartModel.dart';
import 'package:delta_soft_task/models/productModel.dart';
import 'package:delta_soft_task/views/AddToCart.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  final ProductController c = Get.find();
  Product product ;
  ProductDetails(this.product);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.grey[100],),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(180)),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Hero(
                      tag:'product${product.id}',
                      child: Image.asset('assets/images/${product.productImage}',fit: BoxFit.contain,width: 250,height: 250,)),
                  SizedBox(height: 15,),
                  SmoothPageIndicator(count: 2, controller: PageController(),effect: ExpandingDotsEffect(
                      dotColor: Colors.grey,
                      activeDotColor: Colors.deepOrange,
                      dotHeight: 10.0,
                      dotWidth: 10.0,
                      expansionFactor: 1.1,
                      spacing: 5.0),),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(top :18.0,left: 20,right: 20,bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${product.productName}',style:Theme.of(context).textTheme.headline6),
                    const SizedBox(height: 5,),
                    Row(children: [
                      RatingBarIndicator(
                          itemBuilder: (context,_)=>Icon(Icons.star,color: Colors.amber,),
                          itemCount: 5,
                          itemSize: 20,
                          rating: 5,
                      ),
                      Text('(2500 reviews)',style:Theme.of(context).textTheme.caption)
                    ],),
                    const SizedBox(height: 10,),
                    Row(children: [
                      Text('${product.price}\$',style:Theme.of(context).textTheme.bodyText1),
                      SizedBox(width: 2,),
                      Text('${product.oldPrice}\$',style:Theme.of(context).textTheme.caption!.copyWith(decoration: TextDecoration.lineThrough)),
                      Spacer(),
                      Text('Available in Stock')
                    ],),
                    const SizedBox(height: 15,),
                    Text('About',style:Theme.of(context).textTheme.bodyText1),
                    const SizedBox(height: 5,),
                    Text('${product.productDescription}',style:Theme.of(context).textTheme.caption),
                    const SizedBox(height: 10,),
                    Container(
                      height: 30,
                      child: ListView.separated(
                          physics:BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index)=>
                              InkWell(
                                onTap: (){
                                  c.changePagerColor(index);
                                },
                                child: Obx(()=>Container(
                                decoration: BoxDecoration(
                                color: c.currentIndex.value == index ? Colors.deepOrange[100] : Colors.white,
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5),
                          ),
                               width: 30,child: Center(child: Text('$index')),)),
                              ),
                          separatorBuilder: (context,index)=>SizedBox(width: 10.0,),
                          itemCount: 10,),
                    ),
                    Spacer(),
                    Container(
                      width: double.infinity,
                      height: 40,
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(10)),
                      child: MaterialButton(
                        onPressed: (){
                          c.addProductToCart(CartItem(product: product, cartItemQuantity: 1.obs));
                          Get.to(AddToCart());
                        },
                        clipBehavior: Clip.antiAliasWithSaveLayer,
                        child: Text('ADD TO CARD'),
                        textColor: Colors.white,

                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }


}
