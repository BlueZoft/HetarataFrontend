import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// import 'Fetch User Data.dart';


class CustomerForm extends StatefulWidget {
  const CustomerForm({Key key}) : super(key: key);
  @override
  CustomerFormState createState() {
    return CustomerFormState();
  }}

class CustomerFormState extends State<CustomerForm> {
  final formKey = GlobalKey<FormState>();

  String _name = '';
  String _age = '';
  String _nic = '';
  String _sex = '';
  String _telephone = '';
  String _address = '';
  String _email = '';
  String _inquiry = '';
  String _branch = '';
  final branchList = ['Matara', 'Colombo', 'Galle','Pamburana','Deniyaya'];

  @override
    Widget build(BuildContext context) => Scaffold(
      resizeToAvoidBottomInset : false,
     appBar: AppBar(
      title: Text('ඔබේ තොරතුරු පහත පුරවන්න',
      style: TextStyle(
      fontSize: (20.0),),),
      centerTitle: true,
      backgroundColor: Colors.cyan,
      shadowColor: Colors.tealAccent[50] ),
      body:SingleChildScrollView(
        child: Form(
            key: formKey,
              child: Column(children:[
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                      autofocus: true,
                      maxLength: 80,
                      decoration: InputDecoration(labelText: 'නම'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'මෙම තොරතුරු අවශ්‍යයි';}
                        else if(value.length < 4) {
                          return 'ඔබ යෙදූ නම කෙටි වැඩි ය.';}
                        return null;},
                      onSaved: (value) => _name = value),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                      decoration: InputDecoration(labelText: 'වයස (අවු. 18ට වැඩි විය යුතුයි)'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'මෙම තොරතුරු අවශ්‍යයි';}
                        else if (int.parse(value)<18) {
                          return 'වයස අවුරුදු 18ට වැඩි විය යුතුයි';}
                        else if (int.parse(value) > 99) {
                          return 'සැබෑ වයසක් ඇතුළත් කරන්න';}
                        else {
                          return null;}},
                      onSaved: (value) => _age = value),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'ජාතික හැඳුනුම්පත් අංකය'),
                      validator: (value) {
                         RegExp regExp = new RegExp(r'^([0-9]{9}[xXvV]|[0-9]{12})$');
                        if (value.isEmpty) {
                          return 'මෙම තොරතුරු අවශ්‍යයි';}
                        else if (!regExp.hasMatch(value)) {
                          return 'වලංගු ජාතික හැඳුනුම්පත් අංකයක් ඇතුළත් කරන්න';}
                        else {return null;}},
                      onSaved: (value) => _nic = value),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Row(
                    children:[
                      SizedBox(
                        width: 100.0,
                        child: Text('ස්ත්‍රී / පුරුෂ භාවය :',
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 16.0),),
                      ),
                      Expanded(
                        child: ListTile(
                          leading:Radio<String>(
                            value:'male',
                            groupValue: _sex,
                            activeColor: Colors.teal,
                            onChanged: (value) {
                              setState(() {_sex = value;});},),
                          title: const Text('පුරුෂ'),),
                      ),
                      Expanded(
                        child:  ListTile(
                        leading:Radio<String>(
                          value:'female',
                          groupValue: _sex,
                          activeColor: Colors.teal,
                          onChanged: (value) {setState(() {_sex = value;});},),
                        title: const Text('ස්ත්‍රී'),),),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'දුරකථන අංකය'),
                      validator: (value) {
                        RegExp regExp = new RegExp(r'^[0-9]{10}$');
                        if (value.length == 0) {
                          return 'මෙම තොරතුරු අවශ්‍යයි';}
                        else if (!regExp.hasMatch(value)) {
                          return 'ඉලක්කම් 10ක් සහිත 0න් ආරම්භ වන වලංගු දුරකථන අංකයක් \n ඇතුළත් කරන්න';}
                        else {return null;}},
                      onSaved: (value) => _telephone = value),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    maxLength: 250,
                      decoration: InputDecoration(
                          labelText: 'ලිපිනය'),
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'මෙම තොරතුරු අවශ්‍යයි';}
                        else {return null;}},
                      onSaved: (value) => _address = value),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'විද්‍යුත් ලිපිනය (තිබේනම්)'),
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
                            "\\@" + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" + "(" + "\\." +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" + ")+";
                        RegExp regExp = new RegExp(p);
                        if (value.isNotEmpty && !regExp.hasMatch(value)) {
                          return 'ඇතුළත් කල විද්‍යුත් ලිපිනය වලංගු නොවේ';}
                        else
                          return null;},
                      onSaved: (value) => _email = value)
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                    maxLength: 500,
                      decoration: InputDecoration(
                          labelText: 'අමතර කරුණු / විමසීම්'),
                      onSaved: (value) => _inquiry = value),
                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),),
                DropdownButton<String>(
                  hint: Text('ඔබට ළඟම බැංකු ශාඛාව මෙතනින් තෝරන්න.'),
                  icon: Icon(Icons.arrow_downward),
                  iconSize: 24,
                  elevation: 16,
                  style: TextStyle(color: Colors.teal),
                  underline: Container(height: 2, color: Colors.teal,),

                  items: branchList.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 20.0),
                          textAlign: TextAlign.center,));}).toList(),
                  onChanged: (value) {setState(() {_branch = value; debugPrint(value);});
                  },

                ),
                Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),),

                ElevatedButton (

                  onPressed: () {
                    if (_sex.isEmpty){
                      final message = 'ස්ත්‍රි පුරුෂ බව ඇතුළත් කරන්න';
                      final snackBar =  SnackBar(
                        content: Text(message),
                        backgroundColor:Colors.redAccent,
                        duration: Duration(milliseconds: 3000),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);}
                    else
                    if (_branch.isEmpty){
                      final message = 'බැංකු ශාඛාව ඇතුළත් කරන්න';
                      final snackBar =  SnackBar(
                        content: Text(message),
                        backgroundColor:Colors.redAccent,
                        duration: Duration(milliseconds: 3000),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);}
                    else
                   // final timeNow = new DateTime.now();
                   //  final lastEntry = DateTime.parse(futureUser.createdAt);
                   //  final difference = (timeNow.difference(lastEntry)).inHours;
                   //  if (futureUser.nic = _nic && difference<24) {
                   //    final message = '‍පෙර විමසීම කර කාලය ඉකුත් වී නැත';
                   //    final snackBar =  SnackBar(
                   //      content: Text(message),
                   //      backgroundColor:Colors.redAccent,
                   //      duration: Duration(milliseconds: 3000),);
                   //    ScaffoldMessenger.of(context).showSnackBar(snackBar);

                    if (formKey.currentState.validate()){
                      formKey.currentState.save();
                      final message = '$_name, විමසීම සාර්ථකයි.';
                      final snackBar =  SnackBar(
                        content: Text(message),
                        backgroundColor:Colors.blue,
                        duration: Duration(milliseconds: 3000),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return http.post(
                        Uri.parse('http://10.0.2.2:5000/api/userdata'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',},
                          body: jsonEncode(<String, String>{
                            'name': _name,
                            'age': _age,
                            'NIC': _nic,
                            'sex': _sex,
                            'tel': _telephone,
                            'addr': _address,
                            'email': _email,
                            'inquiry': _inquiry,
                            'branch': _branch
                          })
                      );
                    }},
                  child: Text('ඔබේ විමසීම මෙතැනින් අප වෙත යොමුකරන්න.'),
                )
               ]
              ),
            ),
      ));}
