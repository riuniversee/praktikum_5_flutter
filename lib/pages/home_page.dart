import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/course_provider.dart';
import 'courses_page.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  // Daftar halaman untuk navigasi bawah
  final List<Widget> _pages = [
    const HomeDashboardView(),
    const CoursesPage(),
    const FavoritesPage(),
  ];

  @override
  void initState() {
    super.initState();
    // Memuat data course saat pertama kali dibuka
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CourseProvider>().loadCourses();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Courses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}

// Tampilan utama Dashboard Home sesuai Mockup Worksheet
class HomeDashboardView extends StatelessWidget {
  const HomeDashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    const studentId = '2455011011';
    const studentName = 'Kadek Ripa Adi Putra';

    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Explorer v2'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Kotak Identitas Mahasiswa
            Card(
              elevation: 1,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.indigo.shade50,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Icon(Icons.school, color: Colors.indigo, size: 28),
                    const SizedBox(width: 12),
                    Text(
                      '$studentId • $studentName',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),

            // 2. Kotak Ringkasan (Courses & Favorites) Berdampingan
            Row(
              children: [
                Expanded(
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Courses', style: TextStyle(color: Colors.grey, fontSize: 13)),
                          const SizedBox(height: 4),
                          Consumer<CourseProvider>(
                            builder: (context, provider, child) {
                              return Text(
                                '${provider.courses.length}',
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Card(
                    elevation: 1,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Favorites', style: TextStyle(color: Colors.grey, fontSize: 13)),
                          const SizedBox(height: 4),
                          Consumer<CourseProvider>(
                            builder: (context, provider, child) {
                              return Text(
                                '${provider.favoriteCodes.length}',
                                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.indigo),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // 3. Kartu Status Modul (Git & GitHub, Dart Fundamentals, State Management)
            _buildModuleCard('Git & GitHub', 'done', Colors.green),
            const SizedBox(height: 10),
            _buildModuleCard('Dart Fundamentals', 'done', Colors.green),
            const SizedBox(height: 10),
            _buildModuleCard('State Management', 'active', Colors.green.shade700),
          ],
        ),
      ),
    );
  }

  // Widget helper untuk membuat kartu modul materi
  Widget _buildModuleCard(String title, String status, Color statusColor) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.indigo),
            ),
            const SizedBox(height: 6),
            Text(
              status,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: statusColor),
            ),
          ],
        ),
      ),
    );
  }
}