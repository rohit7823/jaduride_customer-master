import 'dart:io';

import 'package:jaduride/core/models/register_user_response.dart';
import 'package:jaduride/core/models/send_otp_response.dart';

abstract class RegisterUserUseCase{
  Future<RegisterUserResponse?> registerUser(
      String mobile,
      String name,
      String email,
      File image
  );
}