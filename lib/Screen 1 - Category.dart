import 'package:flutter/material.dart';
import 'Screen 2 - Loans.dart';
import 'Loan table and class.dart';
import 'Screen 4 - User Form.dart';


//TODO migrate splash screen
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
      backgroundColor: Colors.cyan[50],
      body: Column(
        children: [
          Padding(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
              child: Text("ඔබගේ මුදල් අවශ්‍යයතාවය කුමක් සඳහාද?\nපහතින් තෝරන්න.",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5
                ),)),
          ElevatedButton(
                child: Text("කුඩා, සුළු, මධ්‍ය පරිමාණ ව්‍යාපාර හෝ ව්‍යාපෘති ආරම්භ කිරීමට හෝ පවත්වාගෙන යාමට...",
                style: TextStyle(
                  fontSize: 18.0,),),
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(10.0),),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Btn1tap(loanlist:loan1)
                  ),);},
            ),
    Padding(
    padding: EdgeInsets.all(10.0),),
         ElevatedButton(
                child: Text("කෘෂිකාර්මික කටයුතු හා ඊට සම්බන්ධ ව්‍යාපෘති/සේවා.....",
                style: TextStyle(
                  fontSize: 18.0,),),
           style: ElevatedButton.styleFrom(
             padding: EdgeInsets.all(10.0),),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Btn1tap(loanlist:loan2),
                  ));},),
          Padding(
            padding: EdgeInsets.all(10.0),),
          ElevatedButton(
              child: Text("ඔබේ ව්‍යාපාරය හෝ කර්මාන්තය පරිසර හිතකාමී කිරීම,\nපරිසරය සුරැකීමේ ව්‍යාපෘති,\nඔබේ ගොඩනැගිල්ලේ සූර්ය බල පද්ධති සවිකිරීම.",
                style: TextStyle(
                  fontSize: 18.0,),),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),),
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Btn1tap(loanlist:loan3)),);},),
          Padding(
            padding: EdgeInsets.all(10.0),),
        ElevatedButton(
                  child: Text("NVQ පුහුණුව ලැබූ ඔබේ ව්‍යාපාරය/ කර්මාන්තය ඇරඹීමට...",
                style: TextStyle(
                  fontSize: 18.0,),),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),),
              onPressed: (){
                    Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Btn1tap(loanlist:loan4)),);},),
          Padding(
            padding: EdgeInsets.all(10.0),),
         ElevatedButton(
              child: Text("ඔබගේ අවශ්‍යතාවය ඉහත සඳහන් නැත්නම් මෙය තෝරන්න.",
                style: TextStyle(
                  fontSize: 18.0,),),
           style: ElevatedButton.styleFrom(
             padding: EdgeInsets.all(10.0),),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerForm()),);},),

          ]),
      );
  }}