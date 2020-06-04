import 'package:flutter/material.dart';
import 'package:gankglobal/core/bloc/list_beverage_category_bloc.dart';
import 'package:gankglobal/core/model/lookup_beverage.dart';
import 'package:gankglobal/core/model/lookup_beverage_response.dart';
import 'package:gankglobal/ui/screens/detail_screen.dart';
import 'package:gankglobal/ui/theme/style.dart';
import 'package:gankglobal/ui/widgets/loading_widget.dart';

/// Created by Hafizh Fadhlurrohman on 04/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class BeverageByCategory extends StatefulWidget {
  final String strCategory;
  final bool canClick;

  const BeverageByCategory({Key key, this.strCategory, this.canClick}) : super(key: key);

  @override
  _BeverageByCategoryState createState() =>
      _BeverageByCategoryState(strCategory,canClick);
}

class _BeverageByCategoryState extends State<BeverageByCategory> {
  final String strCategory;
  final bool canClick;

  _BeverageByCategoryState(this.strCategory,this.canClick);

  @override
  void initState() {
    super.initState();
    listByCategoryBloc..getFilterCategory(strCategory);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<LookupBeverageResponse>(
      stream: listByCategoryBloc.subject.stream,
      builder: (context, AsyncSnapshot<LookupBeverageResponse> snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data.error != null && snapshot.data.error.length > 0) {
            return ErrorWidget(snapshot.data.error);
          }
          return _buildHomeWidget(snapshot.data);
        } else if (snapshot.hasError) {
          return ErrorWidget(snapshot.error);
        } else {
          return LoadingWidget();
        }
      },
    );
  }

  Widget _buildHomeWidget(LookupBeverageResponse data) {
    List<LookupBeverage> categories = data.lookUpBeverage;
    if (categories.length == 0) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text(
                  "No More Movies",
                  style: TextStyle(color: Colors.black45),
                )
              ],
            )
          ],
        ),
      );
    } else
      return Container(
        padding: EdgeInsets.only(left: 10.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(top: 10.0, bottom: 5.0, right: 15.0),
              child: AbsorbPointer(
                absorbing: canClick??false,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            BeverageDetailScreen(idDrink: categories[index].idDrink),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      categories[index].strDrinkThumb == null
                          ? Container(
                              width: MediaQuery.of(context).size.width * 0.50,
                              height: MediaQuery.of(context).size.height * 0.20,
                              decoration: new BoxDecoration(
                                color: Style.secondColor,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(2.0)),
                                shape: BoxShape.rectangle,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Icon(
                                    Icons.beach_access,
                                    color: Colors.white,
                                    size: 60.0,
                                  )
                                ],
                              ),
                            )
                          : Stack(
                              children: <Widget>[
                                Hero(
                                  tag: categories[index].idDrink,
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * 0.50,
                                    height:
                                        MediaQuery.of(context).size.height * 0.25,
                                    decoration: new BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      image: new DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          categories[index].strDrinkThumb,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 0.51,
                                  height:
                                      MediaQuery.of(context).size.height * 0.26,
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
                                    padding:
                                        EdgeInsets.only(left: 10.0, right: 10.0),
                                    width:
                                        MediaQuery.of(context).size.width * 0.49,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          categories[index].strDrink,
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
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
  }
}
