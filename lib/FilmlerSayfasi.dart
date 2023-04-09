import 'package:film_uygulamasi/FilmDetayi.dart';
import 'package:film_uygulamasi/Filmler.dart';
import 'package:film_uygulamasi/Filmlerdao.dart';
import 'package:film_uygulamasi/Kategoriler.dart';
import 'package:film_uygulamasi/Yonetmenler.dart';
import 'package:film_uygulamasi/imdbler.dart';
import 'package:flutter/material.dart';



class FilmlerSayfasi extends StatefulWidget {

  late Kategoriler kategori;

  FilmlerSayfasi({required this.kategori});

  @override
  State<FilmlerSayfasi> createState() => _FilmlerSayfasiState();
}

class _FilmlerSayfasiState extends State<FilmlerSayfasi> {

  Future<List<Filmler>> filmleriGoster(int kategori_id) async{
    var filmlerListesi = await Filmlerdao().tumFilmlerByKategoriId(kategori_id);
    return filmlerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Filmler: ${widget.kategori.kategori_ad}"),
      ),
      body: FutureBuilder<List<Filmler>>(
        future: filmleriGoster(widget.kategori.kategori_id),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var filmlerListesi = snapshot.data;
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              childAspectRatio: 2 / 3.5,
              ),
              itemCount: filmlerListesi!.length,
              itemBuilder: (context,indeks){
                var film = filmlerListesi[indeks];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FilmDetayi(film: film,)));
                  },
                  child: Card(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset("resimler/${film.film_resim}"),
                      ),
                        Text(film.film_ad,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                      ],
                    ),
                  ),
                );
              },
            );
          }else{
            return Center();
          }
        },

      ),

    );
  }
}
