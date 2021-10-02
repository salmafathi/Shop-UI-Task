import 'package:get/get.dart';
class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final String price;
  final String oldPrice;
  final isFavorite = false.obs;

  Product({
    required this.id,
    required this.productName,
    required this.productImage,
    required this.productDescription,
    required this.price,
    required this.oldPrice,
  });
}