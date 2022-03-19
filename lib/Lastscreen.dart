import 'package:flutter/material.dart';
import 'CustomerForm.dart';


class LastScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('ඔබේ තොරතුරු පහත පුරවන්න',
            style: TextStyle(
              fontSize: (20.0),),),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          shadowColor: Colors.tealAccent[50] ),
        body:SingleChildScrollView(
          child:Padding(
            padding: const EdgeInsets.fromLTRB(14, 25, 14, 0),
            child:CustomerForm()
        )),);}}


