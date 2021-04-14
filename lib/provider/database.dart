import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app/model/product.dart';

class DatabaseService {

  final CollectionReference goodsCollection = FirebaseFirestore.instance.collection('goods');
  DatabaseService();

  Future updateUserData(String barCode, String name, String feedback) async {
    return await goodsCollection.doc(barCode).set(
      {
        "barCode": barCode,
        "name": name,
        "feedback": feedback
      }
    );
}
  List<Product> _goodsListFromSnaphot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return Product(
        name: doc.data()['name'] ?? '',
        code: doc.data()['code'] ?? '',
        feedback: doc.data()['feedback'] ?? ''
      );
    }
    ).toList();
  }
  Stream<List<Product>> get goods{
    return goodsCollection.snapshots()
        .map(_goodsListFromSnaphot);
  }
}