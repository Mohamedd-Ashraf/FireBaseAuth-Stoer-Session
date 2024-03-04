import 'package:cloud_firestore/cloud_firestore.dart';

Future fetchDataFromFirestore(String collection, String documentId) async {
  try {
    var documentSnapshot = await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .get();
    return documentSnapshot;
  } catch (e) {
    // Handle errors appropriately
    rethrow;
  }
}

Future updateDataToFirestore(
    String collection, String documentId, Map<String, dynamic> data) async {
  try {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .update(data);
  } catch (e) {
    // Handle errors appropriately
    rethrow;
  }
}

Future deleteDataFromFirestore(String collection, String documentId) async {
  try {
    await FirebaseFirestore.instance
        .collection(collection)
        .doc(documentId)
        .delete();
  } catch (e) {
    // Handle errors appropriately
    rethrow;
  }
}
