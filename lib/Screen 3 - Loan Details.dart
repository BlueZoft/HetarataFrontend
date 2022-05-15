import 'package:flutter/material.dart';
import 'Loan table and class.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'Screen 4 - User Form.dart';

class DisplayView extends StatelessWidget {
  final LoanClass loan;

  DisplayView({this.loan});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyan[100],
      appBar: AppBar(
          title: Text(
            loan.lName,
            style: TextStyle(
              fontSize: (25.0),
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.cyan,
          shadowColor: Colors.tealAccent[50]),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 1,
        itemCount: 1,
        itemBuilder: (BuildContext context, int index) =>
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white70,
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('කවුරුන් සඳහා ද? \n \n' + loan.forWho,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white70,
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('උපරිම ණය මුදල - \n \n' + loan.maxLimit,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white70,
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text('ණය පොළිය - \n \n' + loan.iRate,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white70,
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child:
                    Text('උපරිම ආපසු ගෙවීමේ කාල සීමාව - \n \n' + loan.maxRepay,
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                        textAlign: TextAlign.center),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              color: Colors.white70,
              elevation: 10.0,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                    'සුදුසුකම් ලබන ව්‍යාපෘති/ව්‍යාපාර - \n \n' + loan.eligibles,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                    textAlign: TextAlign.center),
              ),
            ),
          ),
        ]),
        staggeredTileBuilder: (int index) => new StaggeredTile.fit(1),
        mainAxisSpacing: 8.0,
        crossAxisSpacing: 4.0,
      ),
      bottomNavigationBar: SizedBox(
          height: 70,
          child: ElevatedButton.icon(
            label: Text(
              "මෙම මූල්‍ය පහසුකම පිළිබඳ විමසීමට පිවිසෙන්න...",
              style: TextStyle(
                fontSize: 18.0,
              ),
              textAlign: TextAlign.center,
            ),
            icon: Icon(Icons.arrow_forward),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white70),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => CustomerForm(askLoan:loan.lName)),
              );
            },
          )),
    );
  }
}
