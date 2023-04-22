import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:provider/provider.dart';
import 'movie.dart';


class AddMovie extends StatefulWidget {
  const AddMovie({Key? key}) : super(key: key);

  @override
  State<AddMovie> createState() => _AddMovieState();
}

class _AddMovieState extends State<AddMovie> {

  TextEditingController titlecontroller = TextEditingController();
  TextEditingController descriptioncontroller = TextEditingController();
  late  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.lightBlueAccent, fontSize: 30),
                ),
              ),
              Card(

                child: TextField(
                  decoration: InputDecoration(hintText: 'Enter the movie name'),
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
                  decoration: InputDecoration(hintText: 'Enter the movie description'),
                  controller: descriptioncontroller,
                  // autofocus: true,
                  // onChanged: (newText) {
                  //   newTasksTitle = newText;
                  // },
                  textAlign: TextAlign.center,
                ),
              ),
              SmoothStarRating(
                rating: rating,
                isReadOnly: false,
                size: 30,
                filledIconData: Icons.star,
                halfFilledIconData: Icons.star_half,
                defaultIconData: Icons.star_border,
                starCount: 5,
                allowHalfRating: true,
                spacing: 2.0,
                onRated: (value) {
                  print("rating value -> $value");
                  rating = value;
                  // print("rating value dd -> ${value.truncate()}");
                },
              ),
              TextButton(
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: TextButton.styleFrom(
                    foregroundColor: Colors.green,
                    textStyle: const TextStyle(fontSize: 20)),
                onPressed: ()  async {
                  print(titlecontroller.text + descriptioncontroller.text);
                  // print(textController.text);

                  // final task = Task(name: newTasksTitle);
                  await Provider.of<MovieData>(context, listen: false)
                      .addMovie(titlecontroller.text,descriptioncontroller.text,rating);

                  // refreshText;
                  Navigator.pop(context);
                },
              )


            ],
          ),
        )

      ],
    );
  }
}

