import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loanData.dart';

class Btn1tap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('"හෙටරට" ව්‍යවසායකත්ව විහිදුම'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        shadowColor: Colors.lightBlue,
      ),
      body:Column(
        children: loan1.map((loan) => loanTemplate(loan)).toList(),
      ),
      backgroundColor: Colors.cyan[200],
    );
  }


Widget loanTemplate(loan){
  return LoanCard(loan:loan);
}}

class LoanCard extends StatelessWidget {

  final loan loan;
  LoanCard ({this.loan});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical:10.0, horizontal: 10.0),
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(loan.lName,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black87),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 3.0,),
            Text(loan.sDes,
              style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey[800]),)
          ],
        ),
      ),
    );
  }
}
