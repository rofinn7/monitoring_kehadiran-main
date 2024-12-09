import 'package:flutter/material.dart';
import 'package:monitoring_kehadiran/providers/Kehadiran.dart';
import 'package:provider/provider.dart';

class History extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final attendanceHistory =
        Provider.of<KehadiranProviders>(context).historyKehadiran;

    return Scaffold(
      appBar: AppBar(title: Text('Riwayat Kehadiran')),
      body: attendanceHistory.isEmpty
          ? Center(child: Text('Belum ada riwayat kehadiran.'))
          : ListView.builder(
              itemCount: attendanceHistory.length,
              itemBuilder: (context, index) {
                final record = attendanceHistory[index];
                return ListTile(
                  title: Text(
                    'Tanggal: ${record['date'].toString().split(' ')[0]}',
                  ),
                  subtitle: Text(
                    'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}',
                  ),
                );
              },
            ),
    );
  }
}
