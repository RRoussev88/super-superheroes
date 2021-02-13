import 'package:flutter/material.dart';

class FavoriteButton extends StatefulWidget {
  final bool isChecked;

  const FavoriteButton(this.isChecked);

  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  _FavoriteButtonState();

  bool _isChecked;

  @override
  initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) => PhysicalModel(
        color: Theme.of(context).secondaryHeaderColor,
        shadowColor: _isChecked ? Colors.redAccent : Colors.black,
        borderRadius: BorderRadius.circular(24),
        elevation: _isChecked ? 8 : 4,
        child: IconButton(
          icon: Icon(_isChecked ? Icons.favorite : Icons.favorite_border),
          color: Colors.redAccent,
          // TODO: implement favorites functionallity using shared prefs
          onPressed: () {
            setState(() {
              _isChecked = !_isChecked;
            });
          },
        ),
      );
}
