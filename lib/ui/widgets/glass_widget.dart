import 'package:flutter/material.dart';
import 'package:gankglobal/core/bloc/list_by_glass_bloc.dart';
import 'package:gankglobal/core/model/list_by_glass.dart';
import 'package:gankglobal/core/model/list_by_glass_response.dart';
import 'package:gankglobal/ui/screens/detail_screen.dart';
import 'package:gankglobal/ui/theme/style.dart';
import 'package:gankglobal/ui/widgets/loading_widget.dart';

/// Created by Hafizh Fadhlurrohman on 04/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class GlassWidget extends StatefulWidget {
  @override
  _GlassWidgetState createState() => _GlassWidgetState();
}

class _GlassWidgetState extends State<GlassWidget> {
  @override
  void initState() {
    super.initState();
    listByGlassBloc..getByGlass("Cocktail glass");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listByGlassBloc.subject.stream,
      builder: (context, AsyncSnapshot<ListByGlassResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return ErrorWidget(snapshot.data.error);
          }
          return _highlightWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return ErrorWidget(snapshot.error);
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  Widget _highlightWidget(ListByGlassResponse data) {
    List<ListByGlass> glass = data.listByGlass;
    if (glass.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text("Category Not Found"),
          ],
        ),
      );
    } else
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              "Best Cocktail Offers",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Container(
            height: MediaQuery.of(context).size.height*0.8,
            child: GridView.builder(
              itemCount: glass.length,
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BeverageDetailScreen(idDrink: glass[index].idDrink),
                      ),
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                    child: Hero(
                      tag: glass[index].idDrink,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width * 0.50,
                            height: MediaQuery.of(context).size.height * 0.20,
                            decoration: new BoxDecoration(
                              shape: BoxShape.rectangle,
                              image: new DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                  glass[index].strDrinkThumb,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.51,
                            height: MediaQuery.of(context).size.height * 0.21,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                stops: [0.0, 0.9],
                                colors: [
                                  Style.mainColor.withOpacity(1.0),
                                  Style.mainColor.withOpacity(0.0),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 18.0,
                            child: Container(
                              padding: EdgeInsets.only(left: 10.0, right: 10.0),
                              width: MediaQuery.of(context).size.width * 0.49,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    glass[index].strDrink,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      );
  }
}
