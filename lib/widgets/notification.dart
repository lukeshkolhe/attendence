
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class notification extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: new Stack(
        children: [
          FloatingActionButton(child: Icon(Icons.notifications_none, color: Colors.black,), backgroundColor: Colors.white,),
          new Positioned(
            right: 0,
              top: 0,
            child: Container(
              height: 25,
              width: 25,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.5),
                color: Color(0xFFFF754C),
              ),
              child: Text('2', style: TextStyle(fontSize: 16, color: Colors.white),),
            ),
          )
        ],
      ),
    );
  }
}