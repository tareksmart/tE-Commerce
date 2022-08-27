import 'package:ecommerce/utilities/app_assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int discountValue;
  final String? category;
  final double? rate;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.imgUrl,
      required this.discountValue,
      this.category = 'other',
      this.rate});
} //end product class

//خارج الكلاس
List<Product> dummyProducts = [
  Product(
      id: '1',
      title: 'Dress',
      price: 1500,
      imgUrl: AppAssets.imageHome1,
      category: 'clothes',
      discountValue: 15),
  Product(
      id: '1',
      title: 'Dress',
      price: 1500,
      imgUrl: AppAssets.imageHome1,
      category: 'clothes',
      discountValue: 15),
  Product(
      id: '1',
      title: 'Dress',
      price: 1500,
      imgUrl: AppAssets.imageHome1,
      category: 'clothes',
      discountValue: 15),
  Product(
      id: '1',
      title: 'Dress',
      price: 1500,
      imgUrl: AppAssets.imageHome1,
      category: 'clothes',
      discountValue: 15),
  Product(
      id: '1',
      title: 'Dress',
      price: 1500,
      imgUrl: AppAssets.imageHome1,
      category: 'clothes',
      discountValue: 15)
];
