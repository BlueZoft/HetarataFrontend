
import 'package:flutter/material.dart';


String _name;
String _age;
String _sex;
String _telephone;
String _address;
String _email;
String _inquiry;

// For the specific loan they looked at
String _loaninterest;


class CustomerForm extends StatefulWidget {
  const CustomerForm({Key key}) : super(key: key);
  @override
  CustomerFormState createState() {
    return CustomerFormState();

  }}

class CustomerFormState extends State<CustomerForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            autofocus: true,
              decoration: InputDecoration(
                  labelText: 'නම'),
              validator: (value) {
                if (value.isEmpty) {
                  return 'මෙම තොරතුරු අවශ්‍යයි';}
                else if(value.length < 4) {
                  return 'ඔබ යෙදූ නම කෙටි වැඩි ය.';}
                return null;},
              onSaved: (String value) {
                _name = value; }),

          TextFormField(
            decoration: InputDecoration(
                labelText: 'වයස (අවු. 18ට වැඩි විය යුතුයි)'),
            validator: (value1) {
              int vAlue;
              vAlue = int.parse(value1);
              if (value1.isEmpty) {
                return 'මෙම තොරතුරු අවශ්‍යයි';}
              else if (vAlue<18 || vAlue > 99) {
                return 'වලංගු වයසක් ඇතුළත් කරන්න';}
              else {
                return null;}},
            onSaved: (value1) {
              _age = value1; },),

          TextFormField(
            decoration: InputDecoration(
                labelText: 'ජාතික හැඳුනුම්පත් අංකය'),
            validator: (value1) {
              int vAlue;
              vAlue = int.parse(value1);
              if (value1.isEmpty) {
                return 'මෙම තොරතුරු අවශ්‍යයි';}
              else if (vAlue<18 || vAlue > 99) {
                return 'වලංගු වයසක් ඇතුළත් කරන්න';}
              else {
                return null;}},
            onSaved: (value1) {
              _age = value1; },),

          Row(
            children:[
              Expanded(
                child:Text('ස්ත්‍රී / පුරුෂ භාවය :',
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16.0),),),
              Text('ස්ත්‍රී '),
              Radio(
                value: 1,
                groupValue:1,
                activeColor: Colors.teal,
                onChanged: (val){
                  setState(() {
                    val = 1;});},),
              SizedBox(width: 20.0),
              Text('පුරුෂ'),
              Radio(
                value: 2,
                groupValue:1,
                activeColor: Colors.teal,
                onChanged: (val){
                  setState(() {
                    val = 2;});},),],),

          TextFormField(
            decoration: InputDecoration(
                labelText: 'දුරකථන අංකය'),
            validator: (value2) {
              String patttern = r'(^([0-9]{10}$)';
              RegExp regExp = new RegExp(patttern);
              if (value2.length == 0) {
                return 'මෙම තොරතුරු අවශ්‍යයි';}
              else if (!regExp.hasMatch(value2)) {
                return 'ඉලක්කම් 10ක් සහිත 0න් ආරම්භ වන වලංගු දුරකථන අංකයක් ඇතුළත් කරන්න';}
              else {
                return null;}},
            onSaved: (value2) {
              _telephone = value2; },),

          TextFormField(
              decoration: InputDecoration(
                  labelText: 'ලිපිනය'),
              validator: (value3) {
                if (value3.isEmpty) {
                  return 'කරුණාකර තොරතුරු ඇතුළු කරන්න';}
                else {
                  return null;}},
              onSaved: (String value3) {
                _address = value3;}),

          TextFormField(
              decoration: InputDecoration(
                  labelText: 'විද්‍යුත් ලිපිනය (තිබේනම්)'),
              keyboardType: TextInputType.emailAddress,
              validator: (value4) {if (value4.isEmpty) {
                return "Enter email address";}
              String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                  "\\@" + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" + "(" + "\\." +
                  "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+";
              RegExp regExp = new RegExp(p);
              if (regExp.hasMatch(value4)) {
                return null;}
              else
                return 'Email is not valid';},
              onSaved: (value4) {
                _email = value4;}),

          TextFormField(
              decoration: InputDecoration(
                  labelText: 'අමතර කරුණු / විමසීම්'),
              onSaved: (value5) {
                _inquiry = value5;}),

      Padding(
        padding: const EdgeInsets.fromLTRB(0, 22, 0, 10),),

          DropdownButton<String>(
              hint:Text ('ඔබට ළඟම බැංකු ශාඛාව මෙතනින් තෝරන්න.'),
              icon: Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: TextStyle(color: Colors.teal),
              underline: Container(
                height: 2,
                color: Colors.teal,),
              onChanged: (String newValue) {
                setState(() {
                });},
              //
              items: <String>['Akkaraipattu', 'Agarapathana', 'Matara', 'Colombo','Anuradapura','havelock town','kochchi','ayyo','salaryyyy','balamu mokada wenne','deyiyandara','dewundara','nagarabada','haal pol','sirikurusa','wanaatha']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                      style: TextStyle(
                          fontSize: 20.0), textAlign: TextAlign.center,));
              }).toList()),


          //
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 25, 0, 0),),

          ElevatedButton(

            onPressed: () {
              if (_formKey.currentState.validate()) {
                ScaffoldMessenger.of(context).showSnackBar( SnackBar
                  (content: Text("thorathuru"),duration: Duration(milliseconds: 900),),);}
              },
            child: Text('ඔබේ විමසීම මෙම බොත්තම එබීමෙන් සිදුකළ හැකියි.'),),
        ],
      ),
    );
  }
}
