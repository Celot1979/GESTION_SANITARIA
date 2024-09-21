import 'package:flutter/material.dart';

class add_registro extends StatefulWidget {
  const add_registro({
    super.key,
  });
  @override
  State<add_registro> createState() => _add_registroState();
}

class _add_registroState extends State<add_registro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "ADD RECORD",
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
            hintText: "add name",
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            hintText: "add lastaname",
            prefixIcon: Icons.person_outline,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            hintText: "add mobile phone number ",
            prefixIcon: Icons.phone,
            keyboardType: TextInputType.phone,
          ),
          const SizedBox(height: 16),
          _buildTextField(
            hintText: "add email address",
            prefixIcon: Icons.email,
            keyboardType: TextInputType.emailAddress,
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text("SAVE"),
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
    );
  }
}
