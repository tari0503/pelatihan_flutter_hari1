// lib/models/mata_kuliah.dart

class MataKuliah {
  final String kode;
  final String nama;
  final int sks;
  final int semester;

  const MataKuliah({
    required this.kode,
    required this.nama,
    required this.sks,
    required this.semester,
  });
}
