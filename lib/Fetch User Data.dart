import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

Future<User> fetchUser() async{
  final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/userdata'));

  if (response.statusCode == 200) {
    return User.fromJson(jsonDecode(response.body));
  }
  else {
    throw Exception('Failed to load user');
  }
}

class User {
  final String nic;
  final String createdAt;

  const User({this.nic, this.createdAt});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        nic: json['NIC'],
        createdAt: json['createdAt']
    );
  }
}

Future<User> futureUser;

// @override
// void initState() {
//   super.initState();
//   futureUser = fetchUser();
// }
