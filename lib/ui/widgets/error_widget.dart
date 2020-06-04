import 'package:flutter/material.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class ErrorWidget extends StatelessWidget {
  final String errorMessage;

  const ErrorWidget({Key key, this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(errorMessage);
  }
}
