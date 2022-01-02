import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  //inisial untuk menampung data dari page sebelum nya
  final String? nama;
  final String? deskripsi;
  final String? image;
  const DetailScreen({Key? key, this.nama, this.deskripsi, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.yellow,
        title: Text('Detail Jurusan $nama'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: width * 0.5,
                height: height * 0.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage(image.toString()), fit: BoxFit.fill)),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                nama!,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                deskripsi!,
                textAlign: TextAlign.justify,
              )
            ],
          ),
        )),
      ),
      //menampilkan widget yang berada pada bagian bawah layar seperti ratingrate dan review
      bottomSheet: Container(
        color: Colors.transparent,
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
