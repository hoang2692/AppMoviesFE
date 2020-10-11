import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DatApi extends StatefulWidget {
  @override
  _DatApiState createState() => _DatApiState();
}

class _DatApiState extends State<DatApi> {

    List dataProduct;

    Future<String> getData() async {
    var response = await http.get(
      Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
      headers: {
        "Accept": "application/json"
      }
    );
    setState(() {
        dataProduct = json.decode(response.body);
    });
    return "Success!";
  }


  @override
  void initState(){
    this.getData();
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Container();
  }
}