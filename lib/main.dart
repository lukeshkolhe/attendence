import 'package:flutter/material.dart';
import 'package:attendence/Views/attendance.dart';
import 'Views/home.dart';
import 'widgets/SideNav.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  GlobalKey _key = new GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDFDFD),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFDFDFD),
              const Color(0xFFE5E5E5),
            ]
          )
        ),
        child: Row(
          children: [
            new Expanded(
                flex: 1,
                child: SideNav(globalKey: _key,)
            ),
            Container(
              height: double.infinity,
              width: 0.5,
              color: Color(0xFFE4E4E4),
            ),
            new Expanded(
                flex: 5,
                child: Navigator(
                  key: _key,
                  initialRoute: 'home',
                  onGenerateRoute: (RouteSettings settings){
                    WidgetBuilder builder;
                    switch(settings.name){
                      case 'home': {
                        builder = (BuildContext context) => home();
                        break;
                      }
                      case 'attendance': {
                        builder= (BuildContext context) => attendance();
                        break;
                      }
                      default:
                        throw Exception('Invalid route: ${settings.name}');
                    }
                    return MaterialPageRoute(builder: builder, settings: settings);
                  },
                )
            )
          ],
        ),
      )
    );
  }
}

