import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class UserVerification {
  static String? userName; // Variable estática para almacenar el nombre del usuario a nivel global
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<bool> checkUserExists(String email, String phoneNumber) async {
    try {
      // Consulta a la colección de usuarios para verificar si existe un documento con el correo electrónico
      QuerySnapshot querySnapshotEmail = await _firestore.collection('registro').where('email', isEqualTo: email).get();
      // Consulta a la colección de usuarios para verificar si existe un documento con el número de teléfono
      QuerySnapshot querySnapshotPhoneNumber = await _firestore.collection('registro').where('movil', isEqualTo: phoneNumber).get();

      // Si se encuentra al menos un documento, significa que el usuario ya existe
      if (querySnapshotEmail.docs.isNotEmpty) {
        userName = querySnapshotEmail.docs.first['name']; // Guardar el nombre del usuario
      } else if (querySnapshotPhoneNumber.docs.isNotEmpty) {
        userName = querySnapshotPhoneNumber.docs.first['name']; // Guardar el nombre del usuario
      }

      return querySnapshotEmail.docs.isNotEmpty || querySnapshotPhoneNumber.docs.isNotEmpty;
    } catch (e) {
      print('Error al verificar usuario: $e');
      return false;
    }
  }
}
