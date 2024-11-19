import 'package:cloud_firestore/cloud_firestore.dart';


FirebaseFirestore dbp = FirebaseFirestore.instance;

Future <void> addRegistroP(String room,String fullname,String pathology, String time,String medication) async {
  await dbp.collection("pacient").add({"room":room,"fullname":fullname, "pathology":pathology,"time":time, "medication": medication});
}