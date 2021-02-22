import 'package:flutter/material.dart';

import 'bloc.dart';

class BlocProvider<T extends Bloc> extends StatefulWidget {
  final Widget child;
  final T bloc;

  const BlocProvider({Key key, @required this.child, this.bloc})
      : super(key: key);

  static T of<T extends Bloc>(BuildContext context) {
    final BlocProvider<T> provider =
        context.findAncestorWidgetOfExactType<BlocProvider<T>>();
    return provider.bloc;
  }

  @override
  State<StatefulWidget> createState() => _BlocProviderState();
}

class _BlocProviderState extends State<BlocProvider> {
  @override
  void dispose() {
    super.dispose();
    widget.bloc.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
