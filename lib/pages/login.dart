import 'package:flutter/material.dart';
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
        subtitle: "WELCOME  ${UserVerification.userName}", imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
      ),



      
      floatingActionButton: IconButton(
        onPressed: () async{
          await Navigator.pushNamed(context, '/'); // Navega a la página HOME
        },
        icon: const Icon(Icons.home), // Cambia 'icon' por el ícono deseado
      ),
    );
  }
}
