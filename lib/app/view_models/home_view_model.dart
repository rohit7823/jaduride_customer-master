import 'package:mobx/mobx.dart';

part 'home_view_model.g.dart';

class HomeViewModel = _HomeViewModel with _$HomeViewModel;

abstract class _HomeViewModel with Store {
  @observable
  int currentTab = 0;

  @action
  onTabSelected(int tab){
    currentTab = tab;
  }
}

//flutter pub run build_runner build