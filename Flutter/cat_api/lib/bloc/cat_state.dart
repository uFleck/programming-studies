import 'package:cat_api/model/model.dart';
import 'package:equatable/equatable.dart';

class CatState extends Equatable {
  @override
  List<Object> get props => [];
}

class CatIsLoadingState extends CatState {}

class CatIsLoadedState extends CatState {
  final _cat;
  CatIsLoadedState(this._cat);
  
  Cat get getCat => _cat;

  @override
  List<Object> get props => [_cat];
}

class CatIsNotSearchedState extends CatState {}
class CatIsNotLoadedState extends CatState {
  final _message;

  CatIsNotLoadedState(this._message);

  String get getMessage => _message;

  @override
  List<Object> get props => [_message];
}
