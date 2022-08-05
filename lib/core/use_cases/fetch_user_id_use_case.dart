import 'package:jaduride/core/models/get_user_id_response.dart';

abstract class FetchUserIdUseCase{
  Future<GetUserIdResponse?> userId(String mobile);
}