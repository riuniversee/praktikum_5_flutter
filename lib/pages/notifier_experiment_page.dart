import 'package:flutter/material.dart';

class NotifierExperimentPage extends StatelessWidget {
  const NotifierExperimentPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Membuat ValueNotifier bertipe integer dengan nilai awal 0
    final ValueNotifier<int> counterNotifier = ValueNotifier<int>(0);

    return Scaffold(
      appBar: AppBar(title: const Text('Eksperimen ValueNotifier')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contoh penggunaan ValueNotifier:'),
            const SizedBox(height: 16),
            
            // 2. Membungkus widget yang hanya ingin di-rebuild saja
            ValueListenableBuilder<int>(
              valueListenable: counterNotifier,
              builder: (context, value, child) {
                return Text(
                  'Nilai Counter: $value',
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                );
              },
            ),
            
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // 3. Mengubah nilai notifier tanpa setState() di parent
                counterNotifier.value += 1;
              },
              child: const Text('Tambah Nilai'),
            ),
          ],
        ),
      ),
    );
  }
}