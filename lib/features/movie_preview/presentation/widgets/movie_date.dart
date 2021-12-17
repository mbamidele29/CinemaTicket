import 'package:cinema_ticket/core/entities/show_date.dart';
import 'package:cinema_ticket/core/widgets/movie_button.dart';
import 'package:flutter/material.dart';

class MovieDateTime extends StatefulWidget {
  final List<ShowDate> dates;
  final Function onSubmitted;
  final BuildContext context;
  const MovieDateTime({ Key key, @required this.context, @required this.dates, @required this.onSubmitted }) : super(key: key);

  @override
  _MovieDateTimeState createState() => _MovieDateTimeState();
}

class _MovieDateTimeState extends State<MovieDateTime> {
  final List<String> days=['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  final List<String> months=['January', 'February', 'March', 'Arpil', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'];

  ShowDate dateSelected;
  int timeSelected=-1;

  @override
  Widget build(BuildContext context) {
    return Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.calendar_today_rounded,
              color: Colors.white,
              size: 16,
            ),
            SizedBox(width: 8,),
            Text(
              dateSelected==null ? '' : '${months[dateSelected.date.month-1]} ${dateSelected.date.day}',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w800,
              )
            )
          ],
        ),
        SizedBox(height: 16,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: widget.dates.map((date) => GestureDetector(
              onTap: (){
                dateSelected=date;
                timeSelected=-1;
                setState(() {});
              },
              child: _dateItem(date.date, dateSelected?.id==date.id)
            )).toList()
          ),
        ),
        SizedBox(height: 8,),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: dateSelected!=null ? Row(
            children: [
              for(int i=0; i<dateSelected.time.length; i++)
                GestureDetector(
                  onTap: (){
                    timeSelected=i;
                    setState(() {});
                  },
                  child: _timeItem(dateSelected.time[i], timeSelected==i)
                )
            ]
          ) : SizedBox.shrink(),
        ),

        SizedBox(height: 16,),
        MovieButton(
          onTap: (){
            Navigator.of(widget.context).pop();
            widget.onSubmitted(dateSelected.id, timeSelected);
          }, 
          text: 'RESERVATION', 
          color: Color.fromRGBO(138, 138, 255, 1)
        ),
      ],
    );
  }

  Widget _timeItem(TimeOfDay time, bool selected){
    return ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: Color.fromRGBO(32, 34, 86, 1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: selected ? Color.fromRGBO(138, 138, 255, 1) : Color.fromRGBO(32, 34, 86, 1)
            ),
            boxShadow: selected ? [
              BoxShadow(
                offset: Offset(-1, -1),
                blurRadius: 6,
                color: Color.fromRGBO(138, 138, 255, 1)
              ),
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                color: Color.fromRGBO(138, 138, 255, 1)
              ),
            ] : []
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Center(
              child: Column(
                children: [
                  Text(
                    "${time.hour}:${time.minute}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _dateItem(DateTime date, bool selected){
    return ClipRRect(
      borderRadius: BorderRadius.circular(400),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: selected ? Color.fromRGBO(138, 138, 255, 1) : Color.fromRGBO(32, 34, 86, 1),
            borderRadius: BorderRadius.circular(400),
            boxShadow: selected ? [
              BoxShadow(
                offset: Offset(1, 1),
                blurRadius: 6,
                color: Color.fromRGBO(138, 138, 255, 1)
              ),
            ] : []
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            child: Center(
              child: Column(
                children: [
                  Text(
                    days[date.weekday-1],
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 16
                    ),
                  ),
                  Divider(
                    height: 16,
                    thickness: 2,
                    color: Color.fromRGBO(138, 138, 255, 1),
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: selected ? Color.fromRGBO(227, 247, 250, 1) : Colors.transparent,
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: Center(
                      child: Text(
                        "${date.day}",
                        style: TextStyle(
                          color: selected ? Color.fromRGBO(32, 34, 86, 1) : Color.fromRGBO(227, 247, 250, 1),
                          fontWeight: FontWeight.w800,
                          fontSize: 16
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}