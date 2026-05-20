import 'package:flutter/material.dart';
import 'package:krs_simulator/models/mata_kuliah.dart';

class KrsProvider extends ChangeNotifier {
  // 1. Data master mata kuliah yang tersedia di kampus
  final List<MataKuliah> _daftarMatkulTersedia = [
    const MataKuliah(kode: 'IF101', nama: 'Pemrograman Dasar', sks: 3, semester: 1),
    const MataKuliah(kode: 'IF102', nama: 'Matematika Diskrit', sks: 3, semester: 1),
    const MataKuliah(kode: 'IF201', nama: 'Struktur Data & Algoritma', sks: 4, semester: 3),
    const MataKuliah(kode: 'IF202', nama: 'Basis Data', sks: 3, semester: 3),
    const MataKuliah(kode: 'IF301', nama: 'Pemrograman Mobile (Flutter)', sks: 4, semester: 5),
    const MataKuliah(kode: 'IF302', nama: 'Kecerdasan Buatan', sks: 3, semester: 5),
    const MataKuliah(kode: 'IF401', nama: 'Etika Profesi', sks: 2, semester: 7),
    const MataKuliah(kode: 'IF499', nama: 'Skripsi / Tugas Akhir', sks: 6, semester: 7),
  ];

  // 2. State untuk menampung matkul yang dipilih oleh mahasiswa
  final List<MataKuliah> _krsTerpilih = [];
  
  // 3. Aturan batas maksimal SKS
  final int _maksSks = 24;

  // Getters
  List<MataKuliah> get daftarMatkulTersedia => _daftarMatkulTersedia;
  List<MataKuliah> get krsTerpilih => _krsTerpilih;
  int get maksSks => _maksSks;

  // Fungsi computed untuk menghitung total SKS terkini secara dinamis
  int get totalSksTerpilih {
    return _krsTerpilih.fold(0, (total, matkul) => total + matkul.sks);
  }

  // Helper untuk mengecek status pengambilan matkul
  bool apakahSudahDiambil(String kode) {
    return _krsTerpilih.any((m) => m.kode == kode);
  }

  // FUNGSI AKSI: Menambahkan Mata Kuliah ke KRS
  bool tambahMatkul(MataKuliah matkul, BuildContext context) {
    if (apakahSudahDiambil(matkul.kode)) return false;

    // VALIDASI BISNIS: Cek jika SKS melebihi kuota maksimal
    if (totalSksTerpilih + matkul.sks > _maksSks) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Gagal! Batas pengambilan SKS adalah $_maksSks SKS.'),
          backgroundColor: Colors.red,
        ),
      );
      return false;
        }

    _krsTerpilih.add(matkul);
    notifyListeners(); // Memicu pembangunan ulang UI pada widget yang mendengarkan
    return true;
  }

  // FUNGSI AKSI: Membatalkan/Menghapus Mata Kuliah dari KRS
  void hapusMatkul(String kode) {
    _krsTerpilih.removeWhere((m) => m.kode == kode);
    notifyListeners(); // Memicu pembangunan ulang UI
  }
}
