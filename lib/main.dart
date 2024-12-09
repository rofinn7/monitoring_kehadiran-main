import 'package:flutter/material.dart';
import 'package:monitoring_kehadiran/pages/history.dart';
import 'package:monitoring_kehadiran/pages/home.dart';
import 'package:monitoring_kehadiran/providers/Kehadiran.dart';
import 'package:provider/provider.dart';

void main() { //1 
  runApp(
    ChangeNotifierProvider(
      create: (_) => KehadiranProviders(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget { //1
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyBottomNavigation(),
    );
  }
}

class MyBottomNavigation extends StatefulWidget { //2
  @override
  _MyBottomNavigationState createState() => _MyBottomNavigationState();
}

class _MyBottomNavigationState extends State<MyBottomNavigation> {
  int _currentIndex = 0;
  final _pages = [Home(), History()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Monitoring Kehadiran'),
        centerTitle: true,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.edit),
            label: 'Pencatatan',
            activeIcon: Icon(Icons.edit, color: Colors.blue),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Riwayat',
            activeIcon: Icon(Icons.history, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
