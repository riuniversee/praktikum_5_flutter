import 'package:flutter/material.dart';
import '../widgets/identity_header.dart';

class HomePage extends StatelessWidget {
  final String studentId;
  final String studentName;

  const HomePage({
    super.key,
    required this.studentId,
    required this.studentName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        IdentityHeaderCard(studentId: studentId, studentName: studentName),
        const SizedBox(height: 16),
        Expanded(
          child: Card(
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.dashboard_customize, size: 60, color: Colors.indigo),
                  SizedBox(height: 16),
                  Text(
                    'Selamat Datang di Course Explorer',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Aplikasi antarmuka Flutter adaptif dengan navigasi multi-screen, form feedback, dan manajemen interaksi.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}