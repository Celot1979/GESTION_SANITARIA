import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';

class PacientVerification {
  static String? userName, userpathology, medication,time; // Variable estática para almacenar el nombre del usuario a nivel global
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Map<String, String?> userData = {}; // Variable estática para almacenar los datos del usuario

  Future<bool> checkRoomExists(String room) async {
    try {
      // Consulta a la colección de usuarios para verificar si existe un documento con el correo electrónico
      QuerySnapshot querySnapshotEmail = await _firestore.collection('pacient').where('room', isEqualTo: room).get();
      // Consulta a la colección de usuarios para verificar si existe un documento con el número de teléfono
      //QuerySnapshot querySnapshotPhoneNumber = await _firestore.collection('registro').where('movil', isEqualTo: phoneNumber).get();

      // Verificar si ambos documentos existen
      if (querySnapshotEmail.docs.isNotEmpty ) {
        userData = {
          'fullname': querySnapshotEmail.docs.first['fullname'],
          'pathology': querySnapshotEmail.docs.first['pathology'],
          'medication': querySnapshotEmail.docs.first['medication'],
          'time': querySnapshotEmail.docs.first['time'],
        };

        // Imprimir todos los datos del usuario
        printUserData(); // Llamada a la función para imprimir datos

        return true; // Ambos documentos encontrados
      } else {
        if (querySnapshotEmail.docs.isEmpty) {
          //print('Documento con el correo electrónico no encontrado'); // Mensaje si no se encuentra el documento de email
        }
        
      }

      return false; // Al menos uno de los documentos no fue encontrado
    } catch (e) {
      //print('Error al verificar usuario: $e');
      return false;
    }
  }

  void printUserData() {
    print('Nombre completo: ${userData['fullname']}');
    print('Patología: ${userData['pathology']}');
    print('Medicación: ${userData['medication']}');
    print('Hora: ${userData['time']}');
  }

  // Getter para obtener la información del usuario
  static Map<String, String?> get userInfo => userData; // Getter para acceder a la información del usuario
}

