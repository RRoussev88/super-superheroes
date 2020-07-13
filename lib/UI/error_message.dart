import 'package:flutter/material.dart';

class ErrorMessage extends StatelessWidget {
  final String message;

  const ErrorMessage(this.message);

  @override
  Widget build(BuildContext context) => Center(
        child: Container(
          constraints: BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width * 0.8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Theme.of(context).accentColor,
          ),
          padding: const EdgeInsets.all(20),
          child: Text(
            message,
            textAlign: TextAlign.center,
            softWrap: true,
            style: const TextStyle(
              decoration: TextDecoration.underline,
              fontSize: 22,
              color: Colors.redAccent,
            ),
          ),
        ),
      );
}
