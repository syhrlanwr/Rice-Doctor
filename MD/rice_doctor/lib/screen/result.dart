import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:rice_disease/constant.dart';

class Result extends StatefulWidget {
  final String image;
  const Result({Key? key, required this.image}) : super(key: key);

  @override
  _ResultState createState() => _ResultState(image);
}

class _ResultState extends State<Result> {
  final String image;
  _ResultState(this.image);

  @override
  void initState() {
    super.initState();
  }

  Future<Map<String, dynamic>> predict() async {
    File img = File(image);
    var url = Uri.https(Constant.modelUrl, Constant.predictEndpoint);
    var request = http.MultipartRequest('POST', url);
    request.files.add(await http.MultipartFile.fromPath('file', img.path));
    var response = await request.send();
    if (response.statusCode == 200) {
      var map = jsonDecode(await response.stream.bytesToString());
      debugPrint(map.toString());
      return map;
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    // showDialog(
    //   context: context,
    //   builder: (context) {
    //     return const AlertDialog(
    //       content: Row(
    //         children: [
    //           SizedBox(
    //             child: CircularProgressIndicator(),
    //             height: 20.0,
    //             width: 20.0,
    //           ),
    //           SizedBox(
    //             width: 20.0,
    //           ),
    //           Text('Predicting...'),
    //         ],
    //       ),
    //     );
    //   },
    // );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result'),
      ),
      body: Center(
        child: FutureBuilder(
          future: predict(),
          builder: (context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
            debugPrint(snapshot.data.toString());
            if (snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.file(
                    File(image),
                    height: 200.0,
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text(
                    'Hasil Prediksi : ${snapshot.data!['result']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Akurasi : ${snapshot.data!['accuracy']}',
                    style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return BackdropFilter(
                  filter: ColorFilter.mode(
                      Colors.black.withOpacity(0.5), BlendMode.srcOver),
                  child: const Dialog(
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          SizedBox(
                            child: CircularProgressIndicator(),
                            height: 20.0,
                            width: 20.0,
                          ),
                          SizedBox(
                            width: 20.0,
                          ),
                          Text('Memprediksi...'),
                        ],
                      ),
                    ),
                  ));
            }
          },
        ),
      ),
    );
  }
}
