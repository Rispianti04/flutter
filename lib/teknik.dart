import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:jurusan/detailteknik.dart';
import 'package:jurusan/model/model_unsur.dart';
import 'package:jurusan/model/teknik_model.dart';

class TeknikScreen extends StatefulWidget {
  const TeknikScreen({Key? key}) : super(key: key);

  @override
  _TeknikScreenState createState() => _TeknikScreenState();
}

class _TeknikScreenState extends State<TeknikScreen> {
  List<TeknikMode> listteknik = [
    //list dengan memanggil teknikmodel yang akan di tampilkan pada fakultas teknik
    TeknikMode(
      id: 0,
      namajurusan: 'informatika',
      deskripsi:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum',
      image: 'assets/ft.jpg',
    ),
    TeknikMode(
      id: 0,
      namajurusan: 'sipil',
      deskripsi: 'deskripsi sipil',
      image: 'assets/teknik.jpg',
    )
  ];
  List<Widget> imageSliders = [];
  List<Unsur> listdummy = [
    Unsur(id: 0, image: 'assets/wisuda2.jpg.600x400_q85.jpg'),
    Unsur(id: 1, image: 'assets/ft.jpg'),
    Unsur(id: 2, image: 'assets/26-4-2019 (3).jpg'),
    Unsur(id: 3, image: 'assets/teknik.jpg'),
  ];
  TabController? controller;
  int current = 0;

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
    return Padding(
      padding: const EdgeInsets.all(15.0),
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
                autoPlayAnimationDuration: const Duration(seconds: 5),
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
                margin:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: current == index ? Colors.redAccent : Colors.green,
                ),
              );
            }),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: listteknik.length,
                  itemBuilder: (context, int int) {
                    return InkWell(
                      onTap: () {
                        //navigasi dengan memparsing data
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DetailScreen(
                                      nama: listteknik[int].namajurusan,
                                      deskripsi: listteknik[int].deskripsi,
                                      image: listteknik[int].image,
                                    )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.yellow.shade100,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.all(5),
                          child: ListTile(
                            leading: Container(
                              width: width * 0.3,
                              height: height * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: AssetImage(
                                          listteknik[int].image.toString()),
                                      fit: BoxFit.fill)),
                            ),
                            title: Text(
                              listteknik[int].namajurusan.toString(),
                              style: const TextStyle(color: Colors.black),
                            ),
                            subtitle: Text(
                              listteknik[int].deskripsi.toString(),
                              maxLines: 3,
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}
