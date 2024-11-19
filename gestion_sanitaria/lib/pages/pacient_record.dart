import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie_pacient.dart';
import 'package:gestion_sanitaria/servicies/login.dart';
import 'package:gestion_sanitaria/widgets/custom_textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
import 'package:gestion_sanitaria/widgets/custom_button.dart';




class PacientRecord extends StatelessWidget {
  const PacientRecord({super.key});
  
  get firebaseService => null;

  @override
  Widget build(BuildContext context) {
     TextEditingController roomControler = TextEditingController(text: " ");
     TextEditingController full_nameControler = TextEditingController(text: " ");
     TextEditingController pathologyControler = TextEditingController(text: " ");
     TextEditingController timeControler = TextEditingController(text: " ");
     TextEditingController name_medicationControler = TextEditingController(text: " ");

    // Se elimina la instancia de FirebaseServicePacient debido a que no está definida

   

    return Scaffold(
      appBar: CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "WELCOME  ${UserVerification.userName}".toUpperCase(),  
        imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', 
        linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              CustomTextField(
              controller: roomControler,
              hintText: "add room number",
              prefixIcon: Icons.room_outlined,
              keyboardType: TextInputType.name,
              onTap: () {}, // Agregado el argumento requerido
            ),
              const SizedBox(height: 20),
              CustomTextField(
              controller: full_nameControler,
              hintText: "add full name",
              prefixIcon: Icons.person_outline,
              keyboardType: TextInputType.name,
              onTap: () {}, // Agregado el argumento requerido
            ),
              const SizedBox(height: 20),
              CustomTextField(
              controller: pathologyControler,
              hintText: "add Pathology",
              prefixIcon: Icons.health_and_safety,
              keyboardType: TextInputType.name,
              onTap: () {}, // Agregado el argumento requerido
            ),
            const SizedBox(height: 20),
              CustomTextField(
              controller: name_medicationControler,
              hintText: "add name medication",
              prefixIcon: Icons.health_and_safety,
              keyboardType: TextInputType.name,
              onTap: () {}, // Agregado el argumento requerido
            ),
              const SizedBox(height: 20),
              CustomTextField(
              controller: timeControler,
              hintText: "add Medication Time",
              prefixIcon: Icons.timelapse_sharp,
              keyboardType: TextInputType.datetime,
              onTap: () {}, // Agregado el argumento requerido
            ),
            
              const SizedBox(height: 20),
              // Agregando los botones en un contenedor
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 150, // Estableciendo el ancho del botón
                      child: CustomButton(
                        text: "Add Pacient",
                        onPressed: () async {
                          await addRegistroP(
                            roomControler.text,
                            full_nameControler.text,
                            pathologyControler.text,
                            timeControler.text,
                            name_medicationControler.text,
                          ); //
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150, // Estableciendo el ancho del botón
                      child: CustomButton(
                        text: "Update information pacient",
                        onPressed: () {
                          // Lógica para actualizar información del paciente
                        },
                      ),
                    ),
                    SizedBox(
                      width: 150, // Estableciendo el ancho del botón
                      child: CustomButton(
                        text: "Delete pacient",
                        onPressed: () {
                          // Lógica para eliminar paciente
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
          ),
          
        ),
      ),
    );
  }
}
