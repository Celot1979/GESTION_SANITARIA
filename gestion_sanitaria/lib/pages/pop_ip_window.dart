import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Añadir esta importación

class PopupHabitacion extends StatelessWidget {
  final double coordX;
  final String numeroHabitacion;

  const PopupHabitacion({
    super.key,
    required this.coordX,
    required this.numeroHabitacion,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: coordX,
          top: 50,
          child: Material(
            color: Colors.transparent,
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('pacient')
                  .where('room', isEqualTo: numeroHabitacion)
                  .limit(1)
                  .snapshots(),
              builder: (context, snapshot) {
                
                if (snapshot.hasError) {
                  return const Text('Error al cargar datos');
                }

                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }

                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Text('Habitación $numeroHabitacion: Sin paciente'),
                  );
                }

                var pacientData =
                    snapshot.data!.docs.first.data() as Map<String, dynamic>;
                 if (snapshot.hasData) {
                  pacientData = snapshot.data!.docs.first.data() as Map<String, dynamic>;
                  // ... mostrar información del paciente
                } else {
                  // Mostrar indicador de carga mientras se esperan datos
                  return const CircularProgressIndicator();
                }

                return Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Habitación: $numeroHabitacion',
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text('Paciente: ${pacientData['fullname']}'),
                      Text('Patología: ${pacientData['pathology']}'),
                      Text('Medicación: ${pacientData['medication']}'),
                      Text('Horario: ${pacientData['time']}'),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}