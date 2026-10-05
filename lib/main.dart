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
      home: const Tahap1Page(),
    );
  }
}

class Tahap1Page extends StatefulWidget {
  const Tahap1Page({super.key});

  @override
  State<Tahap1Page> createState() => _Tahap1PageState();
}

class _Tahap1PageState extends State<Tahap1Page> {
  // Flag untuk mendemonstrasikan ukuran Hard-Coded (500px) vs Fleksibel (Adaptive)
  bool isHardCoded = true;

  // Identitas Mahasiswa
  final String studentName = 'Kadek Ripa Adi Putra';
  final String studentId = '2455011011';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 1: Responsive Problem'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
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

            // Tombol Switcher Mode
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isHardCoded = !isHardCoded;
                  });
                },
                icon: Icon(isHardCoded ? Icons.warning_amber : Icons.check_circle),
                label: Text(
                  isHardCoded
                      ? 'Mode: Hard-coded Width (500px)'
                      : 'Mode: Flexible (double.infinity)',
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: isHardCoded ? Colors.red.shade100 : Colors.green.shade100,
                  foregroundColor: isHardCoded ? Colors.red.shade900 : Colors.green.shade900,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Kotak Pengujian Ukuran
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: isHardCoded ? 500 : MediaQuery.of(context).size.width - 32,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: isHardCoded ? Colors.red.shade100 : Colors.green.shade100,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: isHardCoded ? Colors.red : Colors.green,
                    width: 2,
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isHardCoded
                          ? '⚠️ Hard-coded Width (500px)'
                          : '✅ Flexible / Adaptive Width',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: isHardCoded ? Colors.red.shade900 : Colors.green.shade900,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      isHardCoded
                          ? 'Ukuran 500px melebihi lebar rata-rata layar HP (360px-412px).\n'
                            'Elemen ini terpotong di tepi kanan jika tidak bisa di-scroll.'
                          : 'Ukuran elemen menyesuaikan dengan lebar layar HP yang tersedia secara proporsional.',
                      style: TextStyle(
                        color: isHardCoded ? Colors.red.shade800 : Colors.green.shade800,
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