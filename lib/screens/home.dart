import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import './superhero_screen.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String _baseUrl =
      'https://cdn.rawgit.com/akabab/superhero-api/0.2.0/api';
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  VoidCallback _showBottomSheetCallback;

  List<Superhero> _superHeroes = [];
  List<Superhero> _filteredSuperHeroes = [];
  bool isLodaingHeroes = false;

  Future<void> _loadHeroes() async {
    if (_superHeroes.length > 0) {
      return;
    }
    setState(() {
      isLodaingHeroes = true;
    });
    var response = await http.get("$_baseUrl/all.json");
    if (response.statusCode == 200) {
      List<dynamic> decodedHeroes = jsonDecode(response.body);
      if (decodedHeroes.length > 0) {
        setState(() {
          _superHeroes =
              decodedHeroes.map((hero) => Superhero.fromJson(hero)).toList();
          _filteredSuperHeroes = [..._superHeroes];
        });
      }
    } else {
      // TODO: Show error message
    }
    setState(() {
      isLodaingHeroes = false;
    });
  }

  void _filterHeroes() {
    setState(() {
      _filteredSuperHeroes = _superHeroes
          .where(
            (hero) => hero.name.toLowerCase().contains(_searchController.text),
          )
          .toList();
    });
  }

  void _showBottomSheet() {
    setState(() {
      _showBottomSheetCallback = null;
    });

    _scaffoldKey.currentState
        .showBottomSheet(
          (context) => Container(
            padding: const EdgeInsets.all(10),
            color: Theme.of(context).primaryColor.withOpacity(0.5),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: "Superhero name",
                labelStyle: TextStyle(
                  color: Theme.of(context).accentColor,
                ),
                helperText: "Search superhero by name",
                helperStyle: TextStyle(
                  fontSize: 16,
                ),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              style: TextStyle(
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
        )
        .closed
        .whenComplete(() {
      if (mounted) {
        setState(() {
          _showBottomSheetCallback = _showBottomSheet;
        });
      }
    });
  }

  @override
  initState() {
    super.initState();
    _searchController.addListener(_filterHeroes);
    _showBottomSheetCallback = _showBottomSheet;
  }

  @override
  void dispose() {
    super.dispose();
    _searchController.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          title: Text('Super Superheroes'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: _showBottomSheetCallback,
            ),
          ],
        ),
        body: Center(
          child: isLodaingHeroes
              ? CircularProgressIndicator()
              : ListView.separated(
                  separatorBuilder: (context, index) => Divider(
                    color: Theme.of(context).accentColor.withAlpha(45),
                  ),
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) =>
                              SuperheroScreen(_filteredSuperHeroes[index]),
                        ),
                      );
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        _filteredSuperHeroes[index].images.xs,
                      ),
                    ),
                    title: Text(
                      _filteredSuperHeroes[index].name,
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.favorite_border),
                      color: Colors.redAccent,
                      onPressed: () {},
                    ),
                  ),
                  itemCount: _filteredSuperHeroes.length,
                ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _loadHeroes,
          tooltip: 'Load superheroes',
          child: Icon(Icons.add),
        ),
      );
}
