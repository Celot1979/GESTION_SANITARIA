import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/home_page.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie.dart';
import 'package:gestion_sanitaria/widgets/custom_Textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_button.dart';

class add_Registro extends StatefulWidget {
  const add_Registro({
    super.key,
  });
  @override
  State<add_Registro> createState() => _add_RegistroState();
}

class _add_RegistroState extends State<add_Registro> {
  //Controladores para guardar la info de los registros 
  TextEditingController nameControler = TextEditingController(text: " ");
  TextEditingController lastControler = TextEditingController(text: " ");
  TextEditingController movilControler = TextEditingController(text: " ");
  TextEditingController emailControler = TextEditingController(text: " ");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100, // Aumenta la altura de la barra de la aplicación
        title: const Column(
          children: [
            Text(
              "HEALTH MANAGEMENT",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 16),
            Text(
              "Add Registration",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(width: 30),
          ],
        ),
        backgroundColor: Colors.blue,
        elevation: 3,
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              controller: nameControler,
              hintText: "add name",
              prefixIcon: Icons.person_outline,
              keyboardType: TextInputType.name,
              
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: lastControler,
              hintText: "add lastaname",
              prefixIcon: Icons.person_outline,
              keyboardType: TextInputType.name,
               // Agregado para resolver el error
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: movilControler,
              hintText: "add mobile phone number ",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
               // Agregado para resolver el error
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: emailControler,
              hintText: "add email address",
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              
            ),
            const SizedBox(width: 30,height: 20,),
            Container(
              
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: Expanded(
                      child: CustomButton(
                        text: "SAVE",
                        height: 50, // Cambiado a un valor más estándar
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Tamaño de fuente reducido
                        textColor: Colors.white,
                        buttonColor: Colors.blue,
                        borderRadius: 10,
                        margin: const EdgeInsets.only(left: 8),
                        onPressed: () async {
                          await addRegistro(nameControler.text, lastControler.text, movilControler.text, emailControler.text).then((_) {
                            // Navegar a la página edit_page.dart después de agregar el registro
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => const Home_read()), // Asegúrate de importar EditPage
                            );
                          });
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

}
