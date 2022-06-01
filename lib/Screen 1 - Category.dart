import 'package:flutter/material.dart';
import 'Screen 2 - Loans.dart';
import 'Loan table and class.dart';
import 'Screen 4 - User Form.dart';

class Screen2 extends StatefulWidget {
  @override
  CategoryScreenState createState() {
    return CategoryScreenState();
  }
}

class CategoryScreenState extends State<Screen2> {
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
      body: ListView(children: [
        Padding(
            padding: EdgeInsets.fromLTRB(10.0, 30.0, 10.0, 30.0),
            child: Text(
              "ඔබගේ මුදල් අවශ්‍යයතාවය කුමක් සඳහාද?\n\nපහතින් තෝරන්න.",
              style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5),
            )),
        ElevatedButton(
          child: Text(
            "කුඩා, සුළු, මධ්‍ය පරිමාණ ව්‍යාපාර හෝ ව්‍යාපෘති ආරම්භ කිරීමට හෝ පවත්වාගෙන යාමට",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoanOptions(loanlist: loan1)),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        ElevatedButton(
          child: Text(
            "වී වගාව සහ අනෙකුත් භෝග හා කෘෂි ව්‍යාපෘති සඳහා",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
          ),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => LoanOptions(loanlist: loan2),
                ));
          },
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        ElevatedButton(
          child: Text(
            "පොල් වගාව සහ ඊට සම්බන්ධ කර්මාන්ත කටයුතු වෙනුවෙන්",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoanOptions(loanlist: loan3)),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        ElevatedButton(
          child: Text(
            "වෙනත් විශේෂිත සංවර්ධන අවශ්‍යතා වෙනුවෙන්",
            style: TextStyle(
              fontSize: 18.0,
            ),
          ),
          style: ElevatedButton.styleFrom(
            padding: EdgeInsets.all(10.0),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LoanOptions(loanlist: loan4)),
            );
          },
        ),
        Padding(
          padding: EdgeInsets.all(10.0),
        ),
        ElevatedButton(
            child: Text(
              "ඔබගේ අවශ්‍යතාවය ඉහත සඳහන් නැත්නම් මෙය තෝරන්න.",
              style: TextStyle(
                fontSize: 18.0,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.all(10.0),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomerForm(
                          askLoan: 'General',
                        )),
              );
            }),
      ]),
    );
  }
}
