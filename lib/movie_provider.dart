import 'package:flutter/foundation.dart';

import 'movie.dart';

class MovieProvider with ChangeNotifier {
  List<Movie> _movies = [];

  List<Movie> get movies => _movies;

  void addMovie(Movie movie) {
    _movies.add(movie);
    notifyListeners();
  }
}
