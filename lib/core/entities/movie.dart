import 'package:cinema_ticket/core/entities/cast.dart';
import 'package:cinema_ticket/core/entities/show_date.dart';
import 'package:flutter/material.dart';

import 'crew.dart';

class Movie {
  int id;
  double rating;
  final Crew crew;
  final double cost;
  final bool favorite;
  final List<Cast> casts;
  final List<ShowDate> showDate;
  final List<String> tags, gallery;
  final String title, posterImage, backgroundImage, trailerUrl, storyline, review;

  Movie({@required this.id, @required this.title, @required this.storyline, @required this.review, @required this.cost, @required this.posterImage, @required this.backgroundImage, @required this.trailerUrl, @required this.tags, @required this.gallery, @required this.showDate, @required this.rating, @required this.casts, @required this.crew, this.favorite=false});

  // @override
  // List<Object> get props => [title, posterImage, backgroundImage, tags];
}