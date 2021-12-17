import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/route/routes.dart';
import 'package:cinema_ticket/core/widgets/movie_button.dart';
import 'package:cinema_ticket/features/booking/presentation/widgets/seat_hint.dart';
import 'package:cinema_ticket/features/booking/presentation/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  final int dateSelected;
  final int timeSelected;
  final Movie movie;
  const BookingScreen({Key key, @required this.movie , @required this.dateSelected, @required this.timeSelected}) : super(key: key);

  @override
  _BookingScreenState createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {

  @override
  void initState() {
    if(widget.movie==null)Navigator.of(context).pop();
    super.initState();
  }

  final Color colorAvailable=Color.fromRGBO(75, 89, 145, 1);
  final Color colorSelected=Color.fromRGBO(113, 212, 255, 1);
  final Color colorReserved=Color.fromRGBO(233, 119, 93, 1);

  final List<int> selected=[];
  final List<int> reserved=[1, 4, 6, 3, 8, 9, 15];

  String total='0';

  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(widget.movie.posterImage),
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
                      'Select seats',
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
                      child: SingleChildScrollView(
                        child: Wrap(
                          children: [
                            for(int i=1; i<=99; i++)
                              SeatItem(
                                seatNumber: '$i',
                                color: reserved.contains(i) ? colorReserved : selected.contains(i) ? colorSelected : colorAvailable, 
                                onTap: (){
                                  if(reserved.contains(i))return;
                                  if(selected.contains(i))selected.remove(i);
                                  else selected.add(i);

                                  total=NumberFormat.currency(symbol: '').format(selected.length*widget.movie.cost);
                                  setState(() {});
                                }
                              ),
                          ],
                        ),
                      )
                    ),
                    SizedBox(height: 16,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SeatHint('Available', colorAvailable),
                        SeatHint('Selected', colorSelected),
                        SeatHint('Reserved', colorReserved),
                      ],
                    ),
                    SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
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
                            ],
                          ),
                          SizedBox(width: 16,),
                          Expanded(
                            child: MovieButton(
                              onTap: (){
                                Navigator.of(context).pushNamed(
                                  routeCheckout, 
                                  arguments: {
                                    'movie': widget.movie,
                                    'dateSelected': widget.dateSelected,
                                    'timeSelected': widget.timeSelected,
                                    'selectedSeat': selected
                                  }
                                );
                              }, 
                              text: 'BUY TICKETS', 
                              color: Color.fromRGBO(138, 138, 255, 1)
                            ),
                          )
                        ],
                      ),
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