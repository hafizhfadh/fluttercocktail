import 'package:flutter/material.dart';
import 'package:gankglobal/core/bloc/lookup_beverage_bloc.dart';
import 'package:gankglobal/core/model/lookup_beverage.dart';
import 'package:gankglobal/core/model/lookup_beverage_response.dart';
import 'package:gankglobal/ui/theme/style.dart';
import 'package:gankglobal/ui/widgets/beverage_by_category.dart';
import 'package:gankglobal/ui/widgets/loading_widget.dart';
import 'package:sliver_fab/sliver_fab.dart';

/// Created by Hafizh Fadhlurrohman on 04/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class BeverageDetailScreen extends StatefulWidget {
  final String idDrink;

  BeverageDetailScreen({Key key, @required this.idDrink}) : super(key: key);

  @override
  _BeverageDetailScreenState createState() =>
      _BeverageDetailScreenState(idDrink);
}

class _BeverageDetailScreenState extends State<BeverageDetailScreen> {
  final String idDrink;

  _BeverageDetailScreenState(this.idDrink);

  @override
  void initState() {
    super.initState();
    lookupBeverageBloc..getLookupId(idDrink);
  }

  @override
  void dispose() {
    super.dispose();
    lookupBeverageBloc..drainStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Style.mainColor,
      body: StreamBuilder<LookupBeverageResponse>(
        stream: lookupBeverageBloc.subject.stream,
        builder: (context, AsyncSnapshot<LookupBeverageResponse> snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data.error != null && snapshot.data.error.length > 0) {
              return ErrorWidget(snapshot.data.error);
            }
            return _buildDetailWidget(snapshot.data);
          } else if (snapshot.hasError) {
            return ErrorWidget(snapshot.error);
          } else {
            return LoadingWidget();
          }
        },
      ),
    );
  }

  Widget _buildDetailWidget(LookupBeverageResponse data) {
    LookupBeverage lookup = data.lookUpBeverage[0];
    return SliverFab(
      floatingPosition: FloatingPosition(right: 20),
      expandedHeight: 200.0,
      floatingWidget: Container(),
      slivers: <Widget>[
        SliverAppBar(
          backgroundColor: Style.mainColor,
          expandedHeight: 200.0,
          pinned: true,
          flexibleSpace: new FlexibleSpaceBar(
            title: Text(
              lookup.strDrink,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Stack(
              children: <Widget>[
                Container(
                  decoration: new BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: new DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        lookup.strDrinkThumb,
                      ),
                    ),
                  ),
                  child: new Container(
                    decoration:
                        new BoxDecoration(color: Colors.black.withOpacity(0.5)),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      stops: [
                        0.1,
                        0.9,
                      ],
                      colors: [
                        Colors.black.withOpacity(0.9),
                        Colors.black.withOpacity(0.0),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.all(0.0),
          sliver: SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, top: 20.0),
                  child: Text(
                    "INSTRUCTION",
                    style: TextStyle(
                      color: Style.titleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    lookup.strInstructions,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      height: 1.5,
                    ),
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: ExpansionTile(
                    title: new Text(
                      "INGREDIENT",
                      style: TextStyle(
                        color: Style.titleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                    backgroundColor:
                        Theme.of(context).accentColor.withOpacity(0.025),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          lookup.strIngredient1 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          lookup.strIngredient2 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          lookup.strIngredient3 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          lookup.strIngredient4 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          lookup.strIngredient5 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Expanded(
                  child: ExpansionTile(
                    title: new Text(
                      "MEASUREMENT",
                      style: TextStyle(
                        color: Style.titleColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 12.0,
                      ),
                    ),
                    backgroundColor:
                    Theme.of(context).accentColor.withOpacity(0.025),
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          lookup.strMeasure1 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          lookup.strMeasure2 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          lookup.strMeasure3 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          lookup.strMeasure4 ?? "-",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.0,
                            height: 1.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 5.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "OTHER ${lookup.strCategory.toUpperCase()}",
                    style: TextStyle(
                      color: Style.titleColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.0,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.32,
                  child: BeverageByCategory(
                    strCategory: lookup.strCategory,
                    canClick: true,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
