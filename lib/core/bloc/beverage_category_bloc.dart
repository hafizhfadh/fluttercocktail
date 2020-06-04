import 'package:gankglobal/core/model/beverage_category_response.dart';
import 'package:gankglobal/core/repository/beverage_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class BeverageCategoryBloc {
  final BeverageRepository _repository = BeverageRepository();
  final BehaviorSubject<BeverageCategoryResponse> _subject =
      BehaviorSubject<BeverageCategoryResponse>();

  /// Data sink
  getCategory() async {
    BeverageCategoryResponse response = await _repository.getCategory();
    _subject.sink.add(response);
  }

  /// Data flush
  dispose() {
    _subject.close();
  }

  BehaviorSubject<BeverageCategoryResponse> get subject => _subject;
}

/// Data stream
final categoryBloc = BeverageCategoryBloc();
