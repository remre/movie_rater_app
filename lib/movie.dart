import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';


class Movie {
  final String title;
  final String description;
  late final double rating;
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


  });


}
class MovieData extends ChangeNotifier {
  List<Movie> _movies = [
    Movie(title: 'First movie', description: 'asdasd', rating: 5.0),
    Movie(title: 'Second milk', description: 'asdasd', rating: 5.0),
    Movie(title: 'Anan movie', description: 'asda', rating: 5.0),
  ];
  UnmodifiableListView<Movie> get movies {
    return UnmodifiableListView(_movies);
  }

  int get movieCount {
    return _movies.length;
  }

  void addMovie(String newMovieTitle) {
    final movie = Movie(title: newMovieTitle, description: '', rating: 5.0);
    _movies.add(movie);
    notifyListeners();
  }



  void deleteMovie(Movie movies) {
    _movies.remove(movies);
    notifyListeners();
  }
}
