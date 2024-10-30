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

      // Verificar si ambos documentos existen
      if (querySnapshotEmail.docs.isNotEmpty && querySnapshotPhoneNumber.docs.isNotEmpty) {
        userName = querySnapshotEmail.docs.first['name']; // Guardar el nombre del usuario
        return true; // Ambos documentos encontrados
      }

      return false; // Al menos uno de los documentos no fue encontrado
    } catch (e) {
      print('Error al verificar usuario: $e');
      return false;
    }
  }
}
