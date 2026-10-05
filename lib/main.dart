import 'package:flutter/material.dart';

void main() {
  runApp(const CourseExplorerApp());
}

class CourseExplorerApp extends StatelessWidget {
  const CourseExplorerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Course Explorer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const Tahap2Page(),
    );
  }
}

class Tahap2Page extends StatelessWidget {
  const Tahap2Page({super.key});

  // Identitas Mahasiswa
  final String studentName = 'Kadek Ripa Adi Putra';
  final String studentId = '2455011011';

  @override
  Widget build(BuildContext context) {
    // TAHAP 2: Membaca informasi layar menggunakan MediaQuery
    final mediaQuery = MediaQuery.of(context);
    final size = mediaQuery.size;
    final orientation = mediaQuery.orientation;
    final isCompact = size.width < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 2: MediaQuery Information'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Identitas Mahasiswa
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Row(
                children: [
                  const Icon(Icons.person, color: Colors.blue),
                  const SizedBox(width: 8),
                  Text(
                    '$studentId - $studentName',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Card Informasi MediaQuery
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(Icons.aspect_ratio, color: Colors.blue),
                        SizedBox(width: 8),
                        Text(
                          'Informasi Layar Real-time (MediaQuery)',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Divider(height: 24),
                    ListTile(
                      leading: const Icon(Icons.swap_horiz),
                      title: const Text('Lebar Layar (Width)'),
                      trailing: Text(
                        '${size.width.toStringAsFixed(1)} px',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: const Icon(Icons.swap_vert),
                      title: const Text('Tinggi Layar (Height)'),
                      trailing: Text(
                        '${size.height.toStringAsFixed(1)} px',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    ListTile(
                      leading: Icon(
                        orientation == Orientation.portrait
                            ? Icons.stay_current_portrait
                            : Icons.stay_current_landscape,
                      ),
                      title: const Text('Orientasi Layar'),
                      trailing: Text(
                        orientation.name.toUpperCase(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Status Breakpoint Sederhana
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: isCompact ? Colors.orange.shade100 : Colors.green.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isCompact ? Icons.phone_android : Icons.tablet_mac,
                            color: isCompact ? Colors.orange.shade900 : Colors.green.shade900,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Kategori Breakpoint: ${isCompact ? "Compact (<600px)" : "Wide (>=600px)"}',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: isCompact ? Colors.orange.shade900 : Colors.green.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}