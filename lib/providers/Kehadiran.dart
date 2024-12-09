import 'package:flutter/material.dart';
import 'package:monitoring_kehadiran/models/Student.dart';

class KehadiranProviders with ChangeNotifier {
  final List<Student> _student = [
    Student(name: 'Rofi Nazar Amrikin'),
    Student(name: 'Ahmad Putra Firdaus'),
    Student(name: 'Muhammad Remia Hasan'),
    Student(name: 'Muhammad Musyaffa'),
    Student(name: 'Ainur Reza'),
    Student(name: 'Nofa Firdaus Ananta'),
  ];

  List<Student> get students => _student;

  final List<Map<String, dynamic>> _historyKehadiran = [];

  List<Map<String, dynamic>> get historyKehadiran => _historyKehadiran;

  void toggleKehadiran(int index) {
    _student[index].isPresent = !_student[index].isPresent;
    notifyListeners();
  }

  void saveKehadiran() {
    final presentCount = _student.where((s) => s.isPresent).length;
    final absentCount = _student.length - presentCount;

    _historyKehadiran.insert(0, {
      'date': DateTime.now(),
      'present': presentCount,
      'absent': absentCount,
      'student': _student
          .map((s) => {
                'name': s.name,
                'isPresent': s.isPresent,
              })
          .toList()
    });

    for (var student in _student) {
      student.isPresent = false;
    }
    notifyListeners();
  }
}
