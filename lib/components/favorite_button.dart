import 'package:flutter/material.dart';

import '../utils/database.dart';

class FavoriteButton extends StatefulWidget {
  final bool isChecked;
  final int id;

  const FavoriteButton(this.id, this.isChecked);

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
          onPressed: () async {
            int result =
                await DBProvider.db.newFavorite(widget.id, !_isChecked);
            if (result == widget.id) {
              setState(() {
                _isChecked = !_isChecked;
              });
            }
          },
        ),
      );
}
