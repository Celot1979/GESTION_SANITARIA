import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/map.dart';
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

      floatingActionButton: IconButton(
        onPressed: () async {
          await Navigator.pushNamed(context, '/'); // Navega a la página HOME
        },
        icon: const Icon(Icons.home), // Cambia 'icon' por el ícono deseado
      ),
    );
  }

  void _showTooltip(BuildContext context, String message) {
    // Implementa la lógica para mostrar el tooltip
  }

  void _hideTooltip(BuildContext context) {
    // Implementa la lógica para ocultar el tooltip
  }
}
