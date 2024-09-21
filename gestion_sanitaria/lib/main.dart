import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
//Importaciones de las páginas de
import 'package:gestion_sanitaria/pages/add_regis.dart';
import 'package:gestion_sanitaria/pages/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Gestión sanitaria',
      initialRoute: '/',
      routes:{
        '/': (context) => const Home(),
         '/add': (context) => const add_registro(),
        
      },
    );
  }
}

