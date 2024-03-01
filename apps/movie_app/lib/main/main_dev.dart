import 'package:movie_app/main/flavor.dart';
import 'package:movie_app/main/main.dart';

void main() {
  var flavor = Flavor(
    appTitle: "Movie App Dev",
    baseUrl: "https://api.themoviedb.org/3/",
  );
  mainCommon(flavor);
}
