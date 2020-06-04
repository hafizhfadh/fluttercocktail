import 'package:flutter/material.dart';
import 'package:gankglobal/core/bloc/list_beverage_category_bloc.dart';
import 'package:gankglobal/core/model/beverage_category.dart';
import 'package:gankglobal/ui/theme/style.dart';
import 'package:gankglobal/ui/widgets/beverage_by_category.dart';

/// Created by Hafizh Fadhlurrohman on 04/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class CategoryList extends StatefulWidget {
  final List<BeverageCategory> categories;

  CategoryList({Key key, @required this.categories}) : super(key: key);

  @override
  _CategoryListState createState() => _CategoryListState(categories);
}

class _CategoryListState extends State<CategoryList>
    with SingleTickerProviderStateMixin {
  final List<BeverageCategory> categories;

  _CategoryListState(this.categories);

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: categories.length);
    _tabController.addListener(() {
      if (_tabController.indexIsChanging) {
        listByCategoryBloc..drainStream();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 307.0,
      child: DefaultTabController(
        length: categories.length,
        child: Scaffold(
          backgroundColor: Style.mainColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(50.0),
            child: AppBar(
              backgroundColor: Style.mainColor,
              bottom: TabBar(
                controller: _tabController,
                indicatorColor: Style.secondColor,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorWeight: 3.0,
                unselectedLabelColor: Style.thirdColor,
                labelColor: Colors.white,
                isScrollable: true,
                tabs: categories.map(
                  (BeverageCategory category) {
                    return Container(
                      padding: EdgeInsets.only(bottom: 15.0, top: 10.0),
                      child: new Text(
                        category.strCategory.toUpperCase(),
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            physics: NeverScrollableScrollPhysics(),
            children: categories.map(
              (BeverageCategory category) {
                return BeverageByCategory(
                  strCategory: category.strCategory,
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }
}
