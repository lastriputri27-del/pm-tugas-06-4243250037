import 'package:material_ui/material_ui.dart';

/// Model data satu destinasi wisata.
class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.kotaKabupaten,
    required this.kategori,
    required this.deskripsi,
    required this.harga,
    required this.ikon,
    required this.warna,
  });

  final int id;
  final String nama;
  final String kotaKabupaten;
  final String kategori;
  final String deskripsi;
  final int harga; // 0 = gratis
  final IconData ikon;
  final Color warna;

  String get labelHarga => harga == 0 ? 'Gratis' : harga.rupiah;
}

// CATATAN: harga tiket hanya contoh. Silakan sesuaikan dengan data terbaru.
const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba',
    kotaKabupaten: 'Kab. Samosir',
    kategori: 'Alam',
    deskripsi:
        'Danau vulkanik terbesar di Asia Tenggara dengan Pulau Samosir di '
        'tengahnya. Cocok untuk menikmati panorama, berenang, dan mengenal '
        'budaya Batak.',
    harga: 10000,
    ikon: Icons.water,
    warna: Color(0xFF0277BD),
  ),
  Destinasi(
    id: 2,
    nama: 'Bukit Lawang',
    kotaKabupaten: 'Kab. Langkat',
    kategori: 'Alam',
    deskripsi:
        'Gerbang Taman Nasional Gunung Leuser, terkenal sebagai tempat '
        'melihat orangutan sumatera di habitat aslinya dan wisata tubing '
        'di Sungai Bahorok.',
    harga: 20000,
    ikon: Icons.forest,
    warna: Color(0xFF2E7D32),
  ),
  Destinasi(
    id: 3,
    nama: 'Berastagi',
    kotaKabupaten: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Kota dataran tinggi berhawa sejuk dengan pemandangan Gunung '
        'Sibayak dan Sinabung, serta pasar buah dan sayur segar.',
    harga: 15000,
    ikon: Icons.terrain,
    warna: Color(0xFFEF6C00),
  ),
  Destinasi(
    id: 4,
    nama: 'Istana Maimun',
    kotaKabupaten: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Istana Kesultanan Deli yang dibangun tahun 1888 dengan perpaduan '
        'arsitektur Melayu, Islam, dan Eropa.',
    harga: 5000,
    ikon: Icons.account_balance,
    warna: Color(0xFFF9A825),
  ),
  Destinasi(
    id: 5,
    nama: 'Air Terjun Sipiso-piso',
    kotaKabupaten: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Air terjun setinggi sekitar 120 meter yang jatuh ke arah Danau '
        'Toba, dengan titik pandang yang mudah dijangkau.',
    harga: 10000,
    ikon: Icons.waterfall_chart,
    warna: Color(0xFF00838F),
  ),
  Destinasi(
    id: 6,
    nama: 'Masjid Raya Al-Mashun',
    kotaKabupaten: 'Kota Medan',
    kategori: 'Religi',
    deskripsi:
        'Masjid bersejarah peninggalan Kesultanan Deli dengan kubah '
        'berwarna hitam dan interior bergaya Timur Tengah serta India.',
    harga: 0,
    ikon: Icons.mosque,
    warna: Color(0xFF5E35B1),
  ),
  Destinasi(
    id: 7,
    nama: 'Tangkahan',
    kotaKabupaten: 'Kab. Langkat',
    kategori: 'Alam',
    deskripsi:
        'Desa wisata di tepi hutan Leuser dengan pertemuan dua sungai, '
        'pemandian air panas alami, dan wisata gajah.',
    harga: 25000,
    ikon: Icons.nature_people,
    warna: Color(0xFF558B2F),
  ),
  Destinasi(
    id: 8,
    nama: 'Rumah Tjong A Fie',
    kotaKabupaten: 'Kota Medan',
    kategori: 'Budaya',
    deskripsi:
        'Rumah kediaman saudagar Tionghoa terkemuka Medan yang kini '
        'menjadi museum dengan perabot dan arsitektur khas peranakan.',
    harga: 35000,
    ikon: Icons.museum,
    warna: Color(0xFFC62828),
  ),
];

/// Mengembalikan null bila ID tidak ada, sehingga halaman detail bisa
/// menampilkan "tidak ditemukan".
Destinasi? cariDestinasi(int id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}

extension Rupiah on int {
  String get rupiah {
    final pola = RegExp(r'\B(?=(\d{3})+(?!\d))');
    return 'Rp${toString().replaceAllMapped(pola, (m) => '.')}';
  }
}