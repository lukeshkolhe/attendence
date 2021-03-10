import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'package:date_format/date_format.dart';
import 'package:attendence/widgets/Search.dart';
import 'package:attendence/widgets/notification.dart';


class home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, right: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          new Expanded(
            flex: 14,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Date(),
                    Text('Good Morning, Sir.', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),)
                  ],
                ),
                Search(),
                notification(),
              ],
            ),
          ),
          new Expanded(
            flex: 27,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HolidayCard(),
                HolidayCard(),
                HolidayCard(),
                FloatingActionButton( child: Icon(Icons.keyboard_arrow_right, color: Colors.black,), backgroundColor: Colors.white,)
              ],
            ),
          ),
          new Expanded(
            flex: 60,
            child: Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  attendanc(),
                  calendar()
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}
class Date extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30),
      child: Text('Fri, 28 March', style: TextStyle(fontSize: 18),),
    );
  }
}


class HolidayCard extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container (
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        gradient: new LinearGradient(
          begin: Alignment(-1, -2),
          end: Alignment(1, 2),
          colors: [
          const Color(0xFF09C6F9),
          const Color(0xFF045DE9),
        ],
        ),
      ),
      child: Container(
        padding: EdgeInsets.all(20),
        height: 155,
        width: 329,
        child: Column(
          children: [
            new Expanded(
              flex: 6,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Holi Holiday', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),),
                      new Expanded(
                        child: Container(
                          padding: EdgeInsets.only(top: 25, right: 5),
                          width: 220,
                          child: Text('Activate every muscle group to get the results you’ve always wanted.',
                            overflow: TextOverflow.clip,
                            style: TextStyle(color: Colors.white, fontFamily: GoogleFonts.ptSans().fontFamily),
                          ),
                        )
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          gradient: LinearGradient(
                              begin: Alignment(-1, -2),
                              end: Alignment(1, 2),
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0),
                              ]
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xFF045DE9),
                              offset: const Offset(
                                1.0,
                                1.0,
                              ),
                              blurRadius: 5.0,
                              spreadRadius: 1.0,
                            ), //BoxShadow
                            BoxShadow(
                              color: Colors.white,
                              offset: const Offset(0.0, 0.0),
                              blurRadius: 0.0,
                              spreadRadius: 0.0,
                            ), //BoxShadow
                          ],
                        ),
                        child: Text('Holiday',),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('15th March 2021', style: TextStyle(color: Colors.white),),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class attendanc extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 30,right: 30, top: 30, bottom: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      height: 447,
      width: 698,
      child: Column(
        children: [
          new Expanded(
            flex: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Attendance', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Text('Today overall attendance', style: TextStyle(color: Colors.black38, fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SvgPicture.asset('asset/images/attendance.svg', color: Color(0xFF045DE9),)
              ],
            ),
          ),
          new Expanded(
            flex: 50,
            child: Container(
              height: 200,
              width: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('asset/images/circle.png')
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Total Students Present', style: TextStyle(fontSize: 12, color: Colors.black38),),
                  Text('1072', style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
                ],
              )
            ),
          ),
          new Expanded(
            flex: 10,
            child: Row(
              children: [
                new Expanded(
                    flex: 30,
                    child: SizedBox()
                ),
                new Expanded(
                  flex: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Present (%)'),
                      Text('98%', style: TextStyle(color: Color(0xFF0000FF), fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                new Expanded(
                  flex: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Absent (%)'),
                      Text('02%', style: TextStyle(color: Color(0xFFFF0000), fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                new Expanded(
                  flex: 20,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Absent'),
                      Text('21', style: TextStyle(color: Color(0xFFFF0000) , fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
                new Expanded(
                    flex: 20,
                    child: SizedBox()
                ),
              ],
            ),
          ),
          new Expanded(
            flex: 10,
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text('Expand', style: TextStyle(fontSize: 12),),
                  Icon(Icons.keyboard_arrow_right),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
}

class calendar extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 447,
      width: 441,
      decoration: BoxDecoration(
          color: Colors.white,
        borderRadius: BorderRadius.circular(30)
      ),
      child: SizedBox(
        width: 400,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
                Container(
                  margin: EdgeInsets.only(left: 60, top: 20, right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Calendar', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                      SvgPicture.asset('asset/images/calendar.svg',color: Color(0xFF045DE9))
                    ],
                  )
                ),
                Container(
                  margin: EdgeInsets.only(left: 30, right: 30),
                  child: SizedBox(
                    // width: 400,
                    // height: 400,
                    child: Calendar(),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text('Expand', style: TextStyle(fontSize: 12),),
                      Icon(Icons.keyboard_arrow_right),
                    ],
                  ),
                )
          ],
        ),
      ),
    );
  }
}

class Calendar extends StatefulWidget{
  CalendarState createState() => CalendarState();
}
class CalendarState extends State<Calendar>{
  CalendarController _calendarController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      headerStyle: HeaderStyle(
        titleTextBuilder: (date, locale) => formatDate(date, [M, ', ', yy]),
        titleTextStyle: TextStyle(color: Color(0xFF808080)),
        formatButtonVisible: false,
        rightChevronMargin: EdgeInsets.only(left: 0, right: 210),
        leftChevronIcon: Icon(Icons.chevron_left, color: Color(0xFF808080),),
        rightChevronIcon: Icon(Icons.chevron_right, color: Color(0xFF808080),),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        dowTextBuilder: (date, locale) => DateFormat.E(locale).format(date)[0],
        weekendStyle: TextStyle(color: Color(0xFF989DB3)),
        weekdayStyle: TextStyle(color: Color(0xFF989DB3)),
      ),
      calendarController: _calendarController,
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return Container(
            margin: EdgeInsets.only(top: 15, bottom: 15,left: 12, right: 12),
            decoration: BoxDecoration(
              color: Color(0xFFFD3667),
              borderRadius: BorderRadius.all(Radius.elliptical(12, 15))
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(formatDate(date, [d]), style: TextStyle(color: Colors.white),),
              ],
            )
          );
        },
      ),
      calendarStyle: CalendarStyle(
        selectedColor: Color(0xFFFD3667),
        highlightToday: true,
        weekdayStyle: TextStyle(color: Colors.black),
        weekendStyle: TextStyle(color: Colors.black),
        outsideDaysVisible: false,
      ),
    );
  }
}