import 'package:flutter/material.dart';

import 'package:gestion_sanitaria/servicies/firebase_servicie_pacient.dart';
import 'package:gestion_sanitaria/widgets/custom_textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
import 'package:gestion_sanitaria/widgets/custom_button.dart';

class EditPacient extends StatefulWidget {
  const EditPacient({
    super.key,
  });
  @override
  State<EditPacient> createState() => _EditPacientState();
}

class _EditPacientState extends State<EditPacient> {
  //Controladores para guardar la info de los registros 
  TextEditingController roomControler = TextEditingController(text: " ");
  TextEditingController fullControler = TextEditingController(text: " ");
  TextEditingController pathologyControler = TextEditingController(text: " ");
  TextEditingController medicationControler = TextEditingController(text: " ");
  TextEditingController timerControler = TextEditingController(text: " ");

  @override
  Widget build(BuildContext context) {
    final Map? arguments = ModalRoute.of(context)?.settings.arguments as Map?; // Cambiado a Map?
    
    // Verifica si 'arguments' es nulo antes de acceder a sus valores
    if (arguments == null) {
      return const Scaffold(
        appBar: CustomAppBar(
          title: "HEALTH MANAGEMENT",
          subtitle: "Error: No se encontraron datos.", imageUrl: 'https://i.ibb.co/xSdvDxv/AppBar.png', linkUrl: 'https://i.ibb.co/xSdvDxv/AppBar.png',
          titleStyle: TextStyle(fontSize: 24),
          subtitleStyle: TextStyle(fontSize: 16),
        ),
        body: Center(child: Text("No se encontraron datos para editar.")),
      );
    }

    roomControler.text = arguments['room']?.data ?? ""; // Proporciona un valor predeterminado
    fullControler.text = arguments['fullname']?.data ?? "";
    pathologyControler.text = arguments['pathology']?.data ?? "";
    medicationControler.text = arguments['medication']?.data ?? "";
    timerControler.text = arguments['time']?.data ?? "";

    //['lastname'];['movil'];['email'];
    return Scaffold(
     appBar: const CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "Edit Patient List", imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
        titleStyle: TextStyle(fontSize: 24),
        subtitleStyle: TextStyle(fontSize: 16),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(width: 30,height: 20),
          CustomTextField(
            controller:  roomControler,
            hintText: "Enter the room number modification",
            prefixIcon: Icons.room,
            keyboardType: TextInputType.name,
            onTap: () {},
           
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: fullControler,
            hintText: "Enter the full name modification",
            prefixIcon: Icons.person_pin_circle,
            keyboardType: TextInputType.name,
            onTap: () {},
           
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: pathologyControler,
            hintText: "Introduces the modification on pathology or pathologies",
            prefixIcon: Icons.medical_information,
            keyboardType: TextInputType.phone,
            onTap: () {},
            
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: medicationControler,
            hintText: "Introduces the modification on medication",
            prefixIcon: Icons.medication_liquid,
            keyboardType: TextInputType.emailAddress,
            onTap: () {},
            
          ),
          const SizedBox(height: 16),
          CustomTextField(
            controller: timerControler,
            hintText: "Introduces the modification on the administration of medication",
            prefixIcon: Icons.timer,
            keyboardType: TextInputType.emailAddress,
            onTap: () {},
            
          ),
         const SizedBox(width: 30,height: 20,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomButton(
                text: "UPDATE",
                height: 50, // Cambiado a un valor más estándar
                textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold), // Tamaño de fuente reducido
                textColor: Colors.white,
                buttonColor: Colors.blue,
                borderRadius: 10,
                margin: const EdgeInsets.only(left: 8),
                onPressed: () async {
                  await updateRegistroP(arguments['uid']?.data,roomControler.text,fullControler.text,pathologyControler.text,medicationControler.text,timerControler.text).then((_){
                    Navigator.pop(context);
                  });
                },
              ),
            ),
          ],
        ),
      );
                  
  
  }

  
 
}
