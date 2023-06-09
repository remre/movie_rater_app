import 'package:chatgpt_movierater_app/screens/moviescreen.dart';
import 'package:chatgpt_movierater_app/screens/updatescreen.dart';
import 'screens/registerscreen.dart';
import 'screens/loginscreen.dart';
import 'screens/welcomescreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/add_movie.dart';
import 'models/movie.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      // ChangeNotifierProvider(
      //   create: (context) => MovieData(),

        // child:
    MaterialApp(
          theme: ThemeData( fontFamily: 'Aachen',),
            initialRoute: '/',
            routes: {
              '/add_movie': (context) => AddMovie(),
              '/update_movie' : (context) => UpdateMovie(),
              '/movie': (context) => MovieScreen(),
              '/login': (context) =>  LoginScreen(),
              '/registration' : (context) =>  RegistrationScreen(),
              '/': (context) =>  WelcomeScreen(),
            },

          debugShowCheckedModeBanner: false,
          // theme: ThemeData().copyWith(
          //     textButtonTheme: TextButtonThemeData(
          //         style: ButtonStyle(
          //             foregroundColor: MaterialStateProperty.resolveWith(
          //                     (state) => Colors.orange)))),
          //   home: WelcomeScreen()
        );
      // );

  }
}
