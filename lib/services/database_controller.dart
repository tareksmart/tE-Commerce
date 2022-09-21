import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/models/user_data.dart';
import 'package:ecommerce/services/firestore_services.dart';
import 'package:ecommerce/utilities/api_path.dart';

import '../models/user_data.dart';

abstract class Database {
  Stream<List<Product>> salesProductStream();
  Stream<List<Product>> newProductStream();
  Future<void> setDataUser(UserData userData);
<<<<<<< HEAD

=======
>>>>>>> b987ae40f76bda1bc333b1af4829635d9f6f32c2
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
    queryBuilder: (query)=>query.where('discountValue',isNotEqualTo: 0));
  }

  @override
  Stream<List<Product>> newProductStream() {
    return _service.collectionStream(
        path: ApiPath.products,
        builder: (data, documentId) => Product.fromMap(data!, documentId),
        queryBuilder: (query)=>query.where('discountValue',isEqualTo: 0));
  }

  @override
  Future<void> setDataUser(UserData userData) async{
<<<<<<< HEAD
   await _service.setData(path: ApiPath.user(userData.uid), data: userData.toMap());
  }

  @override
  // TODO: implement database
  Database get database => throw UnimplementedError();
=======
  _service.setData(path: ApiPath.user(userId), data: userData.toMap());
  }
>>>>>>> b987ae40f76bda1bc333b1af4829635d9f6f32c2
}
