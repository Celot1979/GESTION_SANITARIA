import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie.dart';
import 'package:gestion_sanitaria/widgets/custom_Textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
import 'package:gestion_sanitaria/widgets/custom_button.dart';

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
    final Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?; // Cambiado a Map?
    
    // Verifica si 'arguments' es nulo antes de acceder a sus valores
    if (arguments == null) {
      return const Scaffold(
        appBar: CustomAppBar(
          title: "HEALTH MANAGEMENT",
          subtitle: "Error: No se encontraron datos.",
        ),
        body: Center(child: Text("No se encontraron datos para editar.")),
      );
    }

    nameControler.text = arguments['name']?.data ?? ""; // Proporciona un valor predeterminado
    lastControler.text = arguments['lastname']?.data ?? "";
    movilControler.text = arguments['movil']?.data ?? "";
    emailControler.text = arguments['email']?.data ?? "";

    //['lastname'];['movil'];['email'];
    return Scaffold(
     appBar: const CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "Edit system worker records",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 20),
          CustomTextField(
            controller: nameControler,
            hintText: "Enter name modification",
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.name,
           
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: lastControler,
            hintText: "Enter the last name modification",
            prefixIcon: Icons.person_outline,
            keyboardType: TextInputType.name,
           
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: movilControler,
            hintText: "Enter the modification of the mobile numbers ",
            prefixIcon: Icons.phone,
            keyboardType: TextInputType.phone,
            
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: emailControler,
            hintText: "Enter the email address modification",
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            
          ),
         const SizedBox(width: 30,height: 20,),
            Container(
              
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: Expanded(
                      child: CustomButton(
                        text: "UPDATE",
                        height: 50, // Cambiado a un valor más estándar
                        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Tamaño de fuente reducido
                        textColor: Colors.white,
                        buttonColor: Colors.blue,
                        borderRadius: 10,
                        margin: const EdgeInsets.only(left: 8),
                        onPressed: () async {
                          await updateRegistro(arguments['uid']?.data,nameControler.text,lastControler.text,movilControler.text,emailControler.text).then((_){
                            Navigator.pop(context);
                            });
                        },
                      ),
                    ),
            ),
          ],
        ),
      );
                  
  
  }

  
 
}
