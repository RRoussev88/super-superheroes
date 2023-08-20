import 'package:flutter/material.dart';

import './screens/home.dart';
import './utils/bloc_provider.dart';
import './utils/constants.dart' as AppConstants;
import './utils/favorites_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final ThemeData themeData = ThemeData(
    primarySwatch: Colors.teal,
    primaryColor: Colors.teal[500],
    primaryColorLight: Colors.teal[100],
    primaryColorDark: Colors.teal[800],
    secondaryHeaderColor: Colors.teal[50],
    indicatorColor: const Color(0xFF2A3542),
    dividerColor: const Color(0xFF2A3542).withAlpha(45),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    buttonTheme: ButtonThemeData(
      height: 45,
      buttonColor: Colors.teal[600],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      textTheme: ButtonTextTheme.accent,
    ),
    textTheme: TextTheme(
      headlineSmall: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black.withAlpha(180),
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black.withAlpha(180),
      ),
      titleMedium: TextStyle(color: Colors.black.withAlpha(140)),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: Colors.black.withAlpha(140),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) => BlocProvider<FavoritesBloc>(
        key: Key("home"),
        bloc: FavoritesBloc(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: AppConstants.APP_TITLE,
          theme: themeData,
          home: Home(key: "home"),
        ),
      );
}
