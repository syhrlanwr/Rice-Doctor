import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rice_disease/constant.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final username = TextEditingController();
  final password = TextEditingController();

  void isLoggedIn() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    if (sh.getString('access_token') != null &&
        sh.getString('refresh_token') != null) {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  void initState() {
    super.initState();

    isLoggedIn();
  }

  void processLogin() async {
    final progress = SnackBar(
        content: Row(
      children: const [
        SizedBox(
          child: CircularProgressIndicator(),
          height: 20.0,
          width: 20.0,
        ),
        SizedBox(
          width: 20.0,
        ),
        Text('Logging in...'),
      ],
    ));

    ScaffoldMessenger.of(context).showSnackBar(progress);

    var url = Uri.http(Constant.baseUrl, Constant.authEndpoint);

    var response = await http.post(url, body: {
      'username': username.text,
      'password': password.text,
    }, headers: {
      'Accept': 'application/json',
    });

    var map = jsonDecode(response.body);

    if (response.statusCode == 201) {
      var refreshToken = map['data']['refreshToken'];
      var accessToken = map['data']['accessToken'];
      var userId = map['data']['id'];
      SharedPreferences sh = await SharedPreferences.getInstance();
      sh.setString('refresh_token', refreshToken);
      sh.setString('access_token', accessToken);
      sh.setString('user_id', userId);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      Navigator.pushReplacementNamed(context, '/home');
    }

    final snackBar = SnackBar(
      content: Text(map['message']),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.green,
          statusBarIconBrightness: Brightness.light,
        ),
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ListView(
                shrinkWrap: true,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(
                        Icons.eco,
                        size: 50.0,
                        color: Colors.green,
                      ),
                      Text(
                        'RiceDoctor',
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  TextField(
                    controller: username,
                    decoration: const InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  TextField(
                    controller: password,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      processLogin();
                    },
                    child: const Text('Login'),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Tidak punya akun?'),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, '/signup', (route) => false);
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
