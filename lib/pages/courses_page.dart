import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/identity_header.dart';
import 'course_detail_page.dart';
import '../models/course.dart'; // Tambahkan baris ini di atas


class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final courseProvider = context.watch<CourseProvider>();
    
    // Jika masih dalam proses loading, tampilkan indikator loading
    if (courseProvider.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    // Jika terjadi error, tampilkan pesan error
    if (courseProvider.error != null) {
      return Center(child: Text('Error: ${courseProvider.error}'));
    }

    final courses = courseProvider.courses;
    final favoriteCodes = courseProvider.favoriteCodes;

    const studentId = '2455011011';
    const studentName = 'Kadek Ripa Adi Putra';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const IdentityHeaderCard(studentId: studentId, studentName: studentName),
        const SizedBox(height: 16),
        
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            'Total Favorit Aktif: ${favoriteCodes.length}',
            style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.indigo),
          ),
        ),

        Expanded(
          child: ListView.builder(
            itemCount: courses.length,
            itemBuilder: (context, index) {
              final course = courses[index]; // Ini sekarang adalah objek bertipe Course
              final isFav = favoriteCodes.contains(course.code);
              
              return Card(
                margin: const EdgeInsets.only(bottom: 12),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.indigo.shade100,
                    child: Text(
                      course.code,
                      style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo),
                    ),
                  ),
                  title: Text(course.title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(
                      '${course.credits} SKS • Status: ${course.status}'),
                  trailing: IconButton(
                    icon: Icon(
                      isFav ? Icons.favorite : Icons.favorite_border,
                      color: isFav ? Colors.red : Colors.grey,
                    ),
                    onPressed: () {
                      context.read<CourseProvider>().toggleFavorite(course.code);
                    },
                  ),
                  onTap: () => _openDetail(context, course, studentId, studentName),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _openDetail(BuildContext context, Course course, String studentId, String studentName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CourseDetailPage(
          course: course,
          studentId: studentId,
          studentName: studentName,
        ),
      ),
    );
  }
}