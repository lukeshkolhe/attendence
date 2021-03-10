import 'package:attendence/Views/attendance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
class SideNav extends StatefulWidget{
  GlobalKey globalKey;
  SideNav({this.globalKey});
  SideNavState createState() => SideNavState();
}
int route = 0;
class SideNavState extends State<SideNav>{
  @override
  Widget build(BuildContext context) {
    List nav_elements = ["Home", "Notice Board", "Attendance", "Fees Details", "Calender", "Multimedia", "Time-tables", "Schedules", "Support", "Account"];
    List routes = ['home', '', 'attendance'];
    List icons = ["home2.svg", "notice boards.svg", "attendance.svg", "fees details.svg", "Calendar.svg", "multimedia.svg", "timetables.svg", "schedules.svg", "support request.svg", "support.svg", "account.svg"];
    return Container(
      padding: EdgeInsets.only(top: 35),
      height: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(bottom: 20),
            child: Image(image: AssetImage('asset/images/logo.png'), height: 109, width: 98,),
          ),
          new Expanded(
                  child: ListView.builder(
                      itemCount: nav_elements.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: (){
                            setState(() {
                              route = index;
                              Navigator.of(widget.globalKey.currentContext).pushReplacementNamed(routes[index]);
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 50,),
                            padding: EdgeInsets.only(left: 10, top: 15, bottom: 15),
                            decoration: BoxDecoration(
                              color: route == index? Color(0xFF045DE9): Colors.transparent,
                              borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), topRight: Radius.circular(12))
                            ),
                            child: Row(
                              children: [
                                route != index? SvgPicture.asset('asset/images/'+ icons[index]): SvgPicture.asset('asset/images/selected.svg'),
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  child:
                                  Text('${nav_elements[index]}', style: TextStyle(color: route == index? Colors.white: Colors.black),),
                                )
                              ],
                            ),
                          ),
                        );
                      })
          ),
          Container(
            padding: EdgeInsets.only(bottom: 10, left: 10),
            child: profile(),
          )
        ],
      ),
    );
  }
}
class profile extends StatelessWidget{
  String name = 'Fr. Paul D’Souza';
  String account_type = "Admin";
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          new Expanded(
            flex: 3,
            child: Image.asset('asset/images/profile.png'),
          ),
          new Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name,),
                  Text(account_type + " Account", style: TextStyle(fontSize: 12))
                ],
              )),
          new Expanded(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('asset/images/arrow_up.svg', height: 13,width: 13,),
                SvgPicture.asset('asset/images/arrow_down.svg', height: 13,width: 13,),
              ],
            ),
          )
        ],
      ),
    );
  }
}