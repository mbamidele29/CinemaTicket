import 'package:cinema_ticket/core/entities/cast.dart';
import 'package:cinema_ticket/core/entities/crew.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/entities/show_date.dart';
import 'package:cinema_ticket/core/values/keys.dart';
import 'package:flutter/material.dart';
import 'package:tmdb_easy/easyTMDB.dart' as easy;

easy.EasyTMDB easyTMDB = easy.EasyTMDB(MOVIE_API_KEY);

Future<List<Movie>> getMovies() async {
  List<Movie> movies=[];
  easy.MoviePopular response=await easyTMDB.movie().popular();
  
    response.results.forEach((element) {
    movies.add(Movie
        (
          id: element.id,
          title: element.title, 
          storyline: element.overview, 
          review: element.overview, 
          cost: element.voteCount * 1.0, 
          posterImage: element.posterPath, 
          backgroundImage: element.backdropPath, 
          trailerUrl: '', 
          tags: [], 
          gallery: [], 
          showDate: [], 
          rating: double.parse(element.voteAverage.toString()), 
          casts: [], 
          crew: Crew.initial()
        )
      );
    });
  return movies;
}

Future<Movie> getMovie(int movieId) async{
  easy.MovieDetails details = await easyTMDB.movie().details(movieId);
  easy.MovieCredits credits = await easyTMDB.movie().credits(movieId);
  easy.MovieCreditsCrew director= credits.crew.firstWhere((element) => element.job=='Director');

  TimeOfDay now=TimeOfDay.now();
  return Movie(
    id: details.id,
    title: details.title, 
    storyline: details.overview, 
    review: details.overview, 
    cost: details.voteCount * 1.0, 
    posterImage: details.posterPath, 
    backgroundImage: details.backdropPath, 
    trailerUrl: '', 
    tags: details.genres.map((genre) => genre.name).toList(), 
    gallery: [], 
    showDate: [
      ShowDate(
        1, 
        DateTime.now(), 
        [
          now, 
          TimeOfDay(hour: now.hour+2, minute: now.minute), 
          TimeOfDay(hour: now.hour+4, minute: now.minute),
          TimeOfDay(hour: now.hour+6, minute: now.minute),
        ]
      ),
      ShowDate(
        2, 
        DateTime.now().add(Duration(days: 2)), 
        [
          now, 
          TimeOfDay(hour: now.hour+2, minute: now.minute), 
          TimeOfDay(hour: now.hour+4, minute: now.minute),
          TimeOfDay(hour: now.hour+6, minute: now.minute),
        ]
      ),
      ShowDate(
        3, 
        DateTime.now().add(Duration(days: 3)), 
        [
          now, 
          TimeOfDay(hour: now.hour+2, minute: now.minute), 
          TimeOfDay(hour: now.hour+4, minute: now.minute),
          TimeOfDay(hour: now.hour+6, minute: now.minute),
        ]
      ),
      ShowDate(
        4, 
        DateTime.now().add(Duration(days: 4)), 
        [
          now, 
          TimeOfDay(hour: now.hour+2, minute: now.minute), 
          TimeOfDay(hour: now.hour+4, minute: now.minute),
          TimeOfDay(hour: now.hour+6, minute: now.minute),
        ]
      ),
      ShowDate(
        5, 
        DateTime.now().add(Duration(days: 5)), 
        [
          now, 
          TimeOfDay(hour: now.hour+2, minute: now.minute), 
          TimeOfDay(hour: now.hour+4, minute: now.minute),
          TimeOfDay(hour: now.hour+6, minute: now.minute),
        ]
      ),
    ],
    rating: double.parse(details.voteAverage.toString()),
    casts: credits.cast.map((item) => Cast(item.name, item.profilePath)).toList(), 
    crew: Crew(
      director: director?.name, 
      duration: 'Nil',
      year: DateTime.parse(details.releaseDate).year.toString(),
      distribution: details.productionCompanies.length>0 ? details.productionCompanies[0].name : 'Nil',
    )
  );
}