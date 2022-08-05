import 'package:jaduride/validator.dart';

class ValidatorImpl extends Validator{

  static const emailRegex = r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$";
  static const passwordRegex = r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[£+=#?!@\$%^&*[](){}-]).{8,}$";
  //static const passwordRegex = r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[#?!@\$%^&*-]).{8,}$";
  static const domainRegex = r"^[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,7}$";
  static const endpointRegex = r'^[(http(s)?):\/\/(www\.)?a-zA-Z0-9@:%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)$';
  static const mobileRegex = r'^[0-9]{10}$';

  bool isValid(String input, String pattern){
    RegExp regex = RegExp(pattern);
    var r = regex.hasMatch(input);
    return r;
  }
  @override
  bool isValidEmail(String input) {
    return isValid(input,emailRegex);
  }
}