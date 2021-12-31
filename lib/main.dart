import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContohDynamicAppBar(),
        Widget imageSection = Container(
    child: Image.asset('assets/unsur.jpg'),
    );
      Widget titleSection = Container(
    padding: EdgeInsets.only(top: 16),
        child: Text(
        'Universitas Suryakancana Cianjur',
        textAlign: TextAlign.center,
        style: TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        ),
        ),
        );

        Widget descriptionSection = Container(
        padding: EdgeInsets.all(16),
        child: const Text(
        'Universitas Suryakancana Cianjur adalah salah satu perguruan tinggi swasta yang berada di kota cianjur jawa barat '
        'unsur mempunyai beberapa fakultas antara lain : fakultas hukum, fakultas keguruan dan ilmu pendidikan, fakultas teknik'
        ',fakultas ekonomi bisnis islam dan fakultas sains terapan '
        'Penguasaan dan pengembangan informasi di abad sekarang menuntut pelaksanaan'
        'pendidikan secara disiplin waktu dan konsisten. Universitas Suryakancana Cianjur (UNSUR)'
        'mempunyai cita-cita menjadi universitas terdepan dan unggul dari segi pengajaran, penelitian,'
        'dan pengabdian pada masyarakat Secara geografis, Posisi UNSUR terletak di dalam satu area luas dengan gedung yang berbeda'
        'sesuai dengan fakultas masing-masing Atmosfer kampus yang dikelilingi oleh hutan kota'
        'menjadikan UNSUR tempat yang nyaman dan asri untuk belajar',
        textAlign: TextAlign.justify,
        )
        );
        Widget rateSection = Row(
        children: <Widget>[
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.star),
        ],
        );

        Widget reviewSection = Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
        rateSection,
        Text('170 Reviews'),
        ],
        );

        Widget menuSection = Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
        _buildMenuSection(
        Icons.account_balance_wallet,
        "Payment",
        "Sangat Murah",
        ),
        _buildMenuSection(
        Icons.account_balance,
        "Kampus",
        "sejuk",
        ),
        _buildMenuSection(
        Icons.add_call,
        "Telephone",
        "0856-4747-8888",
        ),
        ],
        );
    );

  }
}


class ContohDynamicAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200),
              pinned: true,
            ),




          ],
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      overflow: Overflow.visible,
      children: [
        Image(
          image: AssetImage('assets/ft.jpg'),
          fit: BoxFit.cover,
        ),
        Center(
          child: Opacity(
            opacity: shrinkOffset / expandedHeight,
            child: Text(
              "BabyMetal di BelajarFlutter",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 20,
              ),
            ),
          ),
        ),
       ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
