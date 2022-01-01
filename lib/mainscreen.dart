import 'package:flutter/material.dart';
import 'package:jurusan/teknik.dart';
import 'package:jurusan/unsur.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen>
    with SingleTickerProviderStateMixin {
  TabController? controller;

  int current = 0;
  bool pinned = true;
  bool snap = false;
  bool floating = false;
  //list tab merupakan penamaan pada tabbar
  static const List<Tab> myTabs = <Tab>[
    Tab(text: 'Unsur'),
    Tab(text: 'Fakultas Teknik'),
  ];
  @override
  void initState() {
    //inisial untuk tabbar view dengan penambahan pada ujung kelas memakai with SingleTickerProviderStateMixin
    controller = TabController(vsync: this, length: myTabs.length);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            //image header
            SliverPersistentHeader(
              delegate: SliverHeader(), //memanggil kelas sliverheader
            ),
            //menampilkan jumlah tabbar sesuai dari list tabbar
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
            //menampilkan isi content dari tab
            SliverFillRemaining(
              child:
                  TabBarView(controller: controller, children: const <Widget>[
                //memanggil kelas unsur dari tabbar unsur sampai sebelum bottomsheet
                UnsurScreen(),
                //memanggil kelas teknik
                TeknikScreen()
              ]),
            )
          ],
        ),
      ),
      //menampilkan widget yang berada pada bagian bawah layar seperti ratingrate dan review
      //note: widget ini akan tampilkan pada kelas unsur dan teknik karna masing termasuk satu screen
      bottomSheet: Container(
        color: Colors.white,
        height: height * 0.1,
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: const <Widget>[
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star, color: Colors.yellow),
                Icon(Icons.star),
              ],
            ),
            const Text(
              '140 Riview',
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
    );
  }
}

//merupakan class untuk handle header image memakai  SliverPersistentHeader
class SliverHeader extends SliverPersistentHeaderDelegate {
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
