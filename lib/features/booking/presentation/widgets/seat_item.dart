import 'package:flutter/material.dart';

class SeatItem extends StatelessWidget {
  final Color color;
  final String seatNumber;
  final Function onTap;
  final double seatHeight=32;
  final double seatWidth=30;
  final double armWidth=8;
  const SeatItem({ Key key, @required this.seatNumber , @required this.color, @required this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _seatArm(),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                    width: seatWidth,
                    height: seatHeight,
                    decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(4),
                        bottomRight: Radius.circular(4),
                      )
                    ),
                    child: Center(
                      child: Text(
                        seatNumber,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w700
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: seatWidth,
                  height: 4,
                  decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(40)
                  ),
                ),
              ],
            ),
            _seatArm(),
          ],
        ),
      ),
    );
  }
  Widget _seatArm(){
    return Container(
      width: armWidth,
      height: seatHeight,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(40)
      ),
    );
  }
}