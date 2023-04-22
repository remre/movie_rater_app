// import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';


class Movie {
  final String title;
  final String description;
  late  double rating;
  var year;
  // final double rDirecting;
  // final double rProductDesign;
  // final double rSound;
  // final double rColor;
  // final double rEditing;
  // final double rStory;




  Movie({
    required this.title,
    required this.description,
    required this.rating,
    required this.year,


  });


}
class MovieData extends ChangeNotifier {
  List<Movie> _movies = [
    Movie(title: 'First movie', description: 'asdasd', rating: 5.0,year: 1995),
    Movie(title: 'Second milk', description: 'asdasd', rating: 5.0,year: 1995),
    Movie(title: 'Anan movie', description: 'asda', rating: 3.0,year: 1995),
  ];
  UnmodifiableListView<Movie> get movies {
    return UnmodifiableListView(_movies);
  }

  int get movieCount {
    return _movies.length;
  }

  void addMovie(String newMovieTitle, String description, double rating, int year)  {
    final movie = Movie(title: newMovieTitle, description: description, rating: rating, year: year);
    _movies.add(movie);
    notifyListeners();
  }



  void deleteMovie(Movie movies) {
    _movies.remove(movies);
    notifyListeners();
  }
}
