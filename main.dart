import 'dart:io';
import '../lib/mahasiswa.dart';
import '../lib/mata_kuliah.dart';
import '../lib/sistem_akademik.dart';

void main() {
  var sistem = SistemAkademik();

  // Input data mahasiswa
  print("Masukkan nama mahasiswa:");
  String nama = stdin.readLineSync()!;

  print("Masukkan NIM mahasiswa:");
  String nim = stdin.readLineSync()!;

  print("Masukkan semester mahasiswa:");
  int semester = int.parse(stdin.readLineSync()!);

  var mahasiswa1 = Mahasiswa(nim, nama, semester);
  sistem.tambahMahasiswa(mahasiswa1);

  // Menambahkan mata kuliah
  var mk1 = MataKuliah('CS101', 'Pemrograman Dasar', 3);
  var mk2 = MataKuliah('CS102', 'Struktur Data', 3);
  sistem.tambahMataKuliah(mk1);
  sistem.tambahMataKuliah(mk2);

  // Membuat KRS
  var krs1 = sistem.buatKRS(mahasiswa1, [mk1, mk2]);
  krs1.tampilkanKRS();

  // Input nilai mahasiswa
  print('Masukkan nilai untuk ${mk1.nama}:');
  double nilai1 = double.parse(stdin.readLineSync()!);
  sistem.inputNilai(mahasiswa1, mk1, nilai1);

  print('Masukkan nilai untuk ${mk2.nama}:');
  double nilai2 = double.parse(stdin.readLineSync()!);
  sistem.inputNilai(mahasiswa1, mk2, nilai2);

  // Menampilkan hasil
  print('\n--- Transkrip Nilai ---');
  sistem.tampilkanTranskrip(mahasiswa1);

  double ipk = sistem.hitungIPK(mahasiswa1);
  print('\nIPK Mahasiswa ${mahasiswa1.nama}: $ipk');
}
