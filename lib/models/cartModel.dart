import 'package:delta_soft_task/models/productModel.dart';
import 'package:get/get.dart';

class CartItem {
    late Product product ;
    var cartItemQuantity = 1.obs ;
    CartItem({
      required this.product ,
      required this.cartItemQuantity
});

}