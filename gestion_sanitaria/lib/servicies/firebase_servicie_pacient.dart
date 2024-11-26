import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore dbp = FirebaseFirestore.instance;
Future <List> getpacientPatients() async {
  List pacient =[];

  CollectionReference collectionReferencepacient = dbp.collection("pacient");
  QuerySnapshot querypacient = await collectionReferencepacient.get();
  for (var documento in querypacient.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final person = {
      "room": data["room"],
      "fullname": data["fullname"],
      "pathology": data["pathology"],
      "medication": data["medication"],
      "time": data["time"],
      "uid": documento.id,
    };
    pacient.add(person);
  }

  return pacient;
}


Future <void> addpacientP(String room,String fullname,String pathology, String time,String medication) async {
  await dbp.collection("pacient").add({"room":room,"fullname":fullname, "pathology":pathology,"time":time, "medication": medication});
}

Future <void> updateRegistroP(String uid,String newroom,String fullname,String pathology,String newmedication,String newtime) async {
  await dbp.collection("pacient").doc(uid).set({"room":newroom, "fullname":fullname, "pathology":pathology, "medication":newmedication,"time":newtime});
}
//Eliminar Registros
Future <void> deleteRegistroP(String uid) async {
  await dbp.collection("pacient").doc(uid).delete();
}