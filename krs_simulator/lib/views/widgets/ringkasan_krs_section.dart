import 'package:flutter/material.dart';
import 'package:krs_simulator/providers/krs_providers.dart';
import 'package:provider/provider.dart';

class RingkasanKrsSection extends StatelessWidget {
  const RingkasanKrsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<KrsProvider>(
      builder: (context, provider, child) {
        final total = provider.totalSksTerpilih;
        final maks = provider.maksSks;

        return Card(
          elevation: 4,
          color: Theme.of(context).colorScheme.primaryContainer,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    const Text('Matkul Diambil', style: TextStyle(fontSize: 14)),
                    Text(
                      '${provider.krsTerpilih.length}',
                      style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(width: 1, height: 40, color: Colors.grey[400]),
                Column(
                  children: [
                    const Text('Total Beban SKS', style: TextStyle(fontSize: 14)),
                    Text(
                      '$total / $maks SKS',
                      style: TextStyle(
                        fontSize: 24, 
                        fontWeight: FontWeight.bold,
                        color: total > 20 ? Colors.orange : Colors.green[800],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}



