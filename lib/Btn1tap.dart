import 'package:flutter/material.dart';
import 'loanData.dart';
import 'LoanCard.dart';


class Btn1tap extends StatelessWidget {

  final List<LoanClass> loanlist;
  Btn1tap ({this.loanlist});

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
        children: loanlist.map((loan) => LoanCard(loan:loan)).toList(),
      ),
      ),
      backgroundColor: Colors.cyan[100],
    );
  }
 }