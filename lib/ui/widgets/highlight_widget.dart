import 'package:flutter/material.dart';
import 'package:gankglobal/core/bloc/list_banner_bloc.dart';
import 'package:gankglobal/core/model/lookup_beverage.dart';
import 'package:gankglobal/core/model/lookup_beverage_response.dart';
import 'package:gankglobal/ui/screens/detail_screen.dart';
import 'package:gankglobal/ui/theme/style.dart';
import 'package:gankglobal/ui/widgets/loading_widget.dart';
import 'package:page_indicator/page_indicator.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class HighlightWidget extends StatefulWidget {
  @override
  _HighlightWidgetState createState() => _HighlightWidgetState();
}

class _HighlightWidgetState extends State<HighlightWidget> {
  @override
  void initState() {
    super.initState();
    listBannerBloc..getBanner("Cocktail");
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: listBannerBloc.subject.stream,
      builder: (context, AsyncSnapshot<LookupBeverageResponse> snapshot) {
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

  Widget _highlightWidget(LookupBeverageResponse data) {
    List<LookupBeverage> categories = data.lookUpBeverage;
    if (categories.length == 0) {
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
      return Container(
        height: MediaQuery.of(context).size.height / 4,
        child: PageIndicatorContainer(
          align: IndicatorAlign.bottom,
          indicatorSpace: 8.0,
          padding: EdgeInsets.all(8.0),
          indicatorColor: Style.thirdColor,
          indicatorSelectorColor: Style.secondColor,
          length: categories.take(5).length,
          child: PageView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: categories.take(5).length,
            itemBuilder: (context, idx) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          BeverageDetailScreen(idDrink: categories[idx].idDrink),
                    ),
                  );
                },
                child: Hero(
                  tag: categories[idx].idDrink,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height /4,
                        decoration: new BoxDecoration(
                          shape: BoxShape.rectangle,
                          image: new DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                              categories[idx].strDrinkThumb,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height /4,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                            colors: [
                              Style.mainColor.withOpacity(1.0),
                              Style.secondColor.withOpacity(0.0),
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
                                categories[idx].strDrink,
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
              );
            },
          ),
        ),
      );
  }
}
