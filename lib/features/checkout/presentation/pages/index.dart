import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/widgets/movie_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CheckoutScreen extends StatelessWidget {
  final int dateSelected;
  final int timeSelected;
  final Movie movie;
  final List<int> selectedSeat;
  const CheckoutScreen({ Key key, @required this.movie , @required this.dateSelected, @required this.timeSelected, @required this.selectedSeat }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String total=NumberFormat.currency(symbol: '').format(selectedSeat.length*movie.cost);
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(movie.posterImage),
                fit: BoxFit.cover,
              )
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 10,
              sigmaY: 10,
            ),
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black.withOpacity(.6),
              child: SafeArea(
                child: Column(
                  children: [
                    SizedBox(height: 16,),
                    Text(
                      '${movie.title} (${movie.crew.year})',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 32,
                        letterSpacing: 1.5
                      ),
                    ),
                    SizedBox(height: 16,),
                    Expanded(
                      child: SizedBox.shrink()
                    ),
                    SizedBox(height: 16,),
                    Text(
                      'Total Price',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    Text(
                      '\$$total',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    MovieButton(
                      onTap: (){
                
                      }, 
                      text: 'PAY NOW', 
                      color: Color.fromRGBO(138, 138, 255, 1)
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}