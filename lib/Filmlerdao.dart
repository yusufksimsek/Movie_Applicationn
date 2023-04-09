import 'package:film_uygulamasi/Filmler.dart';
import 'package:film_uygulamasi/Kategoriler.dart';
import 'package:film_uygulamasi/Yonetmenler.dart';
import 'package:film_uygulamasi/imdbler.dart';
import 'VeritabaniYardimcisi.dart';
import 'package:sqflite/sqflite.dart';

class Filmlerdao{

  Future<List<Filmler>> tumFilmlerByKategoriId(int kategori_id) async{

    var db = await VeritabaniYardimcisi.VeritabaniErisim();

    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM filmler,kategoriler,yonetmenler,imdbler "
        "WHERE filmler.kategori_id=kategoriler.kategori_id and "
        "filmler.yonetmen_id = yonetmenler.yonetmen_id and "
        "filmler.imdb_id = imdbler.imdb_id and "
        "filmler.kategori_id=$kategori_id");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      
      var k = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var y = Yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);
      var imd = imdbler(satir["imdb_id"], satir["imdb_puan"]);


      var f = Filmler(satir["film_id"], satir["film_ad"], satir["film_yil"], satir["film_resim"], k, y,imd);
      
      return f;
    });

  }


}

/*


*/