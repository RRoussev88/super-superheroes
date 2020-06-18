import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'models/superhero/Superhero.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String baseUrl =
      'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api';

  Future<void> _loadHeroes() async {
    var response = await http.get("$baseUrl/all.json");
    print('Response status: ${response.statusCode}');
    List<dynamic> allHeroes = jsonDecode(response.body);
    print("Heroes ${allHeroes.length}");
    if (allHeroes[0] != null) {
      Superhero hero = Superhero.fromJson(allHeroes[0]);
      print("New hero ${hero.toJson()}");
    }
  }

  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Super Superheroes'),
      ),
      body: Center(),
      floatingActionButton: FloatingActionButton(
        onPressed: _loadHeroes,
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}
