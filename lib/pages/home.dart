import 'package:flutter/material.dart';
import 'package:monitoring_kehadiran/providers/Kehadiran.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final kehadiranProvider = Provider.of<KehadiranProviders>(context);
    final students = kehadiranProvider.students;

    return Scaffold(
      appBar: AppBar(
        title: Text('Pencatatan Kehadiran'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(students[index].name),
            trailing: Checkbox(
              value: students[index].isPresent,
              onChanged: (_) => kehadiranProvider.toggleKehadiran(index),
            ),
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            onPressed: students.isEmpty
                ? null
                : () {
                    kehadiranProvider.saveKehadiran();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Kehadiran disimpan!')),
                    );
                  },
            child: Text('Simpan Kehadiran')),
      ),
    );
  }
}
