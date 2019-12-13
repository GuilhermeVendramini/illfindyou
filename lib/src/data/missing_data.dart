import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class MissingData {
  final Firestore firestore = Firestore.instance;

  Future<QuerySnapshot> loadMissing({@required String label}) {
    return firestore
        .collection("missing")
        .where("label", isEqualTo: label)
        .getDocuments();
  }
}
