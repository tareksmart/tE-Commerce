import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreServices {
  FirestoreServices._(); //private constructor
  static final instance = FirestoreServices
      ._(); //one object to access to it from any where in the project
  final _firestore = FirebaseFirestore.instance;
  Future<void> setData(
      {required String path, required Map<String, dynamic> data}) async {
    final referance = _firestore.doc(path);
    await referance.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final referance = _firestore.doc(path);
    await referance.delete();
  }
/*snapshots.map **Transforms each element of this stream into a new stream event.
Creates a new stream that converts each element of this stream
to a new value using the convert function, and emits the result.*/

  Stream<T> documentsStream<T>(
      {required path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder}) {
    final referance = _firestore.doc(path);
    final snapshots = referance.snapshots();

    return snapshots.map(
        (snapshot) => builder(snapshot.data(), snapshot.id)); //convert function
  }

  Stream<List<T>> collectionStream<T>(
      {required path,
      required T Function(Map<String, dynamic>? data, String documentId)
          builder,
      Query Function(Query query)? queryBuilder,
      int Function(T lhs, T rhs)? sort}) {
    Query query = _firestore.collection(path); //اعمل query للكل all collections
    if (queryBuilder != null) {
      //لو ال querybuilder اللى جاى من بره ملبان يعنى عايزين نستعلم عن شىء معين
      query = queryBuilder(
          query); //خد query for all collection مرره بالqueryBuilder والنتيجة حطها فى ال object query من نوع َQuery
    }
    final snapshots = query.snapshots();
    return snapshots.map(
      (snapshot /*one collection*/) {
        final result = snapshot.docs
            .map(
              (snapshot /*one document*/) {
                return builder(
                  snapshot.data() as Map<String, dynamic>,
                  snapshot.id,
                );
              },
            )
            .where((value) => value != null)
            .toList();
        if (sort != null) {
          result.sort(sort);
        }
        return result;
      },
    );
  }
}
//sico sico