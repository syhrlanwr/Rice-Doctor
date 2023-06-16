import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rice_disease/constant.dart';
import 'package:http/http.dart' as http;

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final fullname = TextEditingController();
  final username = TextEditingController();
  final password = TextEditingController();
  final confirmPassword = TextEditingController();

  void processSignup() async {
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
        Text('Processing...'),
      ],
    ));

    ScaffoldMessenger.of(context).showSnackBar(progress);

    var url = Uri.http(Constant.baseUrl, Constant.userEndpoint);
    var response = await http.post(url, body: {
      'fullname': fullname.text,
      'username': username.text,
      'password': password.text,
    }, headers: {
      'Accept': 'application/json',
    });

    if (response.statusCode == 201) {
      var map = jsonDecode(response.body);
      Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      final snackBar = SnackBar(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(map['message']),
            Text('Silahkan login untuk melanjutkan')
          ],
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.green,
          statusBarIconBrightness: Brightness.light,
        ),
        backgroundColor: Color.fromARGB(0, 0, 0, 0),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.eco,
                  size: 50.0,
                  color: Colors.green,
                ),
                Text(
                  'RiceScan',
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
              controller: fullname,
              decoration: const InputDecoration(
                hintText: 'Nama Lengkap',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            TextField(
              controller: username,
              decoration: const InputDecoration(
                hintText: 'Username',
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
                hintText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            ElevatedButton(
              onPressed: () {
                processSignup();
              },
              child: const Text('Signup'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text('Sudah punya akun?'),
              TextButton(
                  onPressed: () {
                    Navigator.restorablePushNamedAndRemoveUntil(
                        context, '/login', (route) => false);
                  },
                  child: const Text('Login'))
            ]),
          ],
        ),
      ),
    );
  }
}
