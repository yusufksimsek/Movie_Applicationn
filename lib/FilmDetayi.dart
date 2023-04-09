import 'package:film_uygulamasi/Filmler.dart';
import 'package:film_uygulamasi/Filmlerdao.dart';
import 'package:film_uygulamasi/imdbler.dart';
import 'package:flutter/material.dart';
import 'VeritabaniYardimcisi.dart';



class FilmDetayi extends StatefulWidget {
  late Filmler film;
  FilmDetayi({required this.film});

  @override
  State<FilmDetayi> createState() => _FilmDetayiState();
}

class _FilmDetayiState extends State<FilmDetayi> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.film.film_ad),
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 100.0),
        child: Column(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                              SizedBox(
                                child: Image.asset("resimler/${widget.film.film_resim}"),
                              ),
                                SizedBox(
                                  height: 400,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(widget.film.film_yil.toString(),style: TextStyle(fontSize: 22),),
                                      Text("IMDB: ${widget.film.imdb.imdb_puan.toString()}",style: TextStyle(fontSize: 22),),
                                      Text(widget.film.yonetmen.yonetmen_ad,style: TextStyle(fontSize: 22),),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                ),
                TextButton(onPressed: () {
                  print("Film favorilere eklendi");
                },
                  child: Text("Favorilere Ekle",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
                  style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.deepPurple)),
                ),
              ],
        ),
      ),
    );
  }
}



