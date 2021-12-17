import 'package:flutter/material.dart';

class StartRatings extends StatelessWidget {
  final double ratings;
  final int starCount=5;
  final Function(int) onTap;
  const StartRatings(this.ratings, this.onTap, { Key key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(int i=0; i<starCount; i++)
            GestureDetector(
              onTap: (){
                onTap(i+1);
              },
              child: Icon(
                ratings==i+0.5 ? Icons.star_half : Icons.star,
                color: ratings>=i+0.5 ? Colors.amber[600] : Colors.grey[300],
              ),
            )
        ],
      ),
    );
  }
}