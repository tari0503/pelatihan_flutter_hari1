import 'package:flutter/material.dart';
import 'package:krs_simulator/providers/krs_providers.dart';
import 'package:provider/provider.dart';

class DaftarMatkulSection extends StatelessWidget {
  const DaftarMatkulSection({super.key});
//hdaood
  @override
  Widget build(BuildContext context) {
    // Menggunakan context.watch agar widget merender ulang saat notifyListeners() dipanggil
    final provider = context.watch<KrsProvider>(); 

    return ListView.builder(
      itemCount: provider.daftarMatkulTersedia.length,
      itemBuilder: (context, index) {
        final matkul = provider.daftarMatkulTersedia[index];
        final sudahDiambil = provider.apakahSudahDiambil(matkul.kode);

        return Card(
          margin: const EdgeInsets.symmetric(vertical: 6),
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
              child: Text(
                'Sms\n${matkul.semester}', 
                style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold), 
                textAlign: TextAlign.center,
              ),
            ),
            title: Text(matkul.nama, style: const TextStyle(fontWeight: FontWeight.bold)),
            subtitle: Text('${matkul.kode}  •  ${matkul.sks} SKS'),
            trailing: sudahDiambil
                ? IconButton(
                    icon: const Icon(Icons.remove_circle, color: Colors.red),
                    onPressed: () => provider.hapusMatkul(matkul.kode),
                  )
                : IconButton(
                    icon: const Icon(Icons.add_circle, color: Colors.green),
                    onPressed: () => provider.tambahMatkul(matkul, context),
                  ),
          ),
        );
      },
    );
  }
}
