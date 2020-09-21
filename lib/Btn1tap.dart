import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loanData.dart';
import 'LoanCard.dart';

class Btn1tap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ඔබ සඳහාම වන මූල්‍ය පහසුකම්'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        shadowColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
        children: loan1.map((loan) => LoanCard(loan:loan)).toList(),
      ),
      ),
      backgroundColor: Colors.cyan[200],
    );
  }
 }

class Btn2tap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ඔබ සඳහාම වන මූල්‍ය පහසුකම්'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        shadowColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: loan2.map((loan) => LoanCard(loan:loan)).toList(),
        ),
      ),
      backgroundColor: Colors.cyan[200],
    );
  }
}
class Btn3tap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ඔබ සඳහාම වන මූල්‍ය පහසුකම්'),
        centerTitle: true,
        backgroundColor: Colors.cyan,
        shadowColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: loan3.map((loan) => LoanCard(loan:loan)).toList(),
        ),
      ),
      backgroundColor: Colors.cyan[200],
    );
  }
}
