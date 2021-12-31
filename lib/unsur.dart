import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jurusan/model/model_unsur.dart';

class UnsurScreen extends StatefulWidget {
  const UnsurScreen({Key? key}) : super(key: key);

  @override
  _UnsurScreenState createState() => _UnsurScreenState();
}

class _UnsurScreenState extends State<UnsurScreen>
    with SingleTickerProviderStateMixin {
  List<Widget> imageSliders = [];
  List<Unsur> listdummy = [
    Unsur(id: 0, image: 'assets/wisuda2.jpg.600x400_q85.jpg'),
    Unsur(id: 1, image: 'assets/ft.jpg'),
    Unsur(id: 2, image: 'assets/26-4-2019 (3).jpg'),
    Unsur(id: 3, image: 'assets/teknik.jpg'),
  ];
  TabController? controller;
  int current = 0;
  bool pinned = true;
  bool snap = false;
  bool floating = false;
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Unsur'),
    Tab(text: 'Fakultas Teknik'),
  ];
  @override
  void initState() {
    controller = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  List<T> dot<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    imageSliders = listdummy
        .map(
          (item) => Container(
            width: width,
            height: height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: AssetImage(item.image.toString()),
                    fit: BoxFit.fill)),
          ),
        )
        .toList();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // ignore: prefer_const_constructors
            SliverPersistentHeader(
              delegate: Delegate(Colors.black, '_title'),
            ),
            SliverAppBar(
                backgroundColor: Colors.white,
                floating: true,
                pinned: pinned,
                snap: snap,
                title: Container(
                  padding: const EdgeInsets.all(10),
                  child: TabBar(
                    indicatorColor: Colors.black,
                    labelColor: Colors.black,
                    labelStyle: const TextStyle(
                      color: Colors.yellow,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                    controller: controller,
                    tabs: myTabs,
                  ),
                )),
            SliverFillRemaining(
              child: TabBarView(controller: controller, children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CarouselSlider(
                        items: imageSliders,
                        options: CarouselOptions(
                            initialPage: 0,
                            height: height * 0.2,
                            enlargeCenterPage: true,
                            autoPlay: true,
                            aspectRatio: 16 / 9,
                            autoPlayCurve: Curves.fastOutSlowIn,
                            enableInfiniteScroll: true,
                            autoPlayAnimationDuration:
                                const Duration(seconds: 5),
                            viewportFraction: 1.0,
                            onPageChanged: (index, reason) {
                              current = index;
                              setState(() {});
                            }),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: dot<Widget>(imageSliders, (index, url) {
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 2.0),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: current == index
                                  ? Colors.redAccent
                                  : Colors.green,
                            ),
                          );
                        }),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
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
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
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
                    ],
                  ),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}

class Delegate extends SliverPersistentHeaderDelegate {
  final Color backgroundColor;
  final String _title;

  Delegate(this.backgroundColor, this._title);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      width: width,
      height: height * 0.3,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/ft.jpg'), fit: BoxFit.fill)),
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
