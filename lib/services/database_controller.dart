import 'package:ecommerce/models/product.dart';
import 'package:ecommerce/services/firestore_services.dart';

abstract class Database {
  Stream<List<Product>> productStream();
}

class FireStorDatabase implements Database {
  final _service = FirestoreServices.instance;
  final String userId;

  FireStorDatabase(this.userId);
  @override
  Stream<List<Product>> productStream() {
    return _service.collectionStream(
        path: 'products/',
        builder: (data, documentId) => Product.fromMap(data!, documentId));
  }
}
