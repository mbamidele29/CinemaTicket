import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_ticket/core/entities/movie.dart';
import 'package:cinema_ticket/core/route/routes.dart';
import 'package:cinema_ticket/features/movie_preview/presentation/widgets/movie_date.dart';
import 'package:flutter/material.dart';

void showReservationBottomSheet(
  BuildContext context, 
  Movie movie
) {

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) {
        return GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            color: Color.fromRGBO(0, 0, 0, 0.001),
            child: GestureDetector(
              onTap: () {},
              child: DraggableScrollableSheet(
                initialChildSize: 0.8,
                minChildSize: 0.8,
                maxChildSize: 0.9,
                builder: (__, controller) {
                  return Container(
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(40, 53, 130, 1),
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(25.0),
                        topRight: const Radius.circular(25.0),
                      ),
                    ),
                    child: StatefulBuilder(
                      builder: (___, setModalState) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                              child: Text(
                                'Select date and time',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontWeight: FontWeight.w800,
                                )
                              ),
                            ),
                            SizedBox(height: 10,),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: ListView(
                                  controller: controller,
                                  children: [
                                    SizedBox(height: 20,),
                                    Container(
                                      width: double.infinity,
                                      height: 200,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: CachedNetworkImageProvider(movie.backgroundImage),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 15,),
                                    Text(
                                      '${movie.title} Trailer (${movie.crew.year})',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                      )
                                    ),
                                    SizedBox(height: 16,),
                                    MovieDateTime(
                                      context: context,
                                      dates: movie.showDate,
                                      onSubmitted: (int dateSelected, int timeSelected){
                                        Navigator.of(context).pushNamed(
                                          routeBooking, 
                                          arguments: {
                                            'movie': movie,
                                            'dateSelected': dateSelected,
                                            'timeSelected': timeSelected
                                          }
                                        );
                                      }
                                    ),
                                    SizedBox(height: 16,),
                                    
                                  ],
                                )
                              ),
                            ),
                          ],
                        );
                      }
                    ),
                  );
                },
              ),
            ),
          ),
        );
      },
    );
  }