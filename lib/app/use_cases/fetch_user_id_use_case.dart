import 'package:jaduride/app/di.dart';
import 'package:jaduride/core/models/get_user_id_response.dart';
import 'package:jaduride/core/network.dart';

import '../../core/use_cases/fetch_user_id_use_case.dart';

class FetchUserIdUseCaseImpl extends FetchUserIdUseCase{
  final Network _network = instance<Network>();
  @override
  Future<GetUserIdResponse?> userId(String mobile) async {
    var r = await _network.userId(mobile);
    if(r.data!=null){
      return r.data;
    }
    else{
      return null;
    }
  }
}