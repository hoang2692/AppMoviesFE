import 'package:demo/modal/api.dart';
import 'package:demo/modal/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TestApis extends StatefulWidget {
  @override
  _TestApisState createState() => _TestApisState();
}

class _TestApisState extends State<TestApis> {


    Future<String> getData() async {
      http.Response response = await http.get(
        Uri.encodeFull('http://localhost:3000/api/products'),
        headers: {
          "Accept": "application/json"
        }
      );

      print(response.body);
    }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: new RaisedButton(
        child: new Text('get Data'),
        onPressed: getData,
      )
    );
  }
}