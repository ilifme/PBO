import 'mahasiswa.dart';
import 'mata_kuliah.dart';

class KRS {
  Mahasiswa mahasiswa;
  List<MataKuliah> daftarMataKuliah;

  KRS(this.mahasiswa, this.daftarMataKuliah);

  void tampilkanKRS() {
    print('Kartu Rencana Studi (KRS) Mahasiswa:');
    print('NIM: ${mahasiswa.nim}');
    print('Nama: ${mahasiswa.nama}');
    print('Semester: ${mahasiswa.semester}');
    print('Mata Kuliah yang diambil:');
    for (var mk in daftarMataKuliah) {
      print('- ${mk.nama} (${mk.sks} SKS)');
    }
  }
}
