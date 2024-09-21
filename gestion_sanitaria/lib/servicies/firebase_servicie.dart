import 'package:cloud_firestore/cloud_firestore.dart';


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
