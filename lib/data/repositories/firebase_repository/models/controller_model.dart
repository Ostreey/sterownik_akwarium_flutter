import 'package:cloud_firestore/cloud_firestore.dart';

class Controller {
  final String id;
  final String name;

  Controller({
    required this.id,
    required this.name,
  });

  factory Controller.fromDocument(DocumentSnapshot doc) {
    return Controller(
      id: doc.id,
      name: doc['name'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
    };
  }
}
