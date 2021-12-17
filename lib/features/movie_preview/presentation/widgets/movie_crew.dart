import 'package:cinema_ticket/core/entities/crew.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:flutter/material.dart';

class MovieCrew extends StatelessWidget {
  final Crew crew;
  const MovieCrew({ Key key, @required this.crew }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        border: Border.all(color: Colors.grey[500]),
        borderRadius: BorderRadius.circular(8)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _crewItem('Directed By: ', '${crew.director}'),
            _crewItem('Year: ', '${crew.year}'),
            _crewItem('Duration: ', '${crew.duration}'),
            _crewItem('Distribution: ', '${crew.distribution}'),
          ],
        ),
      ),
    );
  }

  Widget _crewItem(String name, String value){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: RichText(
        text: TextSpan(
          text: '$name',
          style: TextStyle(
            fontSize: 16,
            height: 1.2,
            fontWeight: FontWeight.w800,
            color: Colors.black87
          ),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(
                fontWeight: FontWeight.w400
              )
            )
          ]
        ),
      ),
    );
  }
}