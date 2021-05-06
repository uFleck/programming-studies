import 'dart:async';

import 'package:cat_api/bloc/bloc.dart';
import 'package:cat_api/service/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cat_api/model/model.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  CatService _catService;

  CatBloc(this._catService) : super(CatIsNotSearchedState());

  @override
  Stream<CatState> mapEventToState(CatEvent event) async* {
    if(event is ResetCatEvent) {
      yield* mapEventResetCatToState(event);
    } else if(event is FetchCatEvent) {
      yield* mapEventFetchCatToState(event);
    }
  }

  Stream<CatState> mapEventResetCatToState(CatEvent event) async* {
    yield CatIsNotSearchedState();
  }
  Stream<CatState> mapEventFetchCatToState(CatEvent event) async* {
    yield CatIsLoadingState();
      Cat cat = await _catService.getCat(event.props[0].toString());

      if(cat != null)
        yield CatIsLoadedState(cat);
      else 
        yield CatIsNotLoadedState("Erro!");
  }
}