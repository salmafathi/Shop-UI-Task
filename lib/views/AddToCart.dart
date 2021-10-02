import 'package:delta_soft_task/controllers/productController.dart';
import 'package:delta_soft_task/models/cartModel.dart';
import 'package:delta_soft_task/models/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddToCart extends StatelessWidget {
  final ProductController c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My cart',style: Theme.of(context).textTheme.headline6,),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(()=>ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context,index)=> myCartItemBuilder(context,index),
                separatorBuilder: (context,index)=>SizedBox(height: 10,),
                itemCount: c.cartProducts.length)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:30.0,vertical: 20),
            child: Row(
              children: [
                Text('Total'),
                Spacer(),
                Obx(()=>Text('${c.totalPrice} \$',style:Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w900,color: Colors.deepOrange,fontSize: 18),))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0,left: 20,right: 20),
            child: Container(
              width: double.infinity,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(10)),
              child: MaterialButton(
                onPressed: (){
                },
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: Text('Buy Now'),
                textColor: Colors.white,
              ),
            ),
          )
        ],
      )
    );
  }

  Widget myCartItemBuilder (context,index){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Container(
        height: 100, width: double.infinity, padding: EdgeInsets.only(left: 10,right:10,top: 10,bottom: 10),
        decoration: BoxDecoration(color: Colors.grey[100],borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              height: 70,width: 60,padding: EdgeInsets.all(5), decoration: BoxDecoration(color: Colors.deepOrange[50],borderRadius: BorderRadius.circular(10)),
                child: Image.asset('assets/images/${c.cartProducts[index].product.productImage}',fit: BoxFit.cover,),),
            SizedBox(width: 5,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 8.0,left: 5,),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${c.cartProducts[index].product.productName}',style: Theme.of(context).textTheme.bodyText1,),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5.0),
                      child: Text('size: 5',style: Theme.of(context).textTheme.caption,),
                    ),
                    Row(
                      children: [
                        Text('${c.cartProducts[index].product.price}\$',style: Theme.of(context).textTheme.bodyText1!.copyWith(fontWeight: FontWeight.w900),),
                        Spacer(),
                        Container(
                          height: 25,decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color: Colors.white),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              IconButton(icon: Icon(Icons.add), onPressed: (){c.addQuantity(c.cartProducts[index]);},padding: EdgeInsets.zero,),
                              Obx(()=> Text('${c.cartProducts[index].cartItemQuantity}')),
                              IconButton(icon: Icon(Icons.remove,), onPressed: (){c.subtractQuantity(c.cartProducts[index]);},padding:EdgeInsets.zero,),

                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
