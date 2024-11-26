import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/Pacient/pacient_update.dart';

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
              hintText: "add Medication Time (YYYY-MM-DD HH:MM)",
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
                          await addpacientP(
                            roomControler.text,
                            full_nameControler.text,
                            pathologyControler.text,
                            timeControler.text,
                            name_medicationControler.text,
                          );
                           roomControler.clear();
                           full_nameControler.clear();
                           pathologyControler.clear();
                           timeControler.clear();
                           name_medicationControler.clear();

                          
                        },
                        
                      ),
                    ),
                    SizedBox(
                      width: 150, // Estableciendo el ancho del botón
                      child: CustomButton(
                        text: "Update information pacient",
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const PacientUpdate()), 
                            /* Lo hemos dejado aquí:
                            1º Crear un nuevo archivo que se llame update_paciente.dart
                            2º Cambiamos el nombre de la clase que llama dentro del Navigaitor.plus.
                            3º En el nuevo archivo - update_paciente.dart - tenemos que copiar y pegar el archivo
                            que tenemos de modificar registros. 
                            4º Crearemos las instrucciones en el archivo de firebase_servicie_pacient oportunas para
                            que ejecuten las ordenes pertinentes. */
                          );
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 300),
                  FloatingActionButton(
                    onPressed: () async{
                      await Navigator.pushNamed(context, '/login');
                      },
                      child: const Icon(Icons.map, color: Colors.blue),
                        )
                      ],
                ),
            ],
            
            
          ),
          
        ),
        
      ),
      
      
    );
  }
}
