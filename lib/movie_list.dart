import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'movie.dart';

class MoviesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<MovieData>(
      builder: (context, movieData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final movie = movieData.movies[index];
            return MovieTile(
                movietitle: movie.title,
                moviedescription: movie.description,
                movierating: movie.rating,
                checkboxCallback: (bool checkboxState) {
                  // MovieData.updateTask((movie));
                },
                longCallBack: () {
                  movieData.deleteMovie(movie);
                });
          },
          itemCount: movieData.movieCount,
        );
      },
    );
  }
}

class MovieTile extends StatelessWidget {
  final String movietitle;
  final String moviedescription;
  final double movierating;
  final Function checkboxCallback;
  final VoidCallback longCallBack;

  MovieTile(
      {required this.moviedescription,
        required this.movierating,
        required this.movietitle,
        required this.checkboxCallback,
        required this.longCallBack});

  // void checkboxCallback(checkBoxState) {
  //   setState(() {
  //     isChecked = checkBoxState;
  //   },);

  // ValueChanged<bool?>? checkboxCallback;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20),
          child: Text('Movie List'),),

        Container(
          child: Row(
            children: <Widget>[

              Text(movietitle,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text(moviedescription,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Text('$movierating',
                style: TextStyle(
                  fontSize: 20,
                ),),
            ],
          ),
        ),
      ]
    );
  }
}