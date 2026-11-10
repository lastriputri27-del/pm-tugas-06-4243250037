import 'package:material_ui/material_ui.dart';

import 'data.dart';

/// Gambar placeholder (ikon + warna) dengan label kategori di atasnya.
/// Dipakai di kartu daftar dan halaman detail (memenuhi syarat Stack).
class GambarDestinasi extends StatelessWidget {
  const GambarDestinasi({
    super.key,
    required this.destinasi,
    this.ukuranIkon = 56,
    this.tampilkanLabel = true,
  });

  final Destinasi destinasi;
  final double ukuranIkon;
  final bool tampilkanLabel;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Stack(
      children: [
        Positioned.fill(
          child: ColoredBox(color: destinasi.warna.withValues(alpha: 0.15)),
        ),
        Center(
          child: Icon(destinasi.ikon, size: ukuranIkon, color: destinasi.warna),
        ),
        if (tampilkanLabel)
          Positioned(
            left: 8,
            top: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: BoxDecoration(
                color: skema.surface.withValues(alpha: 0.92),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(destinasi.kategori, style: teks.labelSmall),
            ),
          ),
      ],
    );
  }
}