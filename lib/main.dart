import 'package:flutter/material.dart';
import 'Screen 1 - Category.dart';

void main()=> runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title: Text('"හෙටරට" ව්‍යවසායකත්ව විහිදුම'),
      centerTitle: true,
      backgroundColor: Colors.cyan,
      shadowColor: Colors.lightBlue,
    ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/fscreen.jpg"),
            fit: BoxFit.cover,
          ),
        ),
      ),
    floatingActionButton: Container(
      height: 130.0,
      width: 100.0,
      child: FittedBox(
        child: StreamBuilder<Widget>(
          stream: null,
          builder: (context, snapshot) {
            return FloatingActionButton(
              child: Icon(Icons.arrow_forward_ios),
              onPressed: (){
                 Navigator.push(
                   context,
                   MaterialPageRoute(builder: (context) => Screen2()
                   ),
                 );},
            );
          }
        ),
      ),
    ),
    bottomNavigationBar: BottomAppBar(
      color:Colors.white38,
      child: Container(height:50.0),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked
  ),
  ),
);


