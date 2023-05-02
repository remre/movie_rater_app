import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'models/textformwidget.dart';
import 'models/startextwidget.dart';


// User?  loggedInUser;

late User  loggedInUser;
class UpdateMovie extends StatelessWidget {

  // static String id = '/update_movie';
  var movieItem;

  String ?  docId;
  UpdateMovie({this.movieItem, this.docId}) {
    titlecontroller = TextEditingController(text: movieItem!['title']);
    descriptioncontroller = TextEditingController(text: movieItem!['description']);
    mSound = movieItem!['mSound'];
    editing = movieItem!['editing'];
    productDesign = movieItem!['productDesign'];
    music = movieItem!['music'];
    color = movieItem!['color'];
    directing = movieItem!['directing'];
    story = movieItem!['story'];
    _reference = FirebaseFirestore.instance
        .collection('movies').doc(docId);
    // final snap = snapshot.data!.docs;



  }


  // late DocumentReference<Map<String, dynamic>> reference = FirebaseFirestore.instance
  //     .collection('movies')
  //     .doc(movieItem!['title']);


  final _formKey = GlobalKey<FormState>();

  final _firestore  = FirebaseFirestore.instance;

  final _auth = FirebaseAuth.instance;

  // @override
  final PageController pController = PageController();
  late DocumentReference _reference;

  late TextEditingController titlecontroller;
  late TextEditingController descriptioncontroller;

  late double mSound;
  late  double editing;
  late  double productDesign;
  late  double music;
  late  double color;
  late  double directing;
  late  double story;

  // late  double rating = 0.0;
  double ratingCalculator (directing, productDesign, mSound, music, color, editing, story) {
    double _rrating = (directing+ productDesign + mSound+ music + color  + editing +story)/ 7;
    String inString = _rrating.toStringAsFixed(2);
    return double.parse(inString);

  }

  // late double rating = ratingCalculator(directing, productDesign, mSound, music, color, editing, story);
  TextEditingController yearcontroller = TextEditingController();

  // @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        // controller: pController,
        children: <Widget>[
          // Flexible(   child:
          Container(
            padding: EdgeInsets.only(top: 30),
            child: Text(
              'Update Movie',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
            ),
            // ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormWiddgy(texteditingcontroller: titlecontroller,maxlength: 100,formPlaceHolder: 'Enter the movie name',countext: ''),
                // Card(
                //   child: TextFormField(
                //     validator: (value) {
                //       if ( value!.isEmpty) {
                //         return 'Please enter some text';
                //       }
                //       return null;
                //     },
                //     maxLength: 100,
                //     decoration: InputDecoration(hintText: 'Enter the movie name', counterText: ''),
                //     controller: titlecontroller,
                //     // autofocus: true,
                //     // onChanged: (newText) {
                //     //   newTasksTitle = newText;
                //     // },
                //     textAlign: TextAlign.center,
                //   ),
                // ),
                TextFormWiddgy(texteditingcontroller: descriptioncontroller,maxLines: 2,maxlength: 250,formPlaceHolder: 'Enter the movie description',),
                // TextFormWiddgy(descriptioncontroller: yearcontroller,maxlength: 4,formPlaceHolder: 'Enter the year',),
                // Card(
                //   child: TextFormField(
                //     validator: (value) {
                //       if ( value!.isEmpty) {
                //         return 'Please enter some text';
                //       }
                //       return null;
                //     },
                //     maxLength: 4,
                //     controller: yearcontroller ,
                //     decoration: InputDecoration(labelText: "Enter the year",
                //         counterText: ''),
                //     keyboardType: TextInputType.number,
                //     inputFormatters: <TextInputFormatter>[
                //       FilteringTextInputFormatter.digitsOnly
                //     ], // Only numbers can be entered
                //   ),
                // ),
              ],
            ),),
          Text(style: TextStyle(color: Colors.lightBlueAccent, fontSize: 14), 'created ' + movieItem!['cTime'].toDate().toString()),
          SizedBox(
              height:  20),

          Center(
            child: Column(
                children:<Widget>[
                  Text('Rate The movie!',
                  style: TextStyle(fontSize: 25),),
                  // MovieStars(),
                  StarTexts('Editing'),
                  // MovieStars(editing),
                  RatingBar(
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
                      editing = value;

                    },
                  ),
                  StarTexts('Directing'),
                  RatingBar(
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
                      directing = value;

                    },
                  ),
                  // MovieStars(directing),
                  StarTexts('Product Design'),
                  // MovieStars(productDesign),
                  RatingBar(
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
                      productDesign = value;

                    },
                  ),
                  StarTexts('Story'),
                  // MovieStars(story),
                  RatingBar(
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
                      story = value;

                    },
                  ),
                  StarTexts('Music'),
                  // MovieStars(music),
                  RatingBar(
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
                      music = value;

                    },
                  ),

                  StarTexts('Color'),
                  // MovieStars(color),
                  RatingBar(
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
                      color = value;

                    },
                  ),
                  StarTexts('Sound'),
                  // MovieStars(mSound),
                  RatingBar(
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
                      mSound = value;

                    },
                  ),
                ]

            ),
          ),
          SizedBox(
              height:  20),
          Updatebutton(buttontext: 'Update', formKey: _formKey, titlecontroller: titlecontroller, descriptioncontroller: descriptioncontroller, mSound: mSound, directing: directing, editing: editing, productDesign: productDesign, story: story, music: music, color: color, reference: _reference)
        ],
      ),
    );
  }
}

class Updatebutton extends StatelessWidget {
  const Updatebutton({
    super.key,
    required GlobalKey<FormState> formKey,
    required this.buttontext,
    required this.titlecontroller,
    required this.descriptioncontroller,
    required this.mSound,
    required this.directing,
    required this.editing,
    required this.productDesign,
    required this.story,
    required this.music,
    required this.color,
    required DocumentReference<Object?> reference,
  }) : _formKey = formKey, _reference = reference;

  final GlobalKey<FormState> _formKey;

  final String buttontext;

  final TextEditingController titlecontroller;
  final TextEditingController descriptioncontroller;
  final double mSound;
  final double directing;
  final double editing;
  final double productDesign;
  final double story;
  final double music;
  final double color;
  final DocumentReference<Object?> _reference;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.lightBlueAccent,
      child: TextButton(
        child: Text(
          buttontext,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        style: TextButton.styleFrom(
            textStyle: const TextStyle(fontSize: 20)),
        onPressed: ()   {
          if (_formKey.currentState!.validate() == false) {
            // If the form is valid, display a snackbar. In the real world,
            // you'd often call a server or save the information in a database.
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Processing Data')),
            );
          }
          String title = titlecontroller.text;
          String description = descriptioncontroller.text;
          print(titlecontroller.text + descriptioncontroller.text );
          Map<String,dynamic> dataToUpdate = {
            'title' : title,
            'description' : description,
            'mSound' : mSound,
            'directing' : directing,
            'editing': editing,
            'productDesign' : productDesign,
            'story' : story,
            'music':music,
            'color':color,

          };

          _reference.update(dataToUpdate);
          // print(textController.text);
          // _firestore.collection('movies').add({
          //   'description' : descriptioncontroller.text,
          //   'title' : titlecontroller.text,
            // 'rating' : rating,
            // 'mSound' : mSound,
            // 'productDesign' : productDesign,
            // 'editing' : editing,
            // 'directing' : directing,
            // 'music' : music,
            // 'color' : color,
            // 'story' : story,
            // 'user' : loggedInUser.email,
            // 'year' : int.parse(yearcontroller.text),
            // 'cTime' : cTime,
          // });

          // final task = Task(name: newTasksTitle);
          // Provider.of<MovieData>(context, listen: false)
          //     .addMovie(titlecontroller.text,descriptioncontroller.text,int.parse(yearcontroller.text),
          //   mSound,
          //   editing,
          //   productDesign,
          //   music,
          //   color, directing, story,rating,
          //   cTime,
          // );

          // refreshText;
          Navigator.pop(context);
        },
      ),
    );
  }
}








