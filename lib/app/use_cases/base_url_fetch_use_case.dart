import 'package:jaduride/core/models/base_url_response.dart';
import 'package:jaduride/core/network.dart';

import '../../core/use_cases/base_url_fetch_use_case.dart';
import '../di.dart';

class BaseUrlFetchUseCaseImpl extends BaseUrlFetchUseCase{
  late Network _network;
  BaseUrlFetchUseCaseImpl(){
    _network = instance<Network>();
  }

  @override
  // TODO: implement baseUrl
  Future<BaseUrlResponse?> get baseUrl async{
    var response = await _network.fetchBaseUrl();
    if(response.data!=null){
      return response.data;
    }
    else{
      return null;
    }
  }
}