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
      home: const MainShellPage(),
    );
  }
}

// -----------------------------------------------------------------------------
// MAIN SHELL PAGE (Menampung NavigationBar & Managing Selected Index)
// -----------------------------------------------------------------------------
class MainShellPage extends StatefulWidget {
  const MainShellPage({super.key});

  @override
  State<MainShellPage> createState() => _MainShellPageState();
}

class _MainShellPageState extends State<MainShellPage> {
  int _currentIndex = 0;

  // Identitas Mahasiswa (Wajib)
  final String studentName = 'Kadek Ripa Adi Putra';
  final String studentId = '2455011011';

  @override
  Widget build(BuildContext context) {
    // Daftar Halaman Destinasi
    final List<Widget> pages = [
      _buildHomePage(),
      _buildCoursesPage(),
      _buildProfilePage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tahap 10: NavigationBar'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
            const SizedBox(height: 16),

            // Konten Halaman Sesuai Index
            Expanded(child: pages[_currentIndex]),
          ],
        ),
      ),
      // TAHAP 10: Material 3 NavigationBar
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.school_outlined),
            selectedIcon: Icon(Icons.school),
            label: 'Courses',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outlined),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  // Page 1: Home
  Widget _buildHomePage() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.home, size: 48, color: Colors.blue),
            SizedBox(height: 12),
            Text(
              'Selamat Datang di Course Explorer',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Gunakan NavigationBar di bagian bawah untuk berpindah antar halaman.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Page 2: Courses
  Widget _buildCoursesPage() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Daftar Matakuliah Active',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const Divider(height: 20),
            ListTile(
              leading: const CircleAvatar(child: Text('1')),
              title: const Text('Responsive Layout'),
              subtitle: const Text('MOB04 • 3 SKS'),
            ),
            ListTile(
              leading: const CircleAvatar(child: Text('2')),
              title: const Text('Navigation & Routing'),
              subtitle: const Text('MOB05 • 3 SKS'),
            ),
          ],
        ),
      ),
    );
  }

  // Page 3: Profile
  Widget _buildProfilePage() {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: Colors.blue,
              child: Icon(Icons.person, size: 40, color: Colors.white),
            ),
            const SizedBox(height: 12),
            Text(
              studentName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            Text(
              'NIM: $studentId',
              style: TextStyle(color: Colors.grey.shade700),
            ),
          ],
        ),
      ),
    );
  }
}