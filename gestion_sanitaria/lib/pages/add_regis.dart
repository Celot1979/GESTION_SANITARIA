import 'package:flutter/material.dart';
import 'package:gestion_sanitaria/pages/home_page.dart';
import 'package:gestion_sanitaria/servicies/firebase_servicie.dart';
import 'package:gestion_sanitaria/widgets/custom_textfield.dart';
import 'package:gestion_sanitaria/widgets/custom_app_bar.dart';
//import 'package:gestion_sanitaria/widgets/custom_button.dart';

class AddRegistro extends StatefulWidget {
  const AddRegistro({super.key});
  
  @override
  State<AddRegistro> createState() => _AddRegistroState();
}

class _AddRegistroState extends State<AddRegistro> {
  final List<TextEditingController> _controllers = List.generate(4, (_) => TextEditingController());
  final List<String> _hints = ["add name", "add lastname", "add mobile phone number", "add email address"];
  final List<IconData> _icons = [Icons.person_outline, Icons.person_outline, Icons.phone, Icons.email];
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
    if (index == 0) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeRead()));
    } else if (index == 1) {
      addRegistro(_controllers[0].text, _controllers[1].text, _controllers[2].text, _controllers[3].text).then((_) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeRead()));
      });
    } else {
      Navigator.pushNamed(context, "/");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "HEALTH MANAGEMENT",
        subtitle: "Add Employee",
        imageUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
        linkUrl: 'https://i.ibb.co/PTrTqYz/AppBar.png',
        titleStyle: TextStyle(fontSize: 24),
        subtitleStyle: TextStyle(fontSize: 16),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 80),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: List.generate(4, (index) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: CustomTextField(
              controller: _controllers[index],
              hintText: _hints[index],
              prefixIcon: _icons[index],
              keyboardType: index == 2 ? TextInputType.phone : TextInputType.text,
              onTap: () {},
            ),
          )),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'LIST'),
          BottomNavigationBarItem(icon: Icon(Icons.save), label: 'SAVE'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'HOME'),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.blue,
        selectedItemColor: const Color.fromARGB(255, 187, 208, 218),
        unselectedItemColor: Colors.white,
      ),
    );
  }
}
