import 'package:flutter/material.dart';
import '../widgets/identity_header.dart';
import 'course_detail_page.dart';

class CoursesPage extends StatelessWidget {
  final String studentId;
  final String studentName;
  final Set<String> favoriteCodes;
  final Function(String) onToggleFavorite;

  const CoursesPage({
    super.key,
    required this.studentId,
    required this.studentName,
    required this.favoriteCodes,
    required this.onToggleFavorite,
  });

  static const List<Map<String, dynamic>> courses = [
    {
      'code': 'MOB04',
      'title': 'Responsive Layout',
      'credits': 3,
      'instructor': 'Pak Agus',
      'desc': 'Mempelajari LayoutBuilder, MediaQuery, Expanded, dan GridView responsif.'
    },
    {
      'code': 'MOB05',
      'title': 'Navigation & Routing',
      'credits': 3,
      'instructor': 'Pak Sindu',
      'desc': 'Navigasi stack (push/pop), passing data, serta adaptive navigation.'
    },
    {
      'code': 'MOB06',
      'title': 'User Interaction',
      'credits': 2,
      'instructor': 'Pak YOTA',
      'desc': 'InkWell, GestureDetector, Button events, dan pengolahan gesture UI.'
    },
    {
      'code': 'MOB07',
      'title': 'Form & Validation',
      'credits': 3,
      'instructor': 'Bu Maria',
      'desc': 'Pembuatan form interaktif dengan TextFormField dan GlobalKey validation.'
    },
    {
      'code': 'MOB08',
      'title': 'Feedback & Dialogs',
      'credits': 2,
      'instructor': 'Pak Agus',
      'desc': 'Penerapan SnackBar, AlertDialog konfirmasi, dan progress loading.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IdentityHeaderCard(studentId: studentId, studentName: studentName),
        const SizedBox(height: 16),
        Expanded(
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isGrid = constraints.maxWidth >= 600;

              // Tampilan Grid
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
                        onTap: () => _openDetail(context, course),
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
                                    onPressed: () => onToggleFavorite(course['code']),
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

              // Tampilan List
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
                        onPressed: () => onToggleFavorite(course['code']),
                      ),
                      onTap: () => _openDetail(context, course),
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

  void _openDetail(BuildContext context, Map<String, dynamic> course) {
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