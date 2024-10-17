import 'package:cloud_firestore/cloud_firestore.dart';

// ignore: unused_import
import 'package:fluttertoast/fluttertoast.dart';


FirebaseFirestore db = FirebaseFirestore.instance;

// Crear una función para que nos devuelva los registros 
Future <List> getRegistro() async {
  List registro =[];

  CollectionReference collectionReferenceRegistro = db.collection("registro");
  QuerySnapshot queryRegistro = await collectionReferenceRegistro.get();
  for (var documento in queryRegistro.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {
      "name": data["name"],
      "lastname": data["lastname"],
      "movil": data["movil"],
      "email": data["email"],
      "uid": documento.id,
    };
    registro.add(person);
  }

  return registro;
}

//Añadir Registros
Future <void> addRegistro(String name,String lastname,String movil,String email) async {
  await db.collection("registro").add({"name":name, "lastname":lastname, "movil":movil, "email":email});
}
//Actualizar Registros
Future <void> updateRegistro(String uid,String newname,String newlastname,String newmovil,String newemail) async {
  await db.collection("registro").doc(uid).set({"name":newname, "lastname":newlastname, "movil":newmovil, "email":newemail});
}
//Eliminar Registros
Future <void> deleteRegistro(String uid) async {
  await db.collection("registro").doc(uid).delete();
}



