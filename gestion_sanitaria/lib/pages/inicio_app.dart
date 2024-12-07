import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/login.dart';
import 'package:gestion_sanitaria/widgets/custom_textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
//import 'package:gestion_sanitaria/widgets/custom_button.dart';



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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "Welcome to the Hospital La Caridad foundation", imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
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
