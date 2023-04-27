import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:provider/provider.dart';
import 'movie.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


// User?  loggedInUser;

late User  loggedInUser;
class AddMovie extends StatefulWidget {
  static String id = '/add_movie';
  const AddMovie({Key? key}) : super(key: key);





  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {
  final _firestore  = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }



  void getCurrentUser()  async {
    try {
      final user = await _auth.currentUser!;
      if (user != null) {
        loggedInUser = user;
        // print(loggedInUser!.email);
      }
    }
    catch(e) {
      print(e);
    }
  }

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  // late  double rating = 0.0;
  late  double mSound = 0.0;
  late  double editing = 0.0;
  late  double productDesign = 0.0;
  late  double music = 0.0;
  late  double color = 0.0;
  late  double directing = 0.0;
  late  double story = 0.0;
  double ratingCalculator (directing, productDesign, mSound, music, color, editing, story) {
    double _rrating = (directing+ productDesign + mSound+ music + color  + editing +story)/ 7;
    String inString = _rrating.toStringAsFixed(2);
    return double.parse(inString);

  }
  late double rating = ratingCalculator(directing, productDesign, mSound, music, color, editing, story);

  TextEditingController yearcontroller = TextEditingController();
  void dispose() {
    // Clean up the controller when the widget is disposed.
    titlecontroller.dispose();
    descriptioncontroller.dispose();

    // year.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Flexible(
            child: Container(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                'Add Movie',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Card(
            child: TextField(
              maxLength: 100,
              decoration: InputDecoration(hintText: 'Enter the movie name', counterText: ''),
              controller: titlecontroller,
              // autofocus: true,
              // onChanged: (newText) {
              //   newTasksTitle = newText;
              // },
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            child: TextField(
              maxLines: 2,
              maxLength: 250,
              decoration: InputDecoration(hintText: 'Enter the movie description',
                counterText: '',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(vertical: 40),),
              controller: descriptioncontroller,

              // autofocus: true,
              // onChanged: (newText) {
              //   newTasksTitle = newText;
              // },
              textAlign: TextAlign.center,
            ),
          ),
          Card(
            child: TextField(
              maxLength: 4,
              controller: yearcontroller ,
              decoration: InputDecoration(labelText: "Enter the year",
                  counterText: ''),
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ], // Only numbers can be entered
            ),
          ),
          // SmoothStarRating(
          //   rating: rating,
          //   isReadOnly: false,
          //   size: 30,
          //   filledIconData: Icons.star,
          //   halfFilledIconData: Icons.star_half,
          //   defaultIconData: Icons.star_border,
          //   starCount: 5,
          //   allowHalfRating: true,
          //   spacing: 2.0,
          //   onRated: (value) {
          //     print("rating value -> $value");
          //     rating = value;
          //     // print("rating value dd -> ${value.truncate()}");
          //   },
          // ),
          SingleChildScrollView(
            child: Center(
              child: Column(
                children:<Widget>[
                  Text('Rate The movie!'),
                  // MovieStars(),
                  Text('editing'),
                  MovieStars(editing),
                  Text('directing'),
                  MovieStars(directing),
                  Text('productDesign'),
                  MovieStars(productDesign),
                  Text('story'),
                  MovieStars(story),
                  Text('music'),
                  MovieStars(music),
                  Text('color'),
                  MovieStars(color),
                  Text('mSound'),
                  MovieStars(mSound),

                ]

              ),
            ),
          ),
          TextButton(
            child: Text(
              'Add',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            style: TextButton.styleFrom(
                foregroundColor: Colors.green,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: ()   {
              print(titlecontroller.text + descriptioncontroller.text + yearcontroller.text);
              // print(textController.text);
              _firestore.collection('movies').add({
                'description' : descriptioncontroller.text,
                'title' : titlecontroller.text,
                'rating' : rating,
                'mSound' : mSound,
                'productDesing' : productDesign,
                'editing' : editing,
                'directing' : directing,
                'music' : music,
                'color' : color,
                'story' : story,
                'user' : loggedInUser.email,
                'year' : int.parse(yearcontroller.text),
              });

              // final task = Task(name: newTasksTitle);
               Provider.of<MovieData>(context, listen: false)
                  .addMovie(titlecontroller.text,descriptioncontroller.text,int.parse(yearcontroller.text),mSound,editing,productDesign,  music, color, directing, story,rating);

              // refreshText;
              Navigator.pop(context);
            },
          )


        ],
      ),
    );
  }
}

class MovieStars extends StatelessWidget {
  late double star;
  MovieStars(this.star);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RatingBar(
      initialRating: 0,
      minRating: 0,
      maxRating: 5,
      allowHalfRating: true,
      itemSize: 35.0,
      ratingWidget: RatingWidget(
        full: const Icon(Icons.star, color: Colors.blueAccent),
        half: const Icon(Icons.star_half, color: Colors.blueAccent),
        empty: const Icon(Icons.star_border, color: Colors.blueAccent),
      ),
      onRatingUpdate: (value) {
        // Rating is updated
        print('rating update to: $value');
        star = value;

      },
              ),
    );
  }
}
