import 'package:go_router/go_router.dart';
import 'package:material_ui/material_ui.dart';

import 'data.dart';
import 'gambar_destinasi.dart';

class HalamanDetail extends StatelessWidget {
  const HalamanDetail({super.key, required this.destinasi});

  final Destinasi? destinasi; // null bila ID di URL tidak dikenal

  @override
  Widget build(BuildContext context) {
    final d = destinasi;

    // ID tidak dikenal -> halaman "tidak ditemukan"
    if (d == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Destinasi tidak ditemukan')),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.search_off, size: 64),
              const SizedBox(height: 12),
              const Text('Destinasi yang Anda cari tidak ada.'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Kembali ke daftar'),
              ),
            ],
          ),
        ),
      );
    }

    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    final gambar = AspectRatio(
      aspectRatio: 4 / 3,
      child: GambarDestinasi(destinasi: d, ukuranIkon: 120),
    );

    final info = Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(d.nama, style: teks.headlineSmall),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.place_outlined, size: 18),
              const SizedBox(width: 4),
              Expanded(child: Text(d.kotaKabupaten, style: teks.bodyMedium)),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            'Tiket: ${d.labelHarga}',
            style: teks.titleLarge?.copyWith(color: skema.primary),
          ),
          const SizedBox(height: 16),
          Text('Tentang destinasi', style: teks.titleMedium),
          const SizedBox(height: 4),
          Text(d.deskripsi, style: teks.bodyLarge),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(d.nama, overflow: TextOverflow.ellipsis),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth >= 700) {
            // Lebar: gambar dan info berdampingan
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: gambar),
                Expanded(child: SingleChildScrollView(child: info)),
              ],
            );
          }
          // Sempit: gambar di atas, info di bawah
          return ListView(children: [gambar, info]);
        },
      ),
    );
  }
}