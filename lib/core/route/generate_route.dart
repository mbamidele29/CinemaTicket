import 'package:cinema_ticket/core/route/routes.dart';
import 'package:cinema_ticket/features/booking/presentation/pages/index.dart';
import 'package:cinema_ticket/features/checkout/presentation/pages/index.dart';
import 'package:cinema_ticket/features/dashboard/presentation/pages/index.dart';
import 'package:cinema_ticket/features/movie_preview/presentation/pages/index.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings settings){
  final String route=settings.name;
  final Map arguments=settings.arguments ?? {};

  switch(route){
    case routeInit:
      return MaterialPageRoute(builder: (_)=>DashboardScreen());
    case routePreview:
      return MaterialPageRoute(builder: (_)=>MoviePreviewScreen(movie: arguments['movie']));
    case routeBooking:
      return MaterialPageRoute(builder: (_)=>BookingScreen(
        movie: arguments['movie'],
        dateSelected: arguments['dateSelected'],
        timeSelected: arguments['timeSelected']
      ));
    case routeCheckout:
      return MaterialPageRoute(builder: (_)=>CheckoutScreen(
        movie: arguments['movie'],
        dateSelected: arguments['dateSelected'],
        timeSelected: arguments['timeSelected'],
        selectedSeat: arguments['selectedSeat']
      ));
    default:
      return MaterialPageRoute(
        builder: (_){
          return Scaffold(
            body: Center(
              child: Text("Invalid Route")
            ),
          );
        }
      );
  }
}