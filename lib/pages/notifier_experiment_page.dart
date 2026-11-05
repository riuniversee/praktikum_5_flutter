import 'package:flutter/material.dart';

class NotifierExperimentPage extends StatelessWidget {
  const NotifierExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // ValueNotifier untuk menampung data reaktif sederhana
    final ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Eksperimen ValueNotifier'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Tekan tombol di bawah untuk menguji ValueNotifier:',
              style: TextStyle(fontSize: 16),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            
            // ValueListenableBuilder mendengarkan perubahan tanpa setState() di parent
            ValueListenableBuilder<int>(
              valueListenable: counterNotifier,
              builder: (context, value, child) {
                return Text(
                  'Nilai Counter: $value',
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                );
              },
            ),
            
            const SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                // Mengubah nilai secara reaktif
                counterNotifier.value += 1;
              },
              icon: const Icon(Icons.add),
              label: const Text('Tambah Nilai'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}