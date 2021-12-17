import 'package:flutter/material.dart';

class MovieButton extends StatelessWidget {
  final Function onTap;
  final String text;
  final Color color;
  const MovieButton({ Key key, @required this.onTap, @required this.text, @required this.color }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8)
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w800
              ),
            ),
          ),
        ),
      ),
    );
  }
}