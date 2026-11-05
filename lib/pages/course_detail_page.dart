import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/course.dart';
import '../providers/course_provider.dart';

class CourseDetailPage extends StatelessWidget {
  final Course course;
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
    // Mendengarkan perubahan status favorit secara reaktif di halaman detail
    final isFav = context.watch<CourseProvider>().favoriteCodes.contains(course.code);

    return Scaffold(
      appBar: AppBar(
        title: Text(course.title),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(
              isFav ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
            onPressed: () {
              // Mengubah status favorit langsung dari halaman detail
              context.read<CourseProvider>().toggleFavorite(course.code);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Kode Mata Kuliah: ${course.code}', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('Jumlah SKS: ${course.credits}', style: const TextStyle(fontSize: 16)),
            const SizedBox(height: 8),
            Text('Status / Pengajar: ${course.status}', style: const TextStyle(fontSize: 16)),
            const Divider(height: 32),
            Text('Mahasiswa Pengakses: $studentName ($studentId)', style: const TextStyle(color: Colors.grey)),
          ],
        ),
      ),
    );
  }
}