import 'package:equatable/equatable.dart';

class CatEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class ResetCatEvent extends CatEvent {}

class FetchCatEvent extends CatEvent {
  final _catId;

  FetchCatEvent(this._catId);

  @override
  List<Object> get props => [_catId];
}
