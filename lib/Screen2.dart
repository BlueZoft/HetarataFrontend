import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Btn1tap.dart';

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('"හෙටරට" ව්‍යවසායකත්ව විහිදුම'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        shadowColor: Colors.lightBlue,
      ),
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(15.0, 20.0, 10.0, 10.0),
              child: Text("ඔබගේ මුදල් අවශ්‍යයතාවය කුමක් සඳහා ද?\nපහතින් තෝරන්න.",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5
                ),)
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(5.0,20.0,5.0,5.0),
            child: RaisedButton(
              child: Text("කුඩා, සුළු, මධ්‍ය පරිමාණ ව්‍යාපාර හෝ ව්‍යාපෘති ආරම්භ කිරීමට හෝ පවත්වාගෙන යාමට...",
                style: TextStyle(
                  fontSize: 18.0,
                ),

              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Btn1tap()
                  ),
                );
              },
              color: Colors.cyan[200],
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(5.0,20.0,5.0,5.0),
            child: RaisedButton(
              child: Text("කෘෂිකාර්මික කටයුතු හා ඊට සම්බන්ධ ව්‍යාපෘති/සේවා.....",
                style: TextStyle(
                  fontSize: 18.0,
                ),

              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Btn2tap()),);
              },
              color: Colors.cyan[200],
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(5.0,20.0,5.0,5.0),
            child: RaisedButton(
              child: Text("ඔබේ ව්‍යාපාරය හෝ කර්මාන්තය පරිසර හිතකාමී කිරීම,\nපරිසරය සුරැකීමේ ව්‍යාපෘති,\nඔබේ ගොඩනැගිල්ලේ සූර්ය බල පද්ධති සවිකිරීම.",
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Btn3tap()),);
                },
              color: Colors.cyan[200],
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(5.0,20.0,5.0,5.0),
            child: RaisedButton(
              child: Text("NVQ පුහුණුව ලැබූ ඔබේ ව්‍යාපාරය/ කර්මාන්තය ඇරඹීමට...",
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onPressed: (){},
              color: Colors.cyan[200],
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
          Padding(
            padding:EdgeInsets.fromLTRB(5.0,20.0,5.0,5.0),
            child: RaisedButton(
              child: Text("ඔබගේ අවශ්‍යතාවය ඉහත සඳහන් නැත්නම් මෙය තෝරන්න.",
                style: TextStyle(
                  fontSize: 18.0,
                ),),
              onPressed: (){},
              color: Colors.cyan[200],
              textColor: Colors.black,
              padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            ),
          ),
        ],
      ),
    );
  }}