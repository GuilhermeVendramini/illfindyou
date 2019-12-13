import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class MissingModel {
  final String name;
  final String label;

  MissingModel({
    @required this.name,
    @required this.label,
  });

  factory MissingModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return MissingModel(
      name: data['name'].toString(),
      label: data['label'].toString(),
    );
  }
}
