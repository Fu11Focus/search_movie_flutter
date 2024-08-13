import 'package:realm/realm.dart'; // import realm package

part 'data.realm.dart'; // declare a part file.

@RealmModel()
class _MovieDB {
  late String title, year, movieID, poster, type;

  bool isFavorite(id) {
    var realm = Realm(Configuration.local([MovieDB.schema]));
    return realm.query<MovieDB>(r"movieID == $0", [id]).isNotEmpty;
  }
}
