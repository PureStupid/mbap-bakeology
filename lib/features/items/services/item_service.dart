import 'package:bakeology/features/items/models/item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ItemService {
  Stream<List<Item>> getItems() {
    return FirebaseFirestore.instance
        .collection('items')
        .orderBy('expiryDate')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => Item(
                  id: doc.id,
                  name: doc.get('name') ?? '',
                  expiryDate:
                      (doc.get('expiryDate') ?? DateTime.now() as Timestamp)
                          .toDate(),
                  purchaseDate:
                      (doc.get('purchaseDate') ?? DateTime.now() as Timestamp)
                          .toDate(),
                ))
            .toList());
  }

  Future<void> addItem(
      String name, DateTime expiryDate, DateTime purchaseDate) {
    return FirebaseFirestore.instance.collection('items').add({
      'name': name,
      'expiryDate': expiryDate,
      'purchaseDate': purchaseDate,
    });
  }

  Future<void> updateItem(
      String id, String name, DateTime expiryDate, DateTime purchaseDate) {
    return FirebaseFirestore.instance.collection('items').doc(id).update({
      'name': name,
      'expiryDate': expiryDate,
      'purchaseDate': purchaseDate,
    });
  }

  Future<void> deleteItem(String id) {
    return FirebaseFirestore.instance.collection('items').doc(id).delete();
  }
}
