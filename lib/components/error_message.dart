import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;
  final Function reload;

  const ErrorMessage({
    @required this.message,
    @required this.reload,
  });

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width *
                (MediaQuery.of(context).orientation == Orientation.portrait
                    ? 0.8
                    : 0.4),
            maxHeight: MediaQuery.of(context).size.height *
                (MediaQuery.of(context).orientation == Orientation.portrait
                    ? 0.35
                    : 0.6),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).accentColor,
          ),
          padding: const EdgeInsets.all(30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.warning_amber_rounded,
                    color: Colors.redAccent,
                    size: 43,
                  ),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      softWrap: true,
                      style: const TextStyle(
                        decoration: TextDecoration.none,
                        fontSize: 22,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
              ElevatedButton.icon(
                onPressed: reload,
                style: ButtonStyle(
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(12),
                  ),
                  elevation: MaterialStateProperty.all<double>(2),
                  textStyle: MaterialStateProperty.all<TextStyle>(
                    const TextStyle(color: Colors.white),
                  ),
                ),
                icon: const Icon(Icons.refresh_sharp),
                label: const Text(
                  'Reload',
                  textAlign: TextAlign.center,
                  softWrap: true,
                  style: const TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 22,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
}
