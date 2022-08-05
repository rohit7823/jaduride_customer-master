import 'package:jaduride/app/constants.dart';

class JaduTime{
  final String title;
  JaduTime._(this.title);

  static final Now = JaduTime._(Constants.now);
}