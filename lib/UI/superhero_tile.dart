import 'package:flutter/material.dart';

import '../models/superhero/Superhero.dart';
import '../screens/superhero_screen.dart';

class SuperheroTile extends StatefulWidget {
  final Superhero superHero;

  const SuperheroTile(this.superHero);

  @override
  _SuperheroTileState createState() => _SuperheroTileState();
}

class _SuperheroTileState extends State<SuperheroTile> {
  NetworkImage _networkImage;
  bool _isImageLoaded = false;

  void _setIsLoaded(ImageInfo imageInfo, bool isLoading) {
    if (mounted) {
      setState(() {
        _isImageLoaded = true;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _networkImage = NetworkImage(widget.superHero.images.xs);
    _networkImage
        .resolve(ImageConfiguration())
        .addListener(ImageStreamListener(_setIsLoaded));
  }

  @override
  Widget build(BuildContext context) => ListTile(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => SuperheroScreen(
                widget.superHero,
              ),
            ),
          );
        },
        leading: CircleAvatar(
          backgroundImage: _networkImage,
          child: _isImageLoaded
              ? null
              : Text(
                  widget.superHero.name
                      .split(' ')
                      .map((word) => word[0])
                      .join(),
                ),
        ),
        title: Text(
          widget.superHero.name,
        ),
        trailing: IconButton(
          icon: Icon(Icons.favorite_border),
          color: Colors.redAccent,
          // TODO: implement favorites functionallity using shared prefs
          onPressed: () {},
        ),
      );
}
