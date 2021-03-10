
import 'package:flutter/cupertino.dart';
import 'package:attendence/widgets/Search.dart';
import 'package:attendence/widgets/notification.dart';
import 'package:flutter/material.dart';
var now = DateTime.now();
int _month = DateTime.now().month ;
int selected = DateTime.now().day;
GlobalKey cal_key = new GlobalKey();
class attendance extends StatefulWidget{
  attendanceState createState() => attendanceState();
}
List<String> Months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
class attendanceState extends State<attendance>{
  refresh(){
    setState(() {
      print(_month);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(30),
      child: Column(
        children: [
          new Expanded(
            flex: 10,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Attendance', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                Search(),
                notification(),
              ],
            ),
          ),
          new Expanded(
            flex: 10,
            child: Row(
              children: [
                new Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      selection(type: 'Class', items: ['1', '2', '3', '4','5', '6', '7', '8', '9','10', '11', '12']),
                      selection(type: 'Section', items: ['A', 'B', 'C'],),
                      selection(type: 'Month', items: Months, notifyParent: refresh),
                      selection(type: 'Session',items: ['Morning', 'Evening'],),
                    ],
                  ),
                ),
                new Expanded(
                  flex: 1,
                    child: SizedBox(),
                )
              ],
            ),
          ),
          new Expanded(
            flex: 10,
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: 1000,
                  child: Calendar(),
                ),
              ],
            ),
          ),
          new Expanded(
            flex: 50,
            child: Individual(),
          )
        ],
      ),
    );
  }
}
class selection extends StatefulWidget{
  final Function() notifyParent;
  String type;
  List<String> items;
  selection({this.type, this.items, this.notifyParent});
  SelectionState createState() => SelectionState();
}

class SelectionState extends State<selection>{
  String dropdownValue;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 109,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xFF0D0D0D),
      ),
      child: DropdownButton(
        hint: Text(widget.type, style: TextStyle(color: Colors.white),),
        underline: SizedBox(),
        icon: Icon(Icons.keyboard_arrow_down),
        items: widget.items
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        style: TextStyle(
          color: Colors.white,
        ),
        dropdownColor: Color(0xFF0D0D0D),
        value: dropdownValue,
        onChanged: (String newValue) {
          setState(() {
            if(widget.type == 'Month'){
                _month = Months.indexOf(newValue) + 1;
                selected = 1;
                widget.notifyParent();
            }
            dropdownValue = newValue;
          });
        },
      ),
    );
  }
}

class Calendar extends StatefulWidget{
  CalendarState createState() => CalendarState();
}
class CalendarState extends State<Calendar>{
  String getweekday(int index){
    switch(DateTime(now.year, _month, index + 1).weekday){
      case 1: {
        return 'Sun';
      }
      case 2: {
        return 'Mon';
      }
      case 3: {
        return 'Tue';
      }
      case 4: {
        return 'Wed';
      }
      case 5: {
        return 'Thu';
      }
      case 6: {
        return 'Fri';
      }
      case 7: {
        return 'Sat';
      }
    }
  }
  BoxDecoration decorate(int index){
    return selected == index + 1? BoxDecoration(
        color: Color(0xFF045DE9),
        borderRadius: BorderRadius.circular(25)): BoxDecoration();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      key: cal_key,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
          itemCount: DateTime(now.year, _month + 1, 0).day,
          itemBuilder: (BuildContext context, int index){
            return InkWell(
              onTap: (){
                setState(() {
                  selected = index + 1;
                });
              },
              child: Container(
                height: 67,
                width: 45,
                margin: EdgeInsets.only(right: 20),
                decoration: decorate(index),
                padding: EdgeInsets.only(top: 15, bottom: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text((index + 1).toString(), style: TextStyle(fontSize: 14, color: selected == index + 1? Colors.white: Colors.black),),
                    Text(getweekday(index), style: TextStyle(fontSize: 14, color: selected == index + 1? Colors.white: Colors.black),)
                  ],
                ),
              ),
            );
          },
        )
    );
  }
}

List name = ['Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav', 'Abhishek Yadav',
  'Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav',
  'Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav',
  'Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav',
  'Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav',
  'Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav','Abhishek Yadav',];
List presenty = [true, false, true, true, true,
  true, false, true, true, true,
  true, false, true, true, true,
  true, false, true, true, true,
  true, false, true, true, true,
  true, false, true, true, true,];
class Individual extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: name.length,
      itemBuilder: (BuildContext context, int index){
        return Container(
          margin: EdgeInsets.only(top: 20),
          child: Row(
            children: [
              new Expanded(
                flex: 1,
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Color(0xFF09C6F9),
                          borderRadius: BorderRadius.circular(22.5)
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text((index < 9? '0' + (index+1).toString(): (index+1)).toString()+ (index == 0? 'st': index == '1'? 'nd': index == '2'? 'rd' : 'th'), style: TextStyle(color: Colors.white, fontSize: 18),),
                          Text('Period', style: TextStyle(color: Colors.white, fontSize: 8),)
                        ],
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 181,
                      margin: EdgeInsets.only(left: 20, right: 20),
                      padding: EdgeInsets.only(left: 20),
                      decoration: BoxDecoration(
                          color: Color(0xFFD3E0EA).withOpacity(0.5),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name[index], style: TextStyle(fontSize: 14),)
                        ],
                      ),
                    ),
                    present(index: index,)
                  ],
                ),
              ),
              new Expanded(
                flex: 1,
                child: SizedBox(),
              )
            ],
          )
        );
      },
    );
  }
}
class present extends StatefulWidget{
  int index;
  present({this.index});
  presentState createState() => presentState();
}
class presentState extends State<present>{
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          child:
          TextButton(
              onPressed: (){
                setState(() {
                  presenty[widget.index] = true;
                });
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.5),
                      side: BorderSide(color: presenty[widget.index] == true? Color(0xFF0AC10A) : Colors.black12)
                  )),
                  padding: MaterialStateProperty.all(EdgeInsets.only(top: 11.5, bottom: 11.5, left: 18, right: 18),),
                  backgroundColor: MaterialStateProperty.all<Color>(presenty[widget.index] == true? Color(0xFF0AC10A) : Colors.white)
              ),
              child: Text('Present', style: TextStyle(fontSize: 16, color: presenty[widget.index] == true? Colors.white : Colors.black),)
          ),
        ),
        Container(
          child:
          TextButton(
              onPressed: (){
                setState(() {
                  presenty[widget.index] = false;
                });
              },
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(19.5),
                      side: BorderSide(color: presenty[widget.index] == false? Color(0xFFD00D0D) : Colors.black12))
                  ),
                  padding: MaterialStateProperty.all(EdgeInsets.only(top: 11.5, bottom: 11.5, left: 18, right: 18),),
                  backgroundColor: MaterialStateProperty.all<Color>(presenty[widget.index] == false? Color(0xFFD00D0D) : Colors.white)
              ),
              child: Text('Absent', style: TextStyle(fontSize: 16, color: presenty[widget.index] == false? Colors.white : Colors.black),)
          ),
        )
      ],
    );
  }
}