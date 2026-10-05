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
      home: const Tahap3Page(),
    );
  }
}

class Tahap3Page extends StatelessWidget {
  const Tahap3Page({super.key});

  // Identitas Mahasiswa
  final String studentName = 'Kadek Ripa Adi Putra';
  final String studentId = '2455011011';

  // Dummy Data Daftar Matakuliah
  final List<Map<String, String>> courses = const [
    {
      'code': 'CS101',
      'title': 'Pemrograman Mobile',
      'instructor': 'Pak Agus',
      'icon': 'phone_android',
    },
    {
      'code': 'CS102',
      'title': 'Basis Data Lanjut',
      'instructor': 'Pak Sindu',
      'icon': 'storage',
    },
    {
      'code': 'CS103',
      'title': 'Pemrograman Web',
      'instructor': 'Pak YOTA',
      'icon': 'web',
    },
    {
      'code': 'CS104',
      'title': 'Kecerdasan Buatan',
      'instructor': 'Bu Maria',
      'icon': 'psychology',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 3: LayoutBuilder & Breakpoints'),
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
            const SizedBox(height: 16),

            // TAHAP 3: Menggunakan LayoutBuilder untuk menentukan layout berdasarkan maxWidth
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isCompact = constraints.maxWidth < 600;

                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Status Constraints Indikator
                      Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: isCompact
                              ? Colors.orange.shade50
                              : Colors.teal.shade50,
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: isCompact
                                ? Colors.orange.shade300
                                : Colors.teal.shade300,
                          ),
                        ),
                        child: Row(
                          children: [
                            Icon(
                              isCompact
                                  ? Icons.phone_iphone
                                  : Icons.desktop_windows,
                              color: isCompact
                                  ? Colors.orange.shade800
                                  : Colors.teal.shade800,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Max Width: ${constraints.maxWidth.toStringAsFixed(1)}px | Mode: ${isCompact ? "Compact (1 Kolom)" : "Wide (2 Kolom Grid)"}',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: isCompact
                                      ? Colors.orange.shade900
                                      : Colors.teal.shade900,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Responsive Layout
                      Expanded(
                        child: isCompact
                            ? _buildListView() // Layout 1 Kolom untuk Layar Sempit
                            : _buildGridView(), // Layout 2 Kolom untuk Layar Lebar
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Tampilan 1 Kolom (Compact Layout)
  Widget _buildListView() {
    return ListView.builder(
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          elevation: 2,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue.shade100,
              child: const Icon(Icons.book, color: Colors.blue),
            ),
            title: Text(
              course['title']!,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text('Dosen: ${course['instructor']}'),
            trailing: Chip(
              label: Text(course['code']!),
              backgroundColor: Colors.blue.shade50,
            ),
          ),
        );
      },
    );
  }

  // Tampilan 2 Kolom (Wide Layout)
  Widget _buildGridView() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemCount: courses.length,
      itemBuilder: (context, index) {
        final course = courses[index];
        return Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.teal.shade100,
                  child: const Icon(Icons.book, color: Colors.teal),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        course['title']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Dosen: ${course['instructor']}',
                        style: TextStyle(
                          color: Colors.grey.shade700,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
                Chip(
                  label: Text(
                    course['code']!,
                    style: const TextStyle(fontSize: 11),
                  ),
                  backgroundColor: Colors.teal.shade50,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}