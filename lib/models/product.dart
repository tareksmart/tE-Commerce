import 'package:ecommerce/utilities/app_assets.dart';

class Product {
  final String id;
  final String title;
  final int price;
  final String imgUrl;
  final int discountValue;
  final String? category;
  final int? rate;

  Product(
      {required this.id,
      required this.title,
      required this.price,
      required this.imgUrl,
      required this.discountValue,
      this.category = 'other',
      this.rate});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'imgUrl': imgUrl,
      'discountValue': discountValue,
      'category': category,
      'rate': rate,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map,String documentId) {
    return Product(
      id: map['id'] as String,
      title: map['title'] as String,
      price: map['price'] as int,
      imgUrl: map['imgUrl'] as String,
      discountValue: map['discountValue'] as int,
      category: map['category'] as String,
      rate: map['rate'] as int,
    );
  }
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
