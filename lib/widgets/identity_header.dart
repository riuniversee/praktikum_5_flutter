import 'package:flutter/material.dart';

class IdentityHeaderCard extends StatelessWidget {
  final String studentId;
  final String studentName;

  const IdentityHeaderCard({
    super.key,
    required this.studentId,
    required this.studentName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.indigo.shade50,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.indigo.shade200),
      ),
      child: Row(
        children: [
          const Icon(Icons.school, color: Colors.indigo),
          const SizedBox(width: 10),
          Text(
            '$studentId - $studentName',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}