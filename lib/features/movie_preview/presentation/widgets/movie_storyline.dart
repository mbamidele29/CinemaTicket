import 'package:flutter/material.dart';

class MovieStoryline extends StatelessWidget {
  final String storyline;
  const MovieStoryline(this.storyline, { Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Storyline',
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
          '$storyline',
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