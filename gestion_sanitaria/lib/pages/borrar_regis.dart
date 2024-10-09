import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie.dart';

class EditNamePage extends StatefulWidget {
  const EditNamePage({
    super.key,
  });
  @override
  State<EditNamePage> createState() => _EditNamePageState();
}

class _EditNamePageState extends State<EditNamePage> {
  //Controladores para guardar la info de los registros 
  TextEditingController nameControler = TextEditingController(text: " ");
  TextEditingController lastControler = TextEditingController(text: " ");
  TextEditingController movilControler = TextEditingController(text: " ");
  TextEditingController emailControler = TextEditingController(text: " ");

  @override
  Widget build(BuildContext context) {
    final Map arguments = ModalRoute.of(context)!.settings.arguments as Map;
    nameControler.text = arguments['name']?.data;
    lastControler.text = arguments['lastname']?.data;
    movilControler.text = arguments['movil']?.data;
    emailControler.text = arguments['email']?.data;

    //['lastname'];['movil'];['email'];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "EDIT RECORD",
          style: TextStyle(
            fontSize:20,
            fontWeight: FontWeight.bold,
          ),
          ),
          backgroundColor: Colors.blue,
          elevation: 2,
          centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          _buildTextField(
            controller: nameControler,
            hintText: "Enter name modification",
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: lastControler,
            hintText: "Enter the last name modification",
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: movilControler,
            hintText: "Enter the modification of the mobile numbers ",
            prefixIcon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            controller: emailControler,
            hintText: "Enter the email address modification",
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          ElevatedButton(
            onPressed: () async{
              await updateRegistro(arguments['uid']?.data,nameControler.text,lastControler.text,movilControler.text,emailControler.text).then((_){
                Navigator.pop(context);
              });
              
            },
            child: const Text("UPDATE"),
          ),
        ],
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
