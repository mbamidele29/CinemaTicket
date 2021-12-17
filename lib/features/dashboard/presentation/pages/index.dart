import 'dart:convert';
import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/values/keys.dart';
import 'package:cinema_ticket/features/dashboard/datasource/local.dart';
import 'package:cinema_ticket/features/dashboard/datasource/remote.dart';
import 'package:cinema_ticket/features/dashboard/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({ Key key }) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {

  int index=0;
  List<Movie> movies=[];

  Future loadMovies() async{
    movies=await getMovies();
    setState(() {});
  }

  @override
  void initState() {
    // movies=localDataMovies;
    loadMovies();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    final height=size.height * 3/4;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Stack(
        // alignment: AlignmentDirectional.bottomCenter,
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomCenter,
            children: [
              Container(
                height: size.height*.5,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: movies.length-1>=index ?  DecorationImage(
                    image: CachedNetworkImageProvider(movies[index].backgroundImage),
                    fit: BoxFit.cover,
                  ) : null,
                ),
              ),
              Container(
                height: 0,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, -30),
                      color: Colors.white,
                      blurRadius: 80,
                      spreadRadius: 60
                    )
                  ]
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Visibility(
              visible: true,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 64),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height,
                    aspectRatio: 16/9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(seconds: 1),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    onPageChanged: (index, _){
                      setState(() {
                        this.index=index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                ),
                  items: movies.map((movie) {
                    return Builder(
                      builder: (BuildContext context) {
                        return MovieCard(height: height, movie: movie);
                      },
                    );
                  }).toList(),
                ),
              ),
            ),
          )
        ],
      )
    );
  }
}