import 'package:gankglobal/core/model/lookup_beverage_response.dart';
import 'package:gankglobal/core/repository/beverage_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class ListBannerBloc {
  final BeverageRepository _repository = BeverageRepository();
  final BehaviorSubject<LookupBeverageResponse> _subject =
  BehaviorSubject<LookupBeverageResponse>();

  /// Data sink
  getBanner(String filter) async {
    LookupBeverageResponse response =
    await _repository.getFilterCategory(filter);
    _subject.sink.add(response);
  }

  /// Data flush
  dispose() {
    _subject.close();
  }

  BehaviorSubject<LookupBeverageResponse> get subject => _subject;
}

/// Data stream
final listBannerBloc = ListBannerBloc();
