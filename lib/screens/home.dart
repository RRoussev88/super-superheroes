import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart' as AppConstants;
import '../models/superhero/Superhero.dart';
import '../components/superhero_tile.dart';
import '../components/bottom_sheet_search.dart';
import '../components/error_message.dart';
import '../components/superhero_grid_tile.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final TextEditingController _searchController = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _sheetKey = GlobalKey();

  VoidCallback _showBottomSheetCallback;
  double _heightFactor = 1.0;
  List<Superhero> _superHeroes = [];
  List<Superhero> _filteredSuperHeroes = [];
  bool _isLodaingHeroes = false;
  bool _hasError = false;
  bool _showGrid = false;
  String _errorMessage = AppConstants.EM_LOADING_ERROR;

  Future<void> _loadHeroes() async {
    if (_superHeroes.length > 0) {
      return;
    }
    setState(() {
      _isLodaingHeroes = true;
    });
    try {
      http.Response response =
          await http.get("${AppConstants.BASE_URL}/all.json");
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
        setState(() {
          _hasError = true;
        });
      }
    } on SocketException catch (_) {
      setState(() {
        _hasError = true;
        _errorMessage = AppConstants.EM_NO_INTERNET;
      });
    } catch (error) {
      setState(() {
        _hasError = true;
      });
    } finally {
      setState(() {
        _isLodaingHeroes = false;
      });
    }
  }

  void _showBottomSheet() {
    PersistentBottomSheetController bottomSheetController =
        _scaffoldKey.currentState.showBottomSheet(
      (context) => BottomSheetSearch(
        key: _sheetKey,
        searchController: _searchController,
      ),
    );
    WidgetsBinding.instance.addPostFrameCallback((_) {
      RenderBox sheetBox = _sheetKey.currentContext.findRenderObject();
      RenderBox skaffoldBox = _scaffoldKey.currentContext.findRenderObject();
      setState(() {
        _showBottomSheetCallback = () => bottomSheetController.close();
        _heightFactor = 1 - sheetBox.size.height / skaffoldBox.size.height;
      });
    });
    bottomSheetController.closed.whenComplete(() {
      if (mounted) {
        setState(() {
          _showBottomSheetCallback = _showBottomSheet;
          _heightFactor = 1.0;
        });
      }
    });
  }

  void _filterHeroes() {
    setState(() {
      _filteredSuperHeroes = _superHeroes
          .where(
            (hero) => hero.name
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()),
          )
          .toList();
    });
  }

  void _setSavedSettings() {
    _prefs.then((SharedPreferences prefs) {
      _showGrid = prefs.getBool(AppConstants.SP_SHOW_GRID) ?? false;
    });
  }

  @override
  initState() {
    super.initState();
    _setSavedSettings();
    _searchController.addListener(_filterHeroes);
    _showBottomSheetCallback = _showBottomSheet;
    _loadHeroes();
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
          title: const Text(AppConstants.APP_TITLE),
          actions: [
            IconButton(
              icon: Icon(_showGrid ? Icons.list : Icons.grid_on),
              onPressed: () {
                _prefs.then((SharedPreferences prefs) {
                  prefs
                      .setBool(AppConstants.SP_SHOW_GRID, !_showGrid)
                      .then((bool success) {
                    if (success) {
                      setState(() {
                        _showGrid = !_showGrid;
                      });
                    }
                  });
                });
              },
            ),
            IconButton(
              icon: const Icon(Icons.search),
              onPressed: _showBottomSheetCallback,
            ),
          ],
        ),
        body: SafeArea(
          child: FractionallySizedBox(
            heightFactor: _heightFactor,
            child: _isLodaingHeroes
                ? const Center(
                    child: const CircularProgressIndicator(),
                  )
                : _hasError
                    ? ErrorMessage(
                        message: _errorMessage,
                        reload: _loadHeroes,
                      )
                    : _showGrid
                        ? GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount:
                                  MediaQuery.of(context).orientation ==
                                          Orientation.portrait
                                      ? 2
                                      : 3,
                              crossAxisSpacing: 4,
                              mainAxisSpacing: 4,
                              childAspectRatio: 0.75,
                            ),
                            itemBuilder: (context, index) =>
                                SuperheroGridTile(_filteredSuperHeroes[index]),
                            itemCount: _filteredSuperHeroes.length,
                          )
                        : ListView.separated(
                            separatorBuilder: (context, index) => Divider(
                              thickness: 4,
                              color: Theme.of(context).dividerColor,
                            ),
                            itemBuilder: (context, index) => SuperheroTile(
                              _filteredSuperHeroes[index],
                            ),
                            itemCount: _filteredSuperHeroes.length,
                          ),
          ),
        ),
      );
}
