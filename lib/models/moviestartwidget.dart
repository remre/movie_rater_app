import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MovieStars extends StatelessWidget {
  late double star;
  MovieStars(this.star, {super.key});

  @override
  Widget build(BuildContext context) {
    return RatingBar(
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
    );
  }
}