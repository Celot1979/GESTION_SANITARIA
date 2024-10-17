// ignore: unused_import
import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:flutter/material.dart';

validate_data(String email, String mobile) async {
  try {
    CollectionReference ref = FirebaseFirestore.instance.collection("registro");
    QuerySnapshot usuario = await ref.get();
    print("Buscando usuario con email: $email y móvil: $mobile");
    if(usuario.docs.isNotEmpty){
      for(var cursor in usuario.docs){
        String docEmail = cursor.get("email");
        String docMovil = cursor.get("movil");
        print("Documento encontrado - Email: $docEmail, Móvil: $docMovil");
        if(docEmail == email && docMovil == mobile){
          print("USUARIO ENCONTRADO CON ÉXITO");
          return true; // Usuario validado correctamente
        }
      }
      print("Usuario no encontrado después de revisar todos los documentos");
      return false; // Usuario no encontrado
    } else {
      print("No hay documentos en la colección");
      return false; // No hay usuarios para validar
    }
  } catch (e) {
    print('Error durante la validación de datos: $e');
    return false; // Error durante la validación
  }
}
