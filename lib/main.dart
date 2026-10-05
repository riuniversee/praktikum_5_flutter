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
      home: const Tahap14Page(),
    );
  }
}

class Tahap14Page extends StatefulWidget {
  const Tahap14Page({super.key});

  @override
  State<Tahap14Page> createState() => _Tahap14PageState();
}

class _Tahap14PageState extends State<Tahap14Page> {
  // Identitas Mahasiswa (Wajib)
  final String studentName = 'Kadek Ripa Adi Putra';
  final String studentId = '2455011011';

  bool _isLoading = false;

  // TAHAP 14: Menampilkan AlertDialog Konfirmasi
  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Row(
            children: [
              Icon(Icons.help_outline, color: Colors.blue),
              SizedBox(width: 8),
              Text('Konfirmasi Aksi'),
            ],
          ),
          content: const Text(
            'Apakah Anda yakin ingin menyimpan dan mengirimkan feedback ini?',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(dialogContext),
              child: const Text('Batal'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Tutup dialog
                _processSubmit(); // Jalankan proses
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
              ),
              child: const Text('Ya, Kirim'),
            ),
          ],
        );
      },
    );
  }

  // Simulasi Proses Loading & SnackBar
  Future<void> _processSubmit() async {
    setState(() {
      _isLoading = true;
    });

    // Simulasi delay jaringan/proses 2 detik
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _isLoading = false;
      });

      // TAHAP 14: Menampilkan SnackBar Umpan Balik
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Row(
            children: [
              Icon(Icons.check_circle, color: Colors.white),
              SizedBox(width: 8),
              Text('Data berhasil disimpan ke sistem!'),
            ],
          ),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 14: Feedback UI'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header Identitas Mahasiswa
            Container(
              width: double.infinity,
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

            const Text(
              'Demo Dialog, Loading, & SnackBar:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            Card(
              elevation: 2,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'Tekan tombol di bawah untuk memicu AlertDialog konfirmasi, lalu mengamati animasi loading dan SnackBar umpan balik:',
                      style: TextStyle(fontSize: 13),
                    ),
                    const SizedBox(height: 20),

                    // Indikator Loading / Tombol Aksi
                    _isLoading
                        ? Column(
                            children: const [
                              CircularProgressIndicator(),
                              SizedBox(height: 12),
                              Text(
                                'Memproses data...',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          )
                        : SizedBox(
                            width: double.infinity,
                            child: ElevatedButton.icon(
                              onPressed: _showConfirmationDialog,
                              icon: const Icon(Icons.send),
                              label: const Text('Simpan Data & Kirim Feedback'),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
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