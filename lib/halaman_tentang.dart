import 'package:material_ui/material_ui.dart';

class HalamanTentang extends StatelessWidget {
  const HalamanTentang({super.key});

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang Aplikasi')),
      body: ListView(
        children: [
          SizedBox(
            height: 180,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(color: skema.primaryContainer),
                ),
                Positioned(
                  right: -20,
                  bottom: -24,
                  child: Icon(
                    Icons.landscape,
                    size: 160,
                    color: skema.primary.withValues(alpha: 0.2),
                  ),
                ),
                Positioned(
                  left: 20,
                  bottom: 20,
                  child: Text(
                    'Wisata Sumatera Utara',
                    style: teks.headlineSmall,
                  ),
                ),
              ],
            ),
          ),
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('Panduan wisata Sumatera Utara'),
            subtitle: Text('Tugas Rutin 6 - Pemrograman Mobile'),
          ),
          const ListTile(
            leading: Icon(Icons.school_outlined),
            title: Text('Universitas Negeri Medan'),
            subtitle: Text('Program Studi Ilmu Komputer'),
          ),
          const ListTile(
            leading: Icon(Icons.phone_android),
            title: Text('Dibangun dengan Flutter'),
            subtitle: Text('Layout responsif dan navigasi go_router'),
          ),
        ],
      ),
    );
  }
}