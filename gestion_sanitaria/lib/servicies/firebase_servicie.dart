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


Future <void> addRegistro(String name,String lastname,String movil,String email) async {
  await db.collection("registro").add({"name":name, "lastname":lastname, "movil":movil, "email":email});
}
