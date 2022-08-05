import '../models/base_url_response.dart';

abstract class BaseUrlFetchUseCase{
  Future<BaseUrlResponse?> get baseUrl;
}