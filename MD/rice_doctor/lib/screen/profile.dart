import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rice_disease/constant.dart';
import 'package:http/http.dart' as http;
import 'package:rice_disease/models/users.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  Future<Users> getUser() async {
    SharedPreferences sh = await SharedPreferences.getInstance();
    var userId = sh.getString('user_id');
    var url = Uri.http(Constant.baseUrl, '${Constant.userEndpoint}/$userId');
    var response = await http.get(url, headers: {
      'Accept': 'application/json',
    });
    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      return Users.fromJson(map);
    } else {
      throw Exception('Failed to load user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil'),
      ),
      body: FutureBuilder<Users>(
        future: getUser(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView(
              children: [
                ListTile(
                  title: const Text('User ID'),
                  subtitle: Text(snapshot.data!.id),
                ),
                ListTile(
                  title: const Text('Nama Lengkap'),
                  subtitle: Text(snapshot.data!.fullname),
                ),
                ListTile(
                  title: const Text('Username'),
                  subtitle: Text(snapshot.data!.username),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
