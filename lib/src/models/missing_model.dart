import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class MissingModel {
  final String name;
  final String label;
  final List<dynamic> images;
  final String body;
  final String email;
  final String phone;

  MissingModel({
    @required this.name,
    @required this.label,
    @required this.images,
    @required this.body,
    @required this.email,
    @required this.phone,
  });

  factory MissingModel.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;

    return MissingModel(
      name: data['name'].toString(),
      label: data['label'].toString(),
      images: data['images'],
      body: data['body'].toString(),
      email: data['email'].toString(),
      phone: data['phone'].toString(),
    );
  }
}
