import 'dart:io';

import 'package:jaduride/app/di.dart';
import 'package:jaduride/core/models/register_user_response.dart';
import 'package:jaduride/core/network.dart';
import 'package:jaduride/core/use_cases/register_user_use_case.dart';

class RegisterUserUseCaseImpl extends RegisterUserUseCase{
  final _network = instance<Network>();
  @override
  Future<RegisterUserResponse?> registerUser(
      String mobile,
      String name,
      String email,
      File image
  ) async {
    var r = await _network.userSignup(mobile, name, email, image.path);
    if(r.data==null){
      return null;
    }
    else{
      return r.data;
    }
  }

}