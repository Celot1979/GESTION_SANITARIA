import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/login.dart';
import 'package:gestion_sanitaria/widgets/custom_textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
//import 'package:gestion_sanitaria/widgets/custom_button.dart';
import 'dart:async';



class Home extends StatefulWidget {
  const Home({
    super.key,
  });
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController nameControler = TextEditingController(text: " ");
  TextEditingController movilControler = TextEditingController(text: " ");
  TextEditingController emailControler = TextEditingController(text: " ");
   // Agregado para definir la variable
   bool isVariableDefined = false;
   // Agregado para definir la variable de texto
   String errorMessage = ""; // Variable de texto
   int _selectedIndex = 0; // Inicializa el índice seleccionado
   Color _colorCuadrado = Colors.yellow; // Color inicial del cuadrado

  @override
  void initState() {
    super.initState();
    _cambiarColorCuadrado(); // Llama al método para cambiar el color
  }
  //Transforma el color de la animación
  void _cambiarColorCuadrado() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      // Lógica para cambiar el color gradualmente
      setState(() {
        // Cambia el color aquí para ir de amarillo a rojo
        _colorCuadrado = Color.lerp(const Color.fromARGB(255, 106, 144, 240), const Color.fromARGB(255, 237, 171, 63), timer.tick / 10) ?? const Color.fromARGB(255, 227, 100, 91);
      });
      if (timer.tick >= 10) {
        timer.cancel(); // Detiene el timer después de 10 segundos
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "Welcome to the Hospital La Caridad foundation",
        imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
        linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
        titleStyle: TextStyle(fontSize: 24),
        subtitleStyle: TextStyle(fontSize: 16),
      ),
      body: Stack( // Cambiado a Stack para superponer el cuadrado
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://i.ibb.co/VwvK9K8/HOOSPITAL-FONDO.jpg'), // Imagen de fondo
                fit: BoxFit.cover, // Ajusta la imagen para cubrir todo el contenedor
              ),
            ),
          ),
          AnimatedContainer( // Cuadrado animado
            duration: const Duration(seconds: 5), // Duración de la animación
            color: _colorCuadrado.withOpacity(0.3), // Color del cuadrado con opacidad
            width: double.infinity,
            height: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 32),
                CustomTextField(
                  controller: emailControler,
                  hintText: "add email address",
                  prefixIcon: Icons.email,
                  keyboardType: TextInputType.emailAddress, onTap: () {  },
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  controller: movilControler,
                  hintText: "add mobile phone number ",
                  prefixIcon: Icons.phone,
                  keyboardType: TextInputType.phone,
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: const Color.fromARGB(255, 187, 208, 218),
        unselectedItemColor: Colors.white,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.app_registration),
            label: "REGISTER",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.login),
            label: "LOGIN",
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
          if (index == 0) {
            Navigator.pushNamed(context, "/add");
          } else if (index == 1) {
            UserVerification userVerification = UserVerification();
            userVerification.checkUserExists(emailControler.text, movilControler.text).then((userExists) {
              if (userExists) {
                Navigator.pushNamed(context, "/login", arguments: UserVerification.userName?.toUpperCase()).then((_) {
                  Navigator.pop(context);
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Usuario o contraseña no encontrados',
                      style: TextStyle(color: Colors.blue, fontSize: 22),
                    ),
                  ),
                );
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Home()),
                );
              }
            });
          }
        },
      ),
    );
  }

 
}
