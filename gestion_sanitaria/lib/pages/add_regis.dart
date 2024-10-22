import 'package:flutter/material.dart';
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
        title: Column(
          children: [
            const Text(
              "HEALTH MANAGEMENT",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 16),
            const Text(
              "Add Registration",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(width: 30),
          ],
        ),
        backgroundColor: Colors.blue,
        elevation: 3,
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20),
            CustomTextField(
              controller: nameControler,
              hintText: "add name",
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: lastControler,
              hintText: "add lastaname",
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: movilControler,
              hintText: "add mobile phone number ",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
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
                        textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Tamaño de fuente reducido
                        textColor: Colors.white,
                        buttonColor: Colors.blue,
                        borderRadius: 10,
                        margin: const EdgeInsets.only(left: 8),
                        onPressed: () async{
                          await addRegistro(nameControler.text,lastControler.text,movilControler.text,emailControler.text).then((_){
                            Navigator.pop(context);});
                            },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  //Está función personalizada del Widget es para darle una apariencia más profesional y una mejor experiencia al  usuario.
 Widget _buildTextField({
    required String hintText,
    required IconData prefixIcon,
    TextInputType keyboardType = TextInputType.text,
    required TextEditingController controller,
  }) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: Icon(prefixIcon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),

        ),
        filled: true,
        fillColor: Colors.grey[200],
      ),
      keyboardType: keyboardType,
      controller: controller, // Pasa el controlador al TextField
    );
  }
}
