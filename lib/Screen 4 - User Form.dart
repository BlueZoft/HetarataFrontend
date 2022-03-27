import 'package:flutter/material.dart';

class CustomerForm extends StatefulWidget {
  const CustomerForm({Key key}) : super(key: key);
  @override
  CustomerFormState createState() {
    return CustomerFormState();
  }}


class CustomerFormState extends State<CustomerForm> {
  final formKey = GlobalKey<FormState>();

  String _name = '';
  String _nic = '';
  String _age = '';
  String _sex = 'male';
  String _telephone = '';
  String _address = '';
  String _email = '';
  String _inquiry = '';

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
                        int value1 = int.parse(value);
                        if (value.isEmpty) {
                          return 'මෙම තොරතුරු අවශ්‍යයි';}
                        else if (value1<18 || value1 > 99) {
                          return 'වලංගු වයසක් ඇතුළත් කරන්න';}
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
                        if (value.isEmpty) {
                          return 'මෙම තොරතුරු අවශ්‍යයි';}
                        //TODO Fix NIC RegExp
                        String p =  r'(^[0-9]{10}v$|V$|x|X|)';
                        RegExp regExp = new RegExp(p);
                        if (regExp.hasMatch(value)) {
                          return null;}
                        else
                          return 'ඇතුළත් කල ජාතික හැඳුනුම්පත් අංකය වලංගු නොවේ';},
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
                        String pattern = r'(^([0-9]{10}$)';
                        RegExp regExp = new RegExp(pattern);
                        if (value.length == 0) {
                          return 'මෙම තොරතුරු අවශ්‍යයි';}
                        else if (!regExp.hasMatch(value)) {
                          return 'ඉලක්කම් 10ක් සහිත 0න් ආරම්භ වන වලංගු දුරකථන අංකයක් ඇතුළත් කරන්න';}
                        else {return null;}},
                      onSaved: (value) => _telephone = value),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
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
                        if (regExp.hasMatch(value)) {
                          return null;}
                        else return 'වලංගු විද්‍යුත් ලිපිනය ඇතුළත් කරන්න';},
                      onSaved: (value) => _email = value),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: TextFormField(
                      decoration: InputDecoration(
                          labelText: 'අමතර කරුණු / විමසීම්'),
                      onSaved: (value) => _inquiry = value),
                ),

                Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),),

                DropdownButton<String>(
                    hint:Text ('ඔබට ළඟම බැංකු ශාඛාව මෙතනින් තෝරන්න.'),
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24, elevation: 16, style: TextStyle(color: Colors.teal),
                    underline: Container(
                      height: 2,
                      color: Colors.teal,),
                    onChanged: (String newValue) {
                      setState(() {});},
                    items: <String>['Akkaraipattu', 'Agarapathana', 'Matara', 'Colombo','Anuradapura','havelock town','kochchi','ayyo','salaryyyy','balamu mokada wenne','deyiyandara','dewundara','nagarabada','haal pol','sirikurusa','wanaatha']
                        .map<DropdownMenuItem<String>>((String value){
                      return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value,
                            style: TextStyle(fontSize: 20.0), textAlign: TextAlign.center,));
                    }).toList()),

                Padding(padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),),

                ElevatedButton (
                  onPressed: () {
                    final isValid = formKey.currentState.validate();
                    if (isValid){
                      formKey.currentState.save();
                      final message = '$_name, විමසීම සාර්ථකයි.';
                      final snackBar =  SnackBar(
                        content: Text(message),
                        backgroundColor:Colors.cyan,
                        duration: Duration(milliseconds: 900),);
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                    else {
                      return 'ඇතුළත් කළ තොරතුරු සම්පූර්ණ නොවේ';}},
                  child: Text('ඔබේ විමසීම මෙතැනින් අප වෙත යොමුකරන්න.'),)

               ]
              ),

            ),


      ));}
