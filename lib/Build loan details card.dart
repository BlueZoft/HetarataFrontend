import 'package:flutter/material.dart';
import 'Loan table and class.dart';
import 'Screen 3 - Loan Details.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


Future<LoanClass> getLoans() async{
  final loan = await http.get(Uri.parse('http://10.0.2.2:5000/api/loans'));

  if (loan.statusCode == 200) {
    return LoanClass.fromJson(jsonDecode(loan.body));
  }
  else {
    throw Exception('Failed to load loans');
  }
}

class LoanCard extends StatelessWidget {

  final LoanClass loan;
  LoanCard ({this.loan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
      color: Colors.white70,
      elevation: 10.0,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(loan.lName,
              style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87),
              textAlign: TextAlign.center,),
            SizedBox(height: 3.0,),
            Text(loan.sDes,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[800]),
              textAlign: TextAlign.center,),
            SizedBox(height:4.0),
            SizedBox(
              height: 50.0,
              child: OutlinedButton.icon(
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => DisplayView(loan:loan)),);},
                icon: Icon(Icons.fast_forward),
                label: Text('ඔබ දැනගතයුතු කරුණු'),),),
          ],
        ),
      ),
    );
  }
}
