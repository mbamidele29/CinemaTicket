import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinema_ticket/core/entities/cast.dart';
import 'package:flutter/material.dart';

class MovieCasts extends StatelessWidget {
  final List<Cast> casts;
  const MovieCasts({ Key key, @required this.casts }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Text(
            'Cast',
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 24,
              letterSpacing: 1.5
            ),
          ),
        ),
        SizedBox(height: 4,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
              children: casts.map((cast) => _castItem(cast)).toList()
          ),
        ),
      ],
    );
  }

  Widget _castItem(Cast cast){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: Colors.grey[400],
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: CachedNetworkImageProvider(cast.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(height: 6,),
          Text(
            cast.name.trim().replaceFirst(' ', '\n'),
            maxLines: 2,
            textAlign: TextAlign.start,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 14,
              height: 1.2,
              color: Colors.black87
            ),
          )
        ],
      ),
    );
  }
}