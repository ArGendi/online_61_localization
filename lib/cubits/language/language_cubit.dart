import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:online_61_localization/local/cache.dart';

part 'language_state.dart';

class LanguageCubit extends Cubit<LanguageState> {
  late String lang;

  LanguageCubit() : super(LanguageInitial()){
    String? cacheLanguage = Cache.getLanguage();
    if(cacheLanguage != null){
      lang = cacheLanguage;
    }
    else{
      lang = Platform.localeName.split("_").first;
    }
  }

  void changeLanguage(String code){
    lang = code;
    Cache.setLanguage(code);
    emit(LanguageChangedState());
  }
}
