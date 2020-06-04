import 'package:flutter/material.dart';
import 'package:gankglobal/core/model/lookup_beverage_response.dart';
import 'package:gankglobal/core/repository/beverage_repository.dart';
import 'package:rxdart/rxdart.dart';

/// Created by Hafizh Fadhlurrohman on 04/06/20.
/// Flutter Developer
/// hafizhfadh@gmail.com

class LookupBeverageBloc {
  final BeverageRepository _repository = BeverageRepository();
  final BehaviorSubject<LookupBeverageResponse> _subject =
  BehaviorSubject<LookupBeverageResponse>();

  /// Data sink
  getLookupId(String id) async {
    LookupBeverageResponse response = await _repository.getLookupId(id);
    _subject.sink.add(response);
  }

  /// Data flush
  void drainStream() { _subject.value = null; }
  @mustCallSuper
  dispose() async {
    await _subject.drain();
    _subject.close();
  }

  BehaviorSubject<LookupBeverageResponse> get subject => _subject;
}

/// Data stream
final lookupBeverageBloc = LookupBeverageBloc();
