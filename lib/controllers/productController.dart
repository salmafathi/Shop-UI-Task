import 'package:delta_soft_task/models/cartModel.dart';
import 'package:delta_soft_task/models/productModel.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  var products = <Product>[].obs;
  var currentIndex = 0.obs ;
  var cartProducts = <CartItem>[].obs ;
  double get totalPrice => cartProducts.fold(0, (sum, item) => sum + (int.parse(item.product.price )* (item.cartItemQuantity.value)));


  @override
  void onInit() {
    super.onInit();
    fetchProducts();

  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var productResult = [
      Product(
          id: 1,
          price: '750',
          oldPrice:'1500',
          productDescription: 'Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2',
          productImage: 'watch.png',
          productName: 'Apple watch - M2'),
      Product(
          id: 2,
          price: '500',
          oldPrice:'1000',
          productDescription: 'Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2',
          productImage: 'prdduct2.png',
          productName: 'Apple watch - M1'),
      Product(
          id: 3,
          price: '1000',
          oldPrice:'2000',
          productDescription: 'Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2',
          productImage: 'prdduct3.png',
          productName: 'Apple watch - M3'),
      Product(
          id: 4,
          price: '550',
          oldPrice:'1150',
          productDescription: 'Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2Apple watch - M2',
          productImage: 'watch.png',
          productName: 'Apple watch - M3'),
    ];

    products.assignAll(productResult)  ;
    update() ;
  }

  void changePagerColor(int index) {
    currentIndex.value = index ;
  }

  void addProductToCart(CartItem cartItem){
    if (! cartProducts.map((element) => element.product.id).contains(cartItem.product.id))
       cartProducts.add(cartItem);
    update();
  }

  void addQuantity(CartItem cartItem){
      cartProducts.forEach((element) {
        if(element.product.id == cartItem.product.id)
          element.cartItemQuantity++ ;
      });
      update();
  }

  void subtractQuantity(CartItem cartItem){
    if(cartItem.cartItemQuantity > 0)
    {
      cartProducts.forEach((element) {
      if(element.product.id == cartItem.product.id)
        element.cartItemQuantity-- ;
    });
    }
    update();
  }


}