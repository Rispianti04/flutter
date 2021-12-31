import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jurusan/model/model_unsur.dart';
import 'package:jurusan/teknik.dart';
import 'package:jurusan/unsur.dart';

class Mainscreen extends StatefulWidget {
  const Mainscreen({Key? key}) : super(key: key);

  @override
  _MainscreenState createState() => _MainscreenState();
}

class _MainscreenState extends State<Mainscreen>
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
              child: TabBarView(
                  controller: controller,
                  children: const <Widget>[UnsurScreen(), TeknikScreen()]),
            )
          ],
        ),
      ),
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
