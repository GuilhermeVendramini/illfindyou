import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:illfindyou/src/services/firestore_service.dart';

class MissingData {
  Future<QuerySnapshot> loadMissing({@required String label}) {
    return FirestoreService.firestore
        .collection("missing")
        .where("label", isEqualTo: label)
        .getDocuments();
  }
}
