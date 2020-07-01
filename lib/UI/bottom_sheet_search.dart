import 'package:flutter/material.dart';

class BottomSheetSearch extends StatelessWidget {
  final TextEditingController searchController;

  BottomSheetSearch({Key key, this.searchController}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        color: Theme.of(context).primaryColor.withOpacity(0.5),
        child: TextField(
          controller: searchController,
          decoration: InputDecoration(
            labelText: "Superhero name",
            labelStyle: TextStyle(
              color: Theme.of(context).accentColor,
            ),
            helperText: "Search superhero by name",
            helperStyle: const TextStyle(
              fontSize: 16,
            ),
            filled: true,
            fillColor: Colors.white,
            border: const OutlineInputBorder(),
            prefixIcon: const Icon(Icons.search),
          ),
          style: TextStyle(
            color: Theme.of(context).primaryColor,
          ),
        ),
      );
}
