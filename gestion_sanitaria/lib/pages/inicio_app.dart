import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/login.dart';
import 'package:gestion_sanitaria/widgets/custom_Textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
import 'package:gestion_sanitaria/widgets/custom_button.dart';



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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "Welcome to the Hospital La Caridad foundation",
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: CustomButton(
                    text: "REGISTER",
                    height: 50,
                    textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textColor: Colors.white,
                    buttonColor: Colors.blue,
                    borderRadius: 10,
                    margin: const EdgeInsets.only(right: 8),
                    onPressed: () async {
                      await Navigator.pushNamed(context, "/add");
                      setState(() {});
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: CustomButton(
                    text: "LOGIN",
                    height: 50,
                    textStyle: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textColor: Colors.white,
                    buttonColor: Colors.blue,
                    borderRadius: 10,
                    margin: const EdgeInsets.only(left: 8),
                    onPressed: () async {
                      UserVerification userVerification = UserVerification();
                      bool userExists = await userVerification.checkUserExists(emailControler.text, movilControler.text);
                      if (userExists) {
                        print('El usuario ya existe ${UserVerification.userName}');
                         await Navigator.pushNamed(context, "/login", arguments: UserVerification.userName?.toUpperCase()).then((_) {
                          Navigator.pop(context);
                         });
                         setState(() {});
                        } else {
                          print('El usuario no existe');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                'Usuario o contraseña no encontrados',
                                style: TextStyle(color: Colors.blue, fontSize: 22), // Aumentado el tamaño de la fuente
                              ),
                            ),
                          );
                          emailControler.clear();
                          movilControler.clear();
                          setState(() {
                            
                          });
                        }
                      
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
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
    );
  }

 
}
