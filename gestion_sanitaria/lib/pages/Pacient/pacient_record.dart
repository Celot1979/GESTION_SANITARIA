import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/Pacient/pacient_update.dart';

import 'package:gestion_sanitaria/servicies/firebase_servicie_pacient.dart';
import 'package:gestion_sanitaria/servicies/login.dart';
import 'package:gestion_sanitaria/widgets/custom_textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
//import 'package:gestion_sanitaria/widgets/custom_button.dart';




class PacientRecord extends StatelessWidget {
  const PacientRecord({super.key});
  
  get firebaseService => null;

  // Método para inicializar los controladores
  List<TextEditingController> _initializeControllers() {
    return [
      TextEditingController(text: " "),
      TextEditingController(text: " "),
      TextEditingController(text: " "),
      TextEditingController(text: " "),
      TextEditingController(text: " "),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final controllers = _initializeControllers();

    return Scaffold(
      appBar: CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "WELCOME  ${UserVerification.userName}".toUpperCase(),  
        imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', 
        linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
        titleStyle: const TextStyle(fontSize: 24),
        subtitleStyle: const TextStyle(fontSize: 16),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          child: Column(
            children: [
              ..._buildTextFields(controllers),
              const SizedBox(height: 20),
              // Aquí puedes agregar los botones si es necesario
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context, controllers),
    );
  }

  List<Widget> _buildTextFields(List<TextEditingController> controllers) {
    final hints = [
      "add room number",
      "add full name",
      "add Pathology",
      "add name medication",
      "add Medication Time (YYYY-MM-DD HH:MM)"
    ];
    final icons = [
      Icons.room_outlined,
      Icons.person_outline,
      Icons.health_and_safety,
      Icons.health_and_safety,
      Icons.timelapse_sharp
    ];

    return List.generate(hints.length, (index) {
      return Column(
        children: [
          CustomTextField(
            controller: controllers[index],
            hintText: hints[index],
            prefixIcon: icons[index],
            keyboardType: index == 4 ? TextInputType.datetime : TextInputType.name,
            onTap: () {},
          ),
          const SizedBox(height: 20),
        ],
      );
    });
  }

  BottomNavigationBar _buildBottomNavigationBar(BuildContext context, List<TextEditingController> controllers) {
    return BottomNavigationBar(
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.lightBlueAccent,
      unselectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.person_add, color: Colors.white),
          label: 'ADD PACIENT',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.update, color: Colors.white),
          label: 'UPDATE INFORMATION',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.map, color: Colors.white),
          label: 'Map',
        ),
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            addpacientP(
              controllers[0].text,
              controllers[1].text,
              controllers[2].text,
              controllers[3].text,
              controllers[4].text,
            );
            for (var controller in controllers) {
              controller.clear();
            }
            break;
          case 1:
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const PacientUpdate()),
            );
            break;
          case 2:
            Navigator.pushNamed(context, '/login');
            break;
        }
      },
    );
  }
}
