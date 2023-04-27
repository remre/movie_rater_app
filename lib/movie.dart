// import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:collection/collection.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Movie {
  final String title;
  final String description;
  var year;

  // late double rating;
  late double directing;
  late double productDesign;
  late double mSound;
  late double music;
  late double color;
  late double editing;
  late double story;

  double ratingCalculator (directing, productDesign, mSound, music, color, editing, story) {
    double _rrating = (directing+ productDesign + mSound+ music + color  + editing +story)/ 7;
    return _rrating;

  }
  late double rating = ratingCalculator(directing, productDesign, mSound, music, color, editing, story);



  Movie({
    required this.title,
    required this.description,
    required this.year,
    required this.directing,
    required this.productDesign,
    required this.mSound,
    required this.music,
    required this.color,
    required this.editing,
    required this.story,


  });


}
class MovieData extends ChangeNotifier {


  // var usersCollectionRef = db.collection('users');

  List<Movie> _movies = [
    // Movie(title: 'First movie', description: 'asdasd',year: 1995),
    // Movie(title: 'Second milk', description: 'asdasd',year: 1995),
    // Movie(title: 'Anan movie', description: 'asda',year: 1995),
  ];
  UnmodifiableListView<Movie> get movies {
    return UnmodifiableListView(_movies);
  }

  int get movieCount {
    return _movies.length;
  }

  void addMovie(String newMovieTitle, String description, int year,
      double mSound,
      double editing,
      double productDesign,
      double music,
      double color,
      double directing,
      double story,
      ) {
    final movie = Movie(title: newMovieTitle, description: description, year: year,
    mSound: mSound,
    editing: editing,
    productDesign: productDesign,
    music: music,
    color: color,
    directing: directing,
    story: story,
    // rating: rating
    );
    // _firestore.collection('movies').add({
    //   'description' : descriptioncontroller.text,
    //   'title' : titlecontroller.text,
    //   'rating' : Movie.rating,
    //   'user' : loggedInUser.email,
    //   'year' : int.parse(yearcontroller.text),
    // });
    _movies.add(movie);
    notifyListeners();
  }



  void deleteMovie(Movie movies) {
    _movies.remove(movies);
    notifyListeners();
  }
}
