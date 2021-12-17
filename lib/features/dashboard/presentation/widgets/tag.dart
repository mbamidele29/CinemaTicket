import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final String tag;
  const Tag({ Key key, @required this.tag }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Text(
          tag,
          style: TextStyle(
            color: Colors.black,
            letterSpacing: 1.2
          ),
        ),
      ),
    );
  }
}