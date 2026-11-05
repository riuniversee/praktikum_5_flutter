import 'package:flutter/material.dart';
import '../models/course.dart'; // Pastikan model di-import

class CourseDetailPage extends StatelessWidget {
  final Course course; // Harus bertipe Course, bukan Map
  final String studentId;
  final String studentName;

  const CourseDetailPage({
    super.key,
    required this.course,
    required this.studentId,
    required this.studentName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(course.title), // Menggunakan course.title
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kode Mata Kuliah: ${course.code}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('SKS: ${course.credits}'),
            const SizedBox(height: 8),
            Text('Status: ${course.status}'),
            const Divider(height: 32),
            Text('Mahasiswa: $studentName ($studentId)'),
          ],
        ),
      ),
    );
  }
}