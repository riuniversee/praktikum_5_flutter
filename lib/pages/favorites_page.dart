import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<CourseProvider>();
    
    // Memfilter mata kuliah yang masuk dalam daftar favorit
    final favoriteCourses = provider.courses
        .where((course) => provider.favoriteCodes.contains(course.code))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mata Kuliah Favorit'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: favoriteCourses.isEmpty
          ? const Center(
              child: Text(
                'Belum ada mata kuliah favorit.',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
            )
          : ListView.builder(
              itemCount: favoriteCourses.length,
              itemBuilder: (context, index) {
                final course = favoriteCourses[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo.shade50,
                      child: Text(
                        // Menggunakan operator panjang string biasa agar aman tanpa min()
                        course.code.length >= 4 ? course.code.substring(0, 4) : course.code,
                        style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    title: Text(course.title, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${course.credits} SKS • Dosen: ${course.status}'),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, color: Colors.grey),
                      onPressed: () {
                        // Menghapus dari favorit via Provider
                        provider.toggleFavorite(course.code);
                      },
                    ),
                  ),
                );
              },
            ),
    );
  }
}