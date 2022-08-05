abstract class AppSettings{
  get userId;

  String get baseUrl;

  setBaseUrl(String baseUrl);

  void saveIntroDone();

  bool introDone();

  void setUserId(String userId);
}