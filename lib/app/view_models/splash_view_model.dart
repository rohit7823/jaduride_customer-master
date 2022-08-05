import 'package:android_intent_plus/android_intent.dart';
import 'package:flutter/foundation.dart';
import 'package:jaduride/app/navigation_service.dart';
import 'package:jaduride/app/routes.dart';
import 'package:jaduride/core/app_settings.dart';
import 'package:mobx/mobx.dart';

import '../../core/use_cases/base_url_fetch_use_case.dart';
import '../../extensions.dart';
import '../constants.dart';
import '../di.dart';

part 'splash_view_model.g.dart';

class SplashViewModel = _SplashViewModel with _$SplashViewModel;



abstract class _SplashViewModel with Store {
  final _navigator = instance<NavigationService>();
  final _base_url_fetch_use_case = instance<BaseUrlFetchUseCase>();
  final _appSettings = instance<AppSettings>();

  @observable
  DialogTrigger showDialog = DialogTrigger();

  @observable
  int retried = 0;

  @action
  onInit(){
    onRetried(value: 0);
    splashAction();
  }

  @action
  onRetried({int value = -1}){
    if(value==-1){
      retried++;
    }
    else{
      retried = value;
    }
  }

  void splashAction() async {
    onRetried();
    if(retried>=6){
      return;
    }
    var response = await _base_url_fetch_use_case.baseUrl;
    if(response==null){
      await Future.delayed(Duration(seconds: 3));
      splashAction();
      return;
    }
    var baseUrl = response.baseUrl;
    _appSettings.setBaseUrl(baseUrl);
    var versionCode = response.version.code;
    if(versionCode>Constants.versionCode){
      var result = await triggerDialog((d)=>showDialog = d,value:response.version,);
      if(result==true){
        if(defaultTargetPlatform == TargetPlatform.android){
          AndroidIntent intent = const AndroidIntent(
              action: 'action_view',
              data: 'https://play.google.com/store/apps/details?id=${Constants.package}'
          );
          await intent.launch();
        }
      }
      else{
        var userId = _appSettings.userId;
        await Future.delayed(Duration(seconds: 2));
        if(userId==null || userId==""){
          gotoAppropriatePage();
        }
      }
    }
    else{
      gotoAppropriatePage();
    }
  }

  void gotoAppropriatePage() {
    var userId = _appSettings.userId;
    if(userId!=null && userId != ""){
      _navigator.navigatorKey.currentState?.popAndPushNamed(Routes.home);
      return;
    }
    if(_appSettings.introDone()){
      _navigator.navigatorKey.currentState?.popAndPushNamed(Routes.mobileInput);
      return;
    }
    _navigator.navigatorKey.currentState?.popAndPushNamed(Routes.intro);
  }
}