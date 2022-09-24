import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/addToCartModel.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/user_data.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utilities/api_path.dart';

abstract class Database {
  Stream<List<Product>> salesProductStream();
  Stream<List<Product>> newProductStream();
  Stream<List<AddToCartModel>> myProductsCart();
  Future<void> setUserData(UserData userData);
  Future<void> addToCart(AddToCartModel addToCartModel);
}

class FireStorDatabase implements Database {
  final _service = FirestoreServices.instance;
  final String userId;

  FireStorDatabase(this.userId);
  @override
  Stream<List<Product>> salesProductStream() {
    return _service.collectionStream(
        path: 'products/',
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('discountValue', isNotEqualTo: 0));
  }

  @override
  Stream<List<Product>> newProductStream() {
    return _service.collectionStream(
        path: ApiPath.products(),
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query) => query.where('discountValue', isEqualTo: 0));
  }

  @override
  Future<void> setUserData(UserData userData) async {
    await _service.setData(
        path: ApiPath.user(userData.uid), data: userData.toMap());
  }

  @override
  Future<void> addToCart(AddToCartModel product) async {
    await _service.setData(
        path: ApiPath.addToCart(userId, product.id), data: product.toMap());
  }

  @override
  Stream<List<AddToCartModel>> myProductsCart() {
    return _service.collectionStream(
      path: ApiPath.MyProductsCart(userId),
      builder: (data, documentId) => AddToCartModel.fromMap(data!, documentId),
    );
  }
}
