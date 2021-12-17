import 'package:flutter/material.dart';

class SeatHint extends StatelessWidget {
  final String text;
  final Color color;
  const SeatHint(this.text, this.color, { Key key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(height: 8,),
        Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w400
          ),
        ),
      ],
    );
  }
}