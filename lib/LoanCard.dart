
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'loanData.dart';

class LoanCard extends StatelessWidget {

  final LoanClass loan;
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
                  color: Colors.grey[800]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height:4.0),
            OutlineButton.icon(
              highlightElevation:0.5,
              highlightColor: Colors.teal[200],
              highlightedBorderColor: Colors.teal[300],
              onPressed: (){},
              icon: Icon(Icons.fast_forward),
              label: Text('ඔබ දැනගතයුතු කරුණු'),
            ),

          ],
        ),
      ),
    );
  }
}
