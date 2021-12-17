import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/route/routes.dart';
import 'package:cinema_ticket/core/widgets/movie_info.dart';
import 'package:cinema_ticket/core/widgets/star_ratings.dart';
import 'package:cinema_ticket/features/dashboard/presentation/widgets/tag.dart';
import 'package:flutter/material.dart';

class MovieCard extends StatefulWidget {

  final Movie movie;
  final double height;

  const MovieCard({ Key key, @required this.movie, @required this.height }) : super(key: key);

  @override
  _MovieCardState createState() => _MovieCardState();
}

class _MovieCardState extends State<MovieCard> {
  EdgeInsets padding=const EdgeInsets.fromLTRB(28, 28, 28, 0);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: SingleChildScrollView(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).pushNamed(routePreview, arguments: {
              'movie': widget.movie,
            });
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(widget.height),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: widget.height,
              // margin: EdgeInsets.symmetric(horizontal: 8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(widget.height)
              ),
              child: Center(
                child: Column(
                  children: [
                    Padding(
                      padding: padding,
                      child: Container(
                        height: widget.height*4/6,
                        child: Stack(
                          alignment: AlignmentDirectional.center,
                          children: [
                            Hero(
                              tag: widget.movie.posterImage,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(widget.height),
                                child: Container(
                                  height: widget.height*4/6,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(widget.height),
                                  ),
                                  child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: widget.movie.posterImage,
                                    progressIndicatorBuilder: (context, url, downloadProgress) => 
                                            Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
                                    errorWidget: (context, url, error) => Icon(Icons.error),
                                  ),
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.bottomRight,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: Center(
                                  child: Icon(
                                    Icons.favorite,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: MovieInfo(widget.movie),
                    ),
                    Padding(
                      padding: padding.copyWith(top: 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(widget.height)
                        ),
                        width: MediaQuery.of(context).size.width,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(28.0),
                            child: Text(
                              'BOOK NOW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w800
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}