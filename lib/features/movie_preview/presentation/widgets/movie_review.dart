import 'package:flutter/material.dart';

class MovieReview extends StatelessWidget {
  final String review;
  const MovieReview(this.review, { Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Our Review',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 24,
            letterSpacing: 1.5
          ),
        ),
        SizedBox(height: 16,),
        Text(
          '$review',
          textAlign: TextAlign.start,
          style: TextStyle(
            color: Colors.black87,
            fontWeight: FontWeight.w400,
            fontSize: 16,
            height: 1.2
          ),
        ),
      ],
    );
  }
}