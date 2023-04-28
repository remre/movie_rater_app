import 'package:chatgpt_movierater_app/movie_list.dart';
import 'package:chatgpt_movierater_app/screens/loginscreen.dart';
import 'registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../add_movie.dart';
import '../movie.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

User?  loggedInUser;

class MovieScreen extends StatefulWidget {


  static String id = '/movie';

  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {


  // MovieScreen(this.rating,);
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.orange,
      body: Column(
        children: <Widget>[
          Container(
            child: Column(children: <Widget>[
              Container(
                padding: EdgeInsets.only(
                  top: 60,
                  left: 30,
                  right: 30,
                  bottom: 30,
                ),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      child: FaIcon(
                        Icons.movie,
                        color: Colors.lightBlueAccent,
                        size: 40,
                      ),
                      backgroundColor: Colors.white,
                      radius: 45,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Movie APp',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      '${Provider.of<MovieData>(context).movieCount} number of Movie',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
          Expanded(
            child: MovieScreenList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 30, right: 20),
                child:
                    // TextButton(
                    //
                    //   child: FaIcon(FontAwesomeIcons.plusMinus,color: Colors.white,),
                    //   onPressed: () {
                    //   Navigator.push(context, MaterialPageRoute(builder: (context) => AddMovie()));
                    // },
                    //
                    // ),
                    FloatingActionButton.extended(
                  heroTag: "btn1",
                  label: Text('Add Movie!'),
                  backgroundColor: Colors.blueAccent,
                  icon: FaIcon(
                    FontAwesomeIcons.plusMinus,
                    color: Colors.white,
                  ),
                  // Icon(Icons.add,
                  // color: Colors.lightBlueAccent,
                  // size: 50,
                  // ),
                  onPressed: () {
                    // Navigator.pushNamed(context, '/add_movie');
                    Navigator.pushNamed(context,
                        AddMovie.id);
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 30, left: 20),
                child: FloatingActionButton.extended(
                  heroTag: "btn2",
                  label: Text('Movie List!'),
                  backgroundColor: Colors.blueAccent,
                  icon: FaIcon(
                    FontAwesomeIcons.list,
                    color: Colors.white,
                  ),
                  // Icon(Icons.add,
                  // color: Colors.lightBlueAccent,
                  // size: 50,
                  // ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MovieScreenList()));
                  },
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
