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
      home: const Tahap13Page(),
    );
  }
}

class Tahap13Page extends StatefulWidget {
  const Tahap13Page({super.key});

  @override
  State<Tahap13Page> createState() => _Tahap13PageState();
}

class _Tahap13PageState extends State<Tahap13Page> {
  // Identitas Mahasiswa (Wajib)
  final String studentName = 'Kadek Ripa Adi Putra';
  final String studentId = '2455011011';

  // Key untuk Form State & Validation
  final _formKey = GlobalKey<FormState>();

  // Controller / Field Variables
  late final TextEditingController _nameController;
  late final TextEditingController _idController;
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Pre-fill identitas default
    _nameController = TextEditingController(text: studentName);
    _idController = TextEditingController(text: studentId);
  }

  @override
  void dispose() {
    _nameController.dispose();
    _idController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    // TAHAP 13: Memanggil fungsi validate() dari FormState
    if (_formKey.currentState!.validate()) {
      // Jika validasi sukses
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Form Valid! Feedback berhasil dikirim.'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 13: Form Input & Validasi'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
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
              'Form Feedback Matakuliah',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),

            // TAHAP 13: Form dengan GlobalKey<FormState>
            Form(
              key: _formKey,
              child: Card(
                elevation: 2,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      // Field Nama
                      TextFormField(
                        controller: _nameController,
                        decoration: const InputDecoration(
                          labelText: 'Nama Lengkap',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.person_outline),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Nama wajib diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      // Field NIM
                      TextFormField(
                        controller: _idController,
                        decoration: const InputDecoration(
                          labelText: 'NIM Mahasiswa',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.badge_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'NIM wajib diisi';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      // Field Komentar / Feedback (Validasi Minimal 5 Karakter)
                      TextFormField(
                        controller: _commentController,
                        maxLines: 3,
                        decoration: const InputDecoration(
                          labelText: 'Komentar / Feedback',
                          hintText: 'Tuliskan masukan Anda...',
                          border: OutlineInputBorder(),
                          alignLabelWithHint: true,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Komentar tidak boleh kosong';
                          }
                          if (value.trim().length < 5) {
                            return 'Komentar minimal 5 karakter';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 16),

                      // Submit Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton.icon(
                          onPressed: _submitForm,
                          icon: const Icon(Icons.check_circle_outline),
                          label: const Text('Kirim & Validasi Form'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}