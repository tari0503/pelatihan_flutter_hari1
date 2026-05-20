import 'package:flutter/material.dart';
import 'package:krs_simulator/views/widgets/daftar_matkul_section.dart';
import 'package:krs_simulator/views/widgets/ringkasan_krs_section.dart';

class KrsPage extends StatelessWidget {
  const KrsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simulasi Pengisian KRS', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const RingkasanKrsSection(),
            const SizedBox(height: 20),
            const Text(
              'Daftar Mata Kuliah Tersedia:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Expanded(
              child: DaftarMatkulSection(),
            ),
          ],
        ),
      ),
    );
  }
}
