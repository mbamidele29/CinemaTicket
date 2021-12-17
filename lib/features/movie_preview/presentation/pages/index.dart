import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_ticket/core/entities/cast.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/route/routes.dart';
import 'package:cinema_ticket/core/widgets/movie_button.dart';
import 'package:cinema_ticket/core/widgets/movie_info.dart';
import 'package:cinema_ticket/features/dashboard/datasource/remote.dart';
import 'package:cinema_ticket/features/movie_preview/presentation/widgets/movie_casts.dart';
import 'package:cinema_ticket/features/movie_preview/presentation/widgets/movie_crew.dart';
import 'package:cinema_ticket/features/movie_preview/presentation/widgets/movie_gallery.dart';
import 'package:cinema_ticket/features/movie_preview/presentation/widgets/movie_review.dart';
import 'package:cinema_ticket/features/movie_preview/presentation/widgets/movie_storyline.dart';
import 'package:cinema_ticket/features/movie_preview/presentation/widgets/reservation_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MoviePreviewScreen extends StatefulWidget {
  final Movie movie;
  const MoviePreviewScreen({ Key key, @required this.movie }) : super(key: key);

  @override
  _MoviePreviewScreenState createState() => _MoviePreviewScreenState();
}

class _MoviePreviewScreenState extends State<MoviePreviewScreen> {

  VideoPlayerController _controller;

  Movie movie;
  Future updateMovie(int movieId)async {
    movie=await getMovie(movieId);
    setState(() {});
  }
  @override
  void initState() {
    if(widget.movie==null)Navigator.pop(context);
    movie=widget.movie;
    updateMovie(widget.movie.id);
    _controller = VideoPlayerController
      // .network('https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
    .network(widget.movie.trailerUrl)
    ..initialize().then((_) {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height*.75,
                  child: Hero(
                    tag: movie.posterImage, 
                    child: _controller.value.isInitialized
                    ? Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        VideoPlayer(_controller),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              _controller.value.isPlaying
                                  ? _controller.pause()
                                  : _controller.play();
                            });
                          },
                          child: Visibility(
                            visible: !_controller.value.isPlaying,
                            child: Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.6),
                                borderRadius: BorderRadius.circular(80)
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.play_arrow,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                    : CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl: movie.backgroundImage,
                        progressIndicatorBuilder: (context, url, downloadProgress) => 
                                Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                  ),
                ),
                SizedBox(height: 16,),
                MovieInfo(movie),
                SizedBox(height: 16,),
                MovieCasts(casts: movie.casts),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieCrew(crew: movie.crew),
                      SizedBox(height: 16,),
                      MovieStoryline(movie.storyline),
                      SizedBox(height: 16,),
                    ],
                  ),
                ),
                MovieGallery(movie.gallery),
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: MovieReview(movie.review),
                ),
                SizedBox(height: 164,),
              ],
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: double.infinity,
              height: 0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 40),
                    color: Colors.white.withOpacity(.8),
                    blurRadius: 50,
                    spreadRadius: 50
                  )
                ]
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              // height: 0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, -40),
                    color: Colors.white.withOpacity(.8),
                    blurRadius: 50,
                    spreadRadius: 50
                  )
                ],
              ),
              child: MovieButton(
                text: 'BOOK NOW',
                onTap: (){
                  showReservationBottomSheet(context, movie);
                },
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}