import 'package:flutter/material.dart';
import 'profile_screen.dart';

class CreateProfileScreen extends StatefulWidget {
  const CreateProfileScreen({super.key});

  @override
  CreateProfileScreenState createState() => CreateProfileScreenState();
}

class CreateProfileScreenState extends State<CreateProfileScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController occupationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Crear Perfil"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: "Nombre"),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: "Edad"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: occupationController,
              decoration: const InputDecoration(labelText: "Ocupación"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isEmpty ||
                    ageController.text.isEmpty ||
                    occupationController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Todos los campos son obligatorios")),
                  );
                } else {
                  String age = ageController.text;
                  if (int.tryParse(age) == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("La edad debe ser un número válido")),
                    );
                  } else {
                    String name = nameController.text;
                    String occupation = occupationController.text;

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfileScreen(
                          name: name,
                          age: age,
                          occupation: occupation,
                        ),
                      ),
                    );
                  }
                }
              },
              child: const Text("Guardar y Ver Perfil"),
            ),
          ],
        ),
      ),
    );
  }
}
