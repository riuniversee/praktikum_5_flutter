import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import '../widgets/identity_header.dart';
import 'course_detail_page.dart';

class CoursesPage extends StatelessWidget {
  const CoursesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Mengambil data dan method dari CourseProvider
    final courseProvider = context.watch<CourseProvider>();
    final courses = courseProvider.courses;
    final favoriteCodes = courseProvider.favoriteCodes;

    // Ambil data identitas statis sementara atau dari parent jika ada
    const studentId = '2455011011';
    const studentName = 'Kadek Ripa Adi Putra';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const IdentityHeaderCard(studentId: studentId, studentName: studentName),
        const SizedBox(height: 16),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isGrid = constraints.maxWidth >= 600;

              if (isGrid) {
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.2,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                  ),
                  itemCount: courses.length,
                  itemBuilder: (context, index) {
                    final course = courses[index];
                    final isFav = favoriteCodes.contains(course['code']);
                    return Card(
                      child: InkWell(
                        onTap: () => _openDetail(context, course, studentId, studentName),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(course['code'],
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.indigo)),
                                  IconButton(
                                    icon: Icon(
                                      isFav ? Icons.favorite : Icons.favorite_border,
                                      color: isFav ? Colors.red : Colors.grey,
                                    ),
                                    onPressed: () => courseProvider.toggleFavorite(course['code']),
                                  ),
                                ],
                              ),
                              Text(course['title'],
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 15)),
                              const SizedBox(height: 4),
                              Text(
                                '${course['credits']} SKS • ${course['instructor']}',
                                style: const TextStyle(
                                    fontSize: 12, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              }

              return ListView.builder(
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final course = courses[index];
                  final isFav = favoriteCodes.contains(course['code']);
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo.shade100,
                        child: Text(
                          course['code'],
                          style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Colors.indigo),
                        ),
                      ),
                      title: Text(course['title'],
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                      subtitle: Text(
                          '${course['credits']} SKS • Dosen: ${course['instructor']}'),
                      trailing: IconButton(
                        icon: Icon(
                          isFav ? Icons.favorite : Icons.favorite_border,
                          color: isFav ? Colors.red : Colors.grey,
                        ),
                        onPressed: () => courseProvider.toggleFavorite(course['code']),
                      ),
                      onTap: () => _openDetail(context, course, studentId, studentName),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }

  void _openDetail(BuildContext context, Map<String, dynamic> course, String studentId, String studentName) {
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