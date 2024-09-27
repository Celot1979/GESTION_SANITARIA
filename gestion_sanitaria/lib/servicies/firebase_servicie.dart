import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';


FirebaseFirestore db = FirebaseFirestore.instance;

// Crear una función para que nos devuelva los registros 
Future <List> getRegistro() async {
  List registro =[];

  CollectionReference collectionReferenceRegistro = db.collection("registro");
  QuerySnapshot queryRegistro = await collectionReferenceRegistro.get();
  for (var documento in queryRegistro.docs) {
    registro.add(documento.data());

  }

  return registro;
}


/*Future <void> addRegistro(String name,String lastaname,String movil,String email) async {
  await db.collection("registro").add({"name":name, "lastaname":lastaname, "movil":movil, "email":email});
}*/
Future<void> registrarUsuario(
  String nombre,
  String apellidos,
  String movil,
  String email,
) async {
  try {
    // Referencia a la colección en Firebase
    final collection = FirebaseFirestore.instance.collection('registro');

    // Crear un mapa con los datos a guardar
    final usuario = {
      'nombre': nombre,
      'apellidos': apellidos,
      'movil': movil,
      'email': email,
    };

    // Agregar el documento a la colección
    await collection.add(usuario);
    

    // Mostrar una notificación de éxito
    Fluttertoast.showToast(
      msg: "Usuario registrado exitosamente",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  } catch (e) {
    print('Error al registrar usuario: $e');
    // Mostrar una notificación de error (opcional)
    Fluttertoast.showToast(
      msg: "Error al registrar usuario",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
    );
  }
}