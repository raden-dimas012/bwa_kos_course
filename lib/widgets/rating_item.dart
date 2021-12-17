// @dart=2.9
import 'package:flutter/material.dart';

class RatingItem extends StatelessWidget {
  final int index;
  final int rating;
  RatingItem({this.index,this.rating});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      index <= rating ? 'assets/images/Icon_star_solid.png' : 'assets/images/Icon_star_solid_grey.png',
      width: 20,
    );
  }
}