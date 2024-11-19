import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/map.dart';
import 'package:gestion_sanitaria/pages/pacient_record.dart';
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
    // Aquí puedes agregar la lógica para navegar a las diferentes páginas
    if (index == 0) {
      // Navegar a la página de registro de paciente
    } else if (index == 1) {
      // Navegar a la página de inicio
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "WELCOME  ${UserVerification.userName}".toUpperCase(),  
        imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', 
        linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
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
            icon: Icon(Icons.assignment, color: Colors.blue), // Icono para registro de paciente
            label: 'Registro Paciente',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.blue), // Icono para home
            label: 'Home',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: (index) {
          _onItemTapped(index);
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PacientRecord()), // Llama a PacientRecord
            );
          } else if (index == 1) {
            Navigator.pushNamed(context, '/'); // Navega a la página HOME
          }
        },
      ),
    );
  }
}
