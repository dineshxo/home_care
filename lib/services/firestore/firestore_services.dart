import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/products.dart';

class FirestoreService {
  static Future<void> addProduct(Products product) async {
    CollectionReference products =
        FirebaseFirestore.instance.collection('products');
    await products.add(product.toJSON());
  }

  static Future<List<Products>> fetchProducts() async {
    CollectionReference productsCollection =
        FirebaseFirestore.instance.collection('products');
    QuerySnapshot querySnapshot = await productsCollection.get();

    return querySnapshot.docs.map((doc) {
      return Products.fromMap(doc.data() as Map<String, dynamic>);
    }).toList();
  }
}
