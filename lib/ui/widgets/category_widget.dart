import 'package:flutter/material.dart';
import 'package:gankglobal/ui/widgets/category_list.dart';
import 'package:gankglobal/ui/widgets/loading_widget.dart';
import 'package:gankglobal/core/model/beverage_category.dart';
import 'package:gankglobal/core/bloc/beverage_category_bloc.dart';
import 'package:gankglobal/core/model/beverage_category_response.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class CategoryWidget extends StatefulWidget {
  @override
  _GenresScreenState createState() => _GenresScreenState();
}

class _GenresScreenState extends State<CategoryWidget>{
  @override
  void initState() {
    super.initState();
    categoryBloc..getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BeverageCategoryResponse>(
      stream: categoryBloc.subject.stream,
      builder: (context, AsyncSnapshot<BeverageCategoryResponse> snapshot) {
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

  Widget _buildHomeWidget(BeverageCategoryResponse data) {
    List<BeverageCategory> categories = data.beverageCategory;
    if (categories.length == 0) {
      return Container(
        width: MediaQuery.of(context).size.width,
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
      return CategoryList(categories: categories,);
  }
}
