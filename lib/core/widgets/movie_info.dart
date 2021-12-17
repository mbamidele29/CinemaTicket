import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/widgets/star_ratings.dart';
import 'package:cinema_ticket/features/dashboard/presentation/widgets/tag.dart';
import 'package:flutter/material.dart';

class MovieInfo extends StatefulWidget {
  final Movie movie;
  const MovieInfo(this.movie, { Key key }) : super(key: key);

  @override
  _MovieInfoState createState() => _MovieInfoState();
}

class _MovieInfoState extends State<MovieInfo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.movie.title,
          maxLines: 2,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 20,
            letterSpacing: 1.5
          ),
        ),
        SizedBox(height: 6,),
        StartRatings(
          widget.movie.rating, 
          (int rating){
            double value=rating*1.0;
            if(widget.movie.rating==rating || widget.movie.rating<rating-0.5)value-=0.5;
            widget.movie.rating=value;
            setState(() {});
          }
        ),
        SizedBox(height: 6,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.movie.tags.map<Tag>((tag) => Tag(tag: tag)).toList()
          ),
        ),
      ],
    );
  }
}