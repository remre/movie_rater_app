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
                movieyear: movie.year,
                // checkboxCallback: (bool checkboxState) {
                //   // MovieData.updateTask((movie));
                // },
                // longCallBack: () {
                //   movieData.deleteMovie(movie);
                // }
                );
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
  var movieyear;
  // final Function checkboxCallback;
  // final VoidCallback longCallBack;

  MovieTile(
      {required this.moviedescription,
        required this.movierating,
        required this.movietitle,
        required this.movieyear,
        // required this.checkboxCallback,
        // required this.longCallBack
      });

  // void checkboxCallback(checkBoxState) {
  //   setState(() {
  //     isChecked = checkBoxState;
  //   },);

  // ValueChanged<bool?>? checkboxCallback;
  @override
  Widget build(BuildContext context) {
    return Container(
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
          Text('$movieyear',
            style: TextStyle(
              fontSize: 20,
            ),),
        ],
      ),
    );
  }
}

class MovieScreenList extends StatelessWidget {
  const MovieScreenList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20),
            child: Text('Movie List'),),
          // MoviesList(),
        ],
      ),
    );
  }
}
