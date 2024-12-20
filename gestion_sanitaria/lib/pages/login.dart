import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/inicio_app.dart';
import 'package:gestion_sanitaria/pages/map.dart';
import 'package:gestion_sanitaria/pages/Pacient/pacient_record.dart';
import 'package:gestion_sanitaria/servicies/login.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';

class Login extends StatefulWidget {
  const Login({
    super.key,
  });
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _selectedIndex = 0; // Índice del elemento seleccionado

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _navigateToPage(index);
  }

  void _navigateToPage(int index) {
    Widget page;
    switch (index) {
      case 0:
        page = const PacientRecord();
        break;
      case 1:
        page = const Home();
        break;
      default:
        return;
    }
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "WELCOME  ${UserVerification.userName}".toUpperCase(),  
        imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', 
        linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
        titleStyle: const TextStyle(fontSize: 24),
        subtitleStyle: const TextStyle(fontSize: 16),
        
      ),
      
      body: const Center(
        child: MapWidget(), 
        /*LLama a la página map.dart. Es dónde tenemos la interfaz del plano del pabellón.
        También tendremos el código de interfaz de seleccionar las habitaciones y nombres de los enfermos.
        */
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment, color: Colors.white), // Icono para registro de paciente
            label: 'Registro Paciente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.white), // Icono para home
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex,
        backgroundColor: Colors.blue, // Corregido el nombre del parámetro
        selectedItemColor: const Color.fromARGB(255, 187, 208, 218), // Color del ítem seleccionado
        unselectedItemColor: Colors.white, 
        onTap: _onItemTapped,
      ),
    );
  }
}
