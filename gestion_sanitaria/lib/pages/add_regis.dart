import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/home_page.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie.dart';
import 'package:gestion_sanitaria/widgets/custom_textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
import 'package:gestion_sanitaria/widgets/custom_button.dart';

class AddRegistro extends StatefulWidget {
  const AddRegistro({
    super.key,
  });
  @override
  State<AddRegistro> createState() => _add_RegistroState();
}

// ignore: camel_case_types
class _add_RegistroState extends State<AddRegistro> {
  //Controladores para guardar la info de los registros
  TextEditingController nameControler = TextEditingController(text: " ");
  TextEditingController lastControler = TextEditingController(text: " ");
  TextEditingController movilControler = TextEditingController(text: " ");
  TextEditingController emailControler = TextEditingController(text: " ");

  int _selectedIndex = 0; // Índice para el BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const HomeRead()),
      );
    } else if (index == 1) {
      Navigator.pushNamed(context, "/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: const CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "Add Employee", imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png', linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
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
              onTap: () {}, // Agregado el argumento requerido
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: lastControler,
              hintText: "add lastaname",
              prefixIcon: Icons.person_outline,
              keyboardType: TextInputType.name,
              onTap: () {}, // Agregado el argumento requerido
              // Agregado para resolver el error
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: movilControler,
              hintText: "add mobile phone number ",
              prefixIcon: Icons.phone,
              keyboardType: TextInputType.phone,
              onTap: () {}, // Agregado el argumento requerido
              // Agregado para resolver el error
            ),
            const SizedBox(height: 16),
            CustomTextField(
              controller: emailControler,
              hintText: "add email address",
              prefixIcon: Icons.email,
              keyboardType: TextInputType.emailAddress,
              onTap: () {}, // Agregado el argumento requerido
            ),
            const SizedBox(
              width: 30,
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 80),
              child: CustomButton(
                text: "SAVE",
                height: 50, // Cambiado a un valor más estándar
                textStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold), // Tamaño de fuente reducido
                textColor: Colors.white,
                buttonColor: Colors.blue,
                borderRadius: 10,
                margin: const EdgeInsets.only(left: 8),
                onPressed: () async {
                  await addRegistro(nameControler.text, lastControler.text,
                          movilControler.text, emailControler.text)
                      .then((_) {
                    // Navegar a la página edit_page.dart después de agregar el registro
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const HomeRead()), // Asegúrate de importar EditPage
                    );
                  });
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white, // Color de fondo del contenedor
          border: Border(
            top: BorderSide(
              color: Colors.grey, // Color del borde
              width: 4.0, // Grosor del borde
            ),
          ),
        ),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'LIST',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'HOME',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: Colors.blue, // Color del ítem seleccionado
          unselectedItemColor: Colors.blue, // Color del ítem no seleccionado
        ),
      ),
    );
  }
}
