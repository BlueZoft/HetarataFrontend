import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CustomerForm extends StatefulWidget {
  final String askLoan;
  const CustomerForm({Key key, @required this.askLoan}) : super(key: key);


  @override
  CustomerFormState createState() {
    return CustomerFormState();
  }
}
final branchList = ['අගලවත්ත', 'ආගරපතන', 'අගුනුකොළපැලැස්ස', 'අහංගම', 'අක්කරේපත්තු', 'අක්මීමන', 'අකුරැස්ස', 'අලව්ව', 'අම්බලන්තොට', 'අඹන්පොළ', 'අම්පාර', 'ආණමඩුව', 'අනුරාධපුර', 'අනුරාධපුර නව නගරය', 'අරලගන්විල', 'අරණායක', 'ඇතුගල්පුර', 'අවිස්සාවේල්ල', 'බඩල්කුඹුර', 'බද්දේගම', 'බදුල්ල', 'බදුරලිය', 'බකමූණ', 'බලංගොඩ', 'බලපිටිය', 'බණ්ඩාරවෙල', 'බරවකුඹුක', 'බටපොල', 'බෙලිඅත්ත', 'බේරුවල', 'බිබිලේ', 'බෝගහකුඹුර', 'බෝගස්වැව', 'බෝගස්වැව SME', 'බෝවත්ත', 'බුලත්කොහුපිටිය', 'බුලත්සිංහල', 'බුත්තල', 'චෙන්කලඩි', 'චුන්නාකම්', 'දමන', 'දඹුල්ල', 'දන්තුරේ', 'දවුල්ගල', 'දෙහිඅත්තකණ්ඩිය', 'දෙහිඕවිට', 'දෙයියන්දර', 'දැරණියගල', 'දෙවිනුවර', 'දේවාලෙගම', 'දික්වැල්ල', 'දිවුලපිටිය', 'දියතලාව', 'දොඩංගොඩ', 'දුම්මලසූරිය', 'ඇහැලියගොඩ', 'ඇල්පිටිය', 'ඇඹිලිපිටිය', 'එරත්න', 'එරාවුර්', 'ගලමුණ', 'ගලෙන්බිඳුනුවැව', 'ගලේවෙල', 'ගල්ගමුව', 'ගාල්ල', 'ගල්නෑව', 'ගම්පහ', 'ගම්පොල', 'ගන්දර', 'ගිනිගත්හේන', 'ගිරාඳුරුකෝට්ටේ', 'ගිරිඋල්ල', 'ගොඩකවෙල', 'ගෝනගලපුර', 'ගෝනපතිරාව', 'ගෝනපොළ', 'හක්මන', 'හල්දුම්මුල්ල', 'හම්බන්තොට', 'හම්බන්තොට නගර 2', 'හඟුරන්කෙත', 'හපුතලේ', 'හතරලියද්ද', 'හලාවත', 'හලාවත ඉසුරු ව්‍යාපෘති', 'හෑදෙනිය', 'හැම්මතගම', 'හික්කඩුව', 'හිඟුරක්ගොඩ', 'හෝමාගම', 'හොරණ', 'ඉබ්බාගමුව', 'ඉමදුව', 'ඉංගිරිය', 'ජා-ඇළ', 'යාපනය', 'කදුරුවෙල', 'කදුරුවෙල නවනගරය', 'කහටගස්දිගිලිය', 'කහවත්ත', 'කලවාන', 'කල්මුණේ', 'කල්පිටිය', 'කළුතර', 'කලවංචිකුඩි', 'කළුඇල්ල', 'කඹුරුගමුව', 'කඹුරුපිටිය', 'කනකරායම්කුලම', 'කන්දෙකැටිය', 'මහනුවර', 'මහනුවර නගර දෙක', 'කන්තලේ', 'කරන්දෙනිය', 'කරාපිටිය', 'කාත්තන්කුඩි', 'කටුගස්තොට', 'කටුවාන', 'කෑගල්ල', 'කෑගල්ල දෙවන නගර', 'කැකනදුර', 'කැකිරාව', 'කැලණිය', 'කිලිනොච්චි', 'කිරිඳිවැල', 'කිරිඇල්ල', 'කිරිමැටියාන', 'කිරින්ද', 'කිතුල්ගල', 'කොක්කඩිචෝලේ', 'කොලොන්න', 'කොලොන්නාව', 'කොටගල', 'කොටියාකුඹුර', 'කුලියාපිටිය', 'කුරුණෑගල නගර', 'කුරුවිට', 'ලග්ගල', 'ලුණුගල', 'ලුණුගම්වෙහෙර', 'මැදවච්චිය', 'මඩකලපුව', 'මඩකලපුව නගර 2', 'මඩුල්ල', 'මහඔය', 'මහවැව', 'මහියංගනය', 'මහෝ', 'මාම්පුරි', 'මනන්පිටිය', 'මැණික්හින්න', 'මන්නාරම', 'මාරස්සන', 'මාතලේ', 'මාතර නගර', 'මතුගම', 'මාවනැල්ල', 'මාවරල', 'මාවරමංඩිය', 'මාවතගම', 'මැදගම', 'මැදිරිගිරිය', 'මීගහකිවුල', 'මීගහතැන්න', 'මැල්සිරිපුර', 'මිද්දෙණිය', 'මිහින්තලය', 'මිල්ලනිය', 'මිනුවන්ගොඩ', 'මීරිගම', 'මීගමුව', 'මිරිස්ස', 'මිරිස්වත්ත', 'මොනරාගල', 'මොරගහහේන', 'මොරොන්තුඩුව', 'මොරවක', 'මොරයාය', 'මුන්දෙල්', 'මුතුර්', 'නාරම්මල', 'නාත්තන්ඩිය', 'නාඋල', 'නවගත්තේගම', 'නාවලපිටිය', 'නෙළුම්දෙනිය', 'නෙළුව', 'නිකවැරටිය', 'නිල්දණ්ඩාහින්න', 'නින්තවූර්', 'නිට්ටඹුව', 'නිවිතිගල', 'නුගේගොඩ', 'නුවරඑළිය', 'පලකුඩා', 'පඹුරන', 'පානදුර', 'පඬුවස්නුවර', 'පන්නල', 'පස්සර', 'පරගහදෙනිය', 'පැල්මඩුල්ල', 'පේරාදෙණිය', 'පැරකුම්පුර', 'පිළියන්දල', 'පිටබැද්දර', 'පිටගල්දෙනිය', 'පිට්ටුගල', 'පොළොන්නරුව', 'පොල්පිතිගම', 'පොතුහැර', 'පොතුපිටිය', 'පොතුවිල්', 'පූජාපිටිය', 'පුලස්තිගම', 'පුළිඟුපිටි', 'පුන්ඩලු ඔය', 'පුත්තලම', 'රාගම', 'රක්වාන', 'රඹෑව', 'රඹුක්කන', 'රන්න', 'රත්නපුර', 'රත්තොට', 'රිදීගම', 'රිදීමාලියද්ද', 'රිකිල්ලගස්කඩ', 'රුවන්වැල්ල', 'සමන්තුරේ', 'සාන්ත අනාපුර', 'සෙංකඩගල', 'සෙවණගල', 'සෙවනපිටිය', 'සිරිපුර', 'සියඹලාණ්ඩුව', 'සූරියවැව', 'ශ්‍රී පලාබද්දල', 'තංගල්ල', 'තෙල්දෙණිය', 'තලාව', 'තල්ගස්වල', 'තඹුත්තේගම', 'තඹුත්තේගම නගර', 'තණමල්විල', 'තිහගොඩ', 'තිරප්පනේ', 'තිස්සමහාරාම',  'ත්‍රිකුණාමලය', 'ත්‍රිකුණාමලය නගර', 'උඩවෙල', 'උඩුදුම්බර ගම', 'උහන', 'උරගස්මංහන්දිය', 'ඌරුබොක්ක', 'ඌව මාලිගාතැන්න', 'ඌව පරණගම', 'වාලච්ච‍ෙන', 'වව්නියාව', 'වාද්දුව', 'වලගෙදර', 'වලස්මුල්ල', 'වරකාගොඩ', 'වරකපොල', 'වරාපිටිය', 'වාරියපොල', 'වත්තේගම', 'වීරකැටිය', 'වැලිගම', 'වැලිගෙපොල', 'වැලිමඩ', 'වැල්ලවාය', 'වෙන්නප්පුව', 'විල්ගමුව', 'යක්කලමුල්ල', 'යටියන්තොට'
];


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


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: Text(
              'ඔබේ තොරතුරු පහත පුරවන්න',
              style: TextStyle(
                fontSize: (20.0),
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.cyan,
            shadowColor: Colors.tealAccent[50]),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                    autofocus: true,
                    maxLength: 60,
                    decoration: InputDecoration(labelText: 'නම'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'මෙම තොරතුරු අවශ්‍යයි';
                      } else if (value.length < 4) {
                        return 'ඔබ යෙදූ නම කෙටි වැඩි ය.';
                      }
                      return null;
                    },
                    onSaved: (value) => _name = value),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                    decoration: InputDecoration(
                        labelText: 'වයස (අවු. 18ට වැඩි විය යුතුයි)'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'මෙම තොරතුරු අවශ්‍යයි';
                      } else if (int.parse(value) < 18) {
                        return 'වයස අවුරුදු 18ට වැඩි විය යුතුයි';
                      } else if (int.parse(value) > 99) {
                        return 'සැබෑ වයසක් ඇතුළත් කරන්න';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => _age = value),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                    decoration:
                        InputDecoration(labelText: 'ජාතික හැඳුනුම්පත් අංකය'),
                    validator: (value) {
                      RegExp regExp =
                          new RegExp(r'^([0-9]{9}[xXvV]|[0-9]{12})$');
                      if (value.isEmpty) {
                        return 'මෙම තොරතුරු අවශ්‍යයි';
                      } else if (!regExp.hasMatch(value)) {
                        return 'වලංගු ජාතික හැඳුනුම්පත් අංකයක් ඇතුළත් කරන්න';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => _nic = value),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                child: Row(
                  children: [
                    SizedBox(
                      width: 100.0,
                      child: Text(
                        'ස්ත්‍රී / පුරුෂ භාවය :',
                        style: TextStyle(color: Colors.black54, fontSize: 16.0),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio<String>(
                          value: 'male',
                          groupValue: _sex,
                          activeColor: Colors.teal,
                          onChanged: (value) {
                            setState(() {
                              _sex = value;
                            });
                          },
                        ),
                        title: const Text('පුරුෂ'),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio<String>(
                          value: 'female',
                          groupValue: _sex,
                          activeColor: Colors.teal,
                          onChanged: (value) {
                            setState(() {
                              _sex = value;
                            });
                          },
                        ),
                        title: const Text('ස්ත්‍රී'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                    decoration: InputDecoration(labelText: 'දුරකථන අංකය'),
                    validator: (value) {
                      RegExp regExp = new RegExp(r'^[0-9]{10}$');
                      if (value.length == 0) {
                        return 'මෙම තොරතුරු අවශ්‍යයි';
                      } else if (!regExp.hasMatch(value)) {
                        return 'ඉලක්කම් 10ක් සහිත 0න් ආරම්භ වන වලංගු දුරකථන අංකයක් \n ඇතුළත් කරන්න';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) => _telephone = value),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                    maxLength: 120,
                    decoration: InputDecoration(labelText: 'ලිපිනය'),
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'මෙම තොරතුරු අවශ්‍යයි';
                      } else {
                        return null;
                      }
                    },
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
                            "\\@" +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
                            "(" +
                            "\\." +
                            "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
                            ")+";
                        RegExp regExp = new RegExp(p);
                        if (value.isNotEmpty && !regExp.hasMatch(value)) {
                          return 'ඇතුළත් කල විද්‍යුත් ලිපිනය වලංගු නොවේ';
                        } else
                          return null;
                      },
                      onSaved: (value) => _email = value)),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: TextFormField(
                    maxLength: 250,
                    decoration:
                        InputDecoration(labelText: 'අමතර කරුණු / විමසීම්'),
                    onSaved: (value) => _inquiry = value),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              ),
              DropdownButton<String>(
                hint: Text('ඔබට ළඟම බැංකු ශාඛාව මෙතනින් තෝරන්න.'),
                icon: Icon(Icons.arrow_downward),
                iconSize: 24,
                elevation: 16,
                style: TextStyle(color: Colors.teal),
                underline: Container(
                  height: 2,
                  color: Colors.teal,
                ),
                items: branchList.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(fontSize: 20.0),
                        textAlign: TextAlign.center,
                      ));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _branch = value;
                    debugPrint(value);
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 45),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_sex.isNotEmpty &&
                      _branch.isNotEmpty &&
                      formKey.currentState.validate()) {
                    formKey.currentState.save();
                    final message = '$_name, විමසීම සාර්ථකයි.';
                    final snackBar = SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.blue,
                      duration: Duration(milliseconds: 3000),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return http.post(
                        Uri.parse('http://10.0.2.2:5000/api/userdata'),
                        headers: <String, String>{
                          'Content-Type': 'application/json; charset=UTF-8',
                        },
                        body: jsonEncode(<String, String>{
                          'name': _name,
                          'age': _age,
                          'NIC': _nic,
                          'sex': _sex,
                          'tel': _telephone,
                          'addr': _address,
                          'email': _email,
                          'inquiry': _inquiry,
                          'branch': _branch,
                        }));
                  } else {
                    final message =
                        'කරුණාකර සියළු තොරතුරු සපයා ඇතිදැයි යළි පරීක්ෂා කරන්න.';
                    final snackBar = SnackBar(
                      content: Text(message),
                      backgroundColor: Colors.deepOrange,
                      duration: Duration(milliseconds: 4000),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text('ඔබේ විමසීම මෙතැනින් අප වෙත යොමුකරන්න.'),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 25),
              ),
            ]),
          ),
        ));
  }
}
