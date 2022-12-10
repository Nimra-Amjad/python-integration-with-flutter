import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:textappp/function.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String url = "";
  var data;
  String output = 'Initial Output';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Simple Flask App"),
      ),
      body: Center(
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                onChanged: (value) {
                  url = 'http://127.0.0.1:5000/api?query=' + value.toString();
                },
              ),
              TextButton(
                  onPressed: () async {
                    data = await fetchdata(url);
                    var decoded = jsonDecode(data);
                    setState(() {
                      output = decoded['output'];
                    });
                  },
                  child: Text("Fetch ASCII Value")),
              Text(output)
            ],
          ),
        ),
      ),
    );
  }
}
