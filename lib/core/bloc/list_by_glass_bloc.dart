import 'package:gankglobal/core/model/list_by_glass_response.dart';
import 'package:gankglobal/core/repository/beverage_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Created by Hafizh Fadhlurrohman on 03/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class ListByGlassBloc {
  final BeverageRepository _repository = BeverageRepository();
  final BehaviorSubject<ListByGlassResponse> _subject =
  BehaviorSubject<ListByGlassResponse>();

  /// Data sink
  getByGlass(String filter) async {
    ListByGlassResponse response =
    await _repository.getFilterByGlass(filter);
    _subject.sink.add(response);
  }

  /// Data flush
  dispose() {
    _subject.close();
  }

  BehaviorSubject<ListByGlassResponse> get subject => _subject;
}

/// Data stream
final listByGlassBloc = ListByGlassBloc();
