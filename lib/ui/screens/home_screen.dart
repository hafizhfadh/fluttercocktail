import 'package:flutter/material.dart';
import 'package:gankglobal/ui/theme/style.dart';
import 'package:gankglobal/ui/widgets/category_widget.dart';
import 'package:gankglobal/ui/widgets/glass_widget.dart';
import 'package:gankglobal/ui/widgets/highlight_widget.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.mainColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Style.mainColor,
        title: Text("The Cocktail"),
      ),
      body: ListView(
        children: <Widget>[
          HighlightWidget(),
          CategoryWidget(),
          GlassWidget(),
        ],
      ),
    );
  }
}
