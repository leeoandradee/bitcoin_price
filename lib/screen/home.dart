import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _price = "0";

  void _getPrice() async {
    String url = "https://blockchain.info/ticker";
    http.Response response = await http.get(url);

    Map<String, dynamic> responseData = json.decode(response.body);
    setState(() {
      _price = responseData["BRL"]["buy"].toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: EdgeInsets.all(32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("assets/images/bitcoin.png"),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 30),
                  child: Text(
                    "R\$ " + _price,
                    style: TextStyle(fontSize: 35),
                  ),
                ),
                RaisedButton(
                    onPressed: _getPrice,
                    child: Text(
                      "UPDATE",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    color: Colors.orange,
                    padding: EdgeInsets.fromLTRB(30, 15, 30, 12))
              ],
            ),
          )),
    );
  }
}
