import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';

import '../core/constants/url.dart';
import '../models/currency_model.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  Future getData() async {
    emit(HomeLoading());
    try {
      Response response = await Dio().get(UrlConst.urlApi);
      List<CurrencyModel> currencyModel = (response.data as List)
          .map((e) => CurrencyModel.fromJson(e))
          .toList();
      emit(HomeLoaded(currencyModel));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
