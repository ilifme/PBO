import 'mahasiswa.dart';
import 'mata_kuliah.dart';
import 'krs.dart';
import 'nilai.dart';

class SistemAkademik {
  List<Mahasiswa> mahasiswaList = [];
  List<MataKuliah> mataKuliahList = [];
  List<KRS> krsList = [];
  List<Nilai> nilaiList = [];

  void tambahMahasiswa(Mahasiswa mahasiswa) {
    mahasiswaList.add(mahasiswa);
  }

  void tambahMataKuliah(MataKuliah mataKuliah) {
    mataKuliahList.add(mataKuliah);
  }

  KRS buatKRS(Mahasiswa mahasiswa, List<MataKuliah> mataKuliah) {
    var krs = KRS(mahasiswa, mataKuliah);
    krsList.add(krs);
    return krs;
  }

  void inputNilai(Mahasiswa mahasiswa, MataKuliah mataKuliah, double nilai) {
    var nilaiBaru = Nilai(mataKuliah, nilai);
    nilaiList.add(nilaiBaru);
  }

  double hitungIPK(Mahasiswa mahasiswa) {
    double totalNilai = 0;
    double totalSks = 0;
    for (var nilai in nilaiList) {
      if (nilai.mataKuliah.sks > 0) {
        totalNilai += nilai.nilai * nilai.mataKuliah.sks;
        totalSks += nilai.mataKuliah.sks;
      }
    }
    return totalSks > 0 ? totalNilai / totalSks : 0.0;
  }

  void tampilkanTranskrip(Mahasiswa mahasiswa) {
    print('Transkrip Nilai Mahasiswa:');
    print('NIM: ${mahasiswa.nim}');
    print('Nama: ${mahasiswa.nama}');
    for (var nilai in nilaiList) {
      if (nilai.mataKuliah.sks > 0) {
        print('${nilai.mataKuliah.nama}: ${nilai.nilai}');
      }
    }
  }
}
