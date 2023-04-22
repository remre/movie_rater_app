import 'package:chatgpt_movierater_app/moviescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'add_movie.dart';
import 'movie.dart';
import 'movie_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      ChangeNotifierProvider(
        create: (context) => MovieData(),
        child: MaterialApp(
          initialRoute: '/',
          routes: {'/add_movie': (context) => AddMovie()},
          debugShowCheckedModeBanner: false,
          // theme: ThemeData().copyWith(
          //     textButtonTheme: TextButtonThemeData(
          //         style: ButtonStyle(
          //             foregroundColor: MaterialStateProperty.resolveWith(
          //                     (state) => Colors.orange)))),
            home: MovieScreen()),
      );

  }
}
