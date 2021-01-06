import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomerForm extends StatefulWidget {
  @override
  CustomerFormState createState() {
    return CustomerFormState();
  }
}

class CustomerFormState extends State<CustomerForm> {

  String _name;
  String _age;
  String _sex;
  String _telephone;
  String _address;
  String _email;
  String _inquiry;

  final _formKey = GlobalKey<FormState>();

  String dropdownValue = 'ඔබට ළඟම බැංකු ශාඛාව තෝරන්න.';
  int group = 1;


  Widget _buildname(){
    return TextFormField(
        decoration: InputDecoration(labelText: 'නම'),
        validator: (String value) {
          if (value.isEmpty) {
            return 'කරුණාකර තොරතුරු ඇතුළු කරන්න';}
          else if(value.length < 4) {
            return 'ඔබ යෙදූ නම කෙටි වැඩි ය.';}
          return null;
          },
          onSaved: (String value) {
          _name = value;
    },
    );
  }
  Widget _buildage(){
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'වයස (අවු. 18ට වැඩි විය යුතුයි)'
        ),
        validator: (String value) {
          int vAlue;
          vAlue = int.parse(value);
          if (value.isEmpty) {
            return 'කරුණාකර තොරතුරු ඇතුළු කරන්න';}
          else if (vAlue<18 || vAlue > 99) {
            return 'Please enter valid age ane';}
          else {
            return null;}},
          onSaved: (String value) {
          _age = value;
        }
    );
  }
  Widget _buildsex(){
    return Row(
      children:[
        Expanded(
          child:Text('ස්ත්‍රී / පුරුෂ භාවය :',
            style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0),),
        ),

        Text('ස්ත්‍රී '),
        Radio(
          value: 1,
          groupValue: group,
          activeColor: Colors.teal,
          onChanged: (val){
            setState(() {
              group = val;});},
        ),
        SizedBox(width: 20.0),
        Text('පුරුෂ'),
        Radio(
          value: 2,
          groupValue:group,
          activeColor: Colors.teal,
          onChanged: (val){
            setState(() {
              group = val;});},
        ),
      ],
    );
  }
  Widget _buildtelephone(){
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'දුරකථන අංකය'),
        validator: (value) {
          String patttern = r'(^([0-9]{10}$)';
          RegExp regExp = new RegExp(patttern);
          if (value.length == 0) {
            return 'Please enter mobile number';
          }
          else if (!regExp.hasMatch(value)) {
            return 'Please enter valid mobile number';
          }
          else {
            return null;}},
        onSaved: (String value) {
      _telephone = value;
    }
    );
  }
  Widget _buildaddress(){
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'ලිපිනය'),
        validator: (value) {
          if (value.isEmpty) {
            return 'කරුණාකර තොරතුරු ඇතුළු කරන්න';
          }
          else {
            return null;}},
        onSaved: (String value) {
          _address = value;
        }
    );
  }
  Widget _buildemail(){
    return TextFormField(
        decoration: InputDecoration(
            labelText: 'විද්‍යුත් ලිපිනය (තිබේනම්)'),
        validator: (value) {
          if (value.isEmpty) {
            return 'කරුණාකර තොරතුරු ඇතුළු කරන්න';
          }
          else {
            return null;}},
        onSaved: (String value) {
          _email = value;
        }
    );
  }

  Widget _buildinquiry(){
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'අමතර කරුණු / විමසීම්'),
        onSaved: (String value) {
          _inquiry = value;
        }

    );
  }
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
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(key: _formKey,
            child: Column(
                children: <Widget>[
                  DropdownButton<String>(
                      value: dropdownValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 24,
                      elevation: 16,
                      style: TextStyle(color: Colors.teal),
                      underline: Container(
                        height: 2,
                        color: Colors.teal,),
                      onChanged: (String newValue) {
                        setState(() {
                          dropdownValue = newValue;});
                        },
                      items: <String>['ඔබට ළඟම බැංකු ශාඛාව තෝරන්න.','Akkaraipattu', 'Agarapathana', 'Matara', 'Colombo','Anuradapura','havelock town','kochchi','ayyo','salaryyyy','balamu mokada wenne','deyiyandara','dewundara','nagarabada','haal pol','sirikurusa','wanaatha']
                          .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                                value: value,
                                child: Text(value,
                                  style: TextStyle(
                                      fontSize: 20.0),
                                  textAlign: TextAlign.center,));
                                  }).toList()),
                  SizedBox(height:19.0),
                  _buildname(),
                  SizedBox(height:19.0),
                  _buildage(),
                  SizedBox(height:19.0),
                  _buildsex(),
                  SizedBox(height:19.0),
                  _buildtelephone(),
                  SizedBox(height:19.0),
                  _buildaddress(),
                  SizedBox(height:19.0),
                  _buildemail(),
                  SizedBox(height:19.0),
                  _buildinquiry(),
                  SizedBox(height:19.0),
                  RaisedButton(
                    onPressed: () {
                      if (!_formKey.currentState.validate())
                        return;
                      else {
                        Scaffold.of(context)
                            .showSnackBar(SnackBar(content: Text('Processing Data')));
                        _formKey.currentState.save();

                      }

                            },
                    child: Text('Submit'),),
                ]
            ),
          ),
        ),
      ),
    );
  }}