import 'package:jaduride/app/di.dart';
import 'package:jaduride/core/repositories/app_repository.dart';

import '../../core/network.dart';

class AppRepositoryImp extends AppRepository{
  late Network _network;
  AppRepositoryImp(){
    _network = instance<Network>();
  }
  /*@override
  Future<String> get baseUrl{

  }*/
}