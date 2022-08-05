// ignore_for_file: prefer_final_fields

import 'package:jaduride/app/di.dart';
import 'package:jaduride/app/image_assets.dart';
import 'package:jaduride/app/navigation_service.dart';
import 'package:jaduride/core/app_settings.dart';
import 'package:jaduride/core/models/intro_data.dart';
import 'package:mobx/mobx.dart';

import '../routes.dart';

part 'intro_view_model.g.dart';

class IntroViewModel = _IntroViewModel with _$IntroViewModel;

abstract class _IntroViewModel with Store {
  var _appSettings = instance<AppSettings>();
  var _navigator = instance<NavigationService>();
  @observable
  bool isLastPage = false;

  @observable
  int currentPage = 0;

  @action
  onPageChange(int page){
    if(currentPage==page){
      return;
    }
    currentPage = page;
    if(currentPage==4){
      isLastPage = true;
    }
    else{
      if(isLastPage){
        isLastPage = false;
      }
    }
  }

  @action
  skip(){
    onPageChange(4);
  }

  @action
  onGetStarted(){
    saveIntroDone();
    _navigator.navigatorKey.currentState?.popAndPushNamed(Routes.mobileInput);
  }

  void saveIntroDone() {
    _appSettings.saveIntroDone();
  }
}