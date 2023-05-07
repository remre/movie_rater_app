import 'package:chatgpt_movierater_app/models/movie_list.dart';
import 'package:chatgpt_movierater_app/screens/loginscreen.dart';
import 'registerscreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../models/add_movie.dart';
import '../models/movie.dart';
import 'package:chatgpt_movierater_app/screens/updatescreen.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';

// late User  loggedInUser;

class MovieScreen extends StatefulWidget {

  static String id = '/movie';
  @override
  State<MovieScreen> createState() => _MovieScreenState();
}

class _MovieScreenState extends State<MovieScreen> {
  final _auth = FirebaseAuth.instance;

  // void getCurrentUser()  async {
  //   try {
  //     final user =   _auth.currentUser!;
  //     if (user != null) {
  //       loggedInUser = user;
  //       print(loggedInUser!.email);
  //     }
  //   }
  //   catch(e) {
  //     print(e);
  //   }
  // }
  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // MovieScreen(this.rating,);
  final currentUser = loggedInUser.email.toString();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      // backgroundColor: Colors.orange,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/movies.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(children: <Widget>[
                Container(
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //       scale: 0.5,
                  //       image: AssetImage('images/moi.png')
                  //   ),
                  // ),
                  padding: EdgeInsets.only(
                    top: 40,
                    left: 30,
                    right: 30,
                    bottom: 30,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start ,
                    children: <Widget>[
                      Row(
                        children: [
                          Column(
                            children: [
                              Text('Welcome  \n'
                                  + currentUser
                                ,
                                style: TextStyle(
                                  backgroundColor: Colors.deepOrange,
                                  color: Colors.lightBlueAccent,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
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
                                'Movie Rater APp ',
                                style: TextStyle(
                                  backgroundColor: Colors.deepOrange,
                                  color: Colors.lightBlueAccent,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                            ],
                          )
                      ],
                      )

                    ],
                  ),
                ),
              ]),
            ),
            Expanded(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white54.withOpacity(0.85),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Text(
                  'Save the movie data with enhanced rating system regarding on the temporary critics with notes. \n'
                  'Then check your log about the movie anytime! Easy to Use just add your movie rate it and show in the list \n'
                  'Anytime you can delete or edit your list!',
                  style: TextStyle(
                    // height: 1,
                    color: Colors.deepOrange,
                    fontSize: 27,
                    // add shiny font family
                    // fontFamily: 'Aachen',

                  ),
                  textAlign: TextAlign.center,
                  // maxLines: 9,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Container(
                  width: 211,
                  height: 75,
                  // padding: EdgeInsets.only(bottom: 30, right: 20),
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
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.all(Radius.circular(9))), // extendedIc
                    label: Text(
                      'Add Movie!',
                      style: TextStyle(fontSize: 25,

                      ),
                    ),

                    backgroundColor: Colors.lightBlueAccent,
                    icon: FaIcon(
                      FontAwesomeIcons.plusMinus,
                      color: Colors.white,
                      size: 30,
                    ),
                    // Icon(Icons.add,
                    // color: Colors.lightBlueAccent,
                    // size: 50,
                    // ),
                    onPressed: () {
                      // Navigator.pushNamed(context,
                      //     UpdateMovie.id);
                      // Navigator.pushNamed(context, '/add_movie');
                      Navigator.pushNamed(context, AddMovie.id);
                    },
                  ),
                ),
                Container(
                  width: 200,
                  height: 75,

                  // padding: EdgeInsets.only(bottom: 30, left: 20),
                  child: FloatingActionButton.extended(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(
                            4))), // extendedIconLabelSpacing: 50.0,
                    elevation: 2.0,

                    heroTag: "btn2",
                    label: Text(
                      'Go to List!',
                      style: TextStyle(fontSize: 25),
                    ),
                    backgroundColor: Colors.lightBlueAccent,
                    icon: FaIcon(
                      FontAwesomeIcons.list,
                      color: Colors.white,
                      size: 30,
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
      ),
    );
  }
}
