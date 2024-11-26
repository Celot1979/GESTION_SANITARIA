import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gestion_sanitaria/pages/Pacient/edit_pacient.dart';
import 'package:gestion_sanitaria/pages/edit_regis.dart';
import 'package:gestion_sanitaria/pages/login.dart';
import 'package:gestion_sanitaria/pages/map.dart';
import 'package:gestion_sanitaria/pages/Pacient/pacient_record.dart';
import 'firebase_options.dart';
//Importaciones de las páginas de
import 'package:gestion_sanitaria/pages/add_regis.dart';
import 'package:gestion_sanitaria/pages/inicio_app.dart';

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
      debugShowCheckedModeBanner: false, //
      title: 'Gestión sanitaria',
      initialRoute: '/',
      routes:{
        '/': (context) => const Home(),
        '/add': (context) => const AddRegistro(),
        '/edit': (context) => const EditNamePage(),
        '/login': (context) => const Login(),
        '/map': (context) => const MapWidget(),
        '/pacient': (context) => const PacientRecord(),
        '/edit_pacient': (context) => const EditPacient(),
        
        

        
        
      },
    );
  }
}

