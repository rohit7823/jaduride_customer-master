import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jaduride/app/constants.dart';
import 'package:jaduride/app/di.dart';
import 'package:jaduride/app/navigation_service.dart';
import 'package:jaduride/core/use_cases/register_user_use_case.dart';
import 'package:jaduride/validator.dart';
import 'package:mobx/mobx.dart';

import '../../core/app_settings.dart';
import '../../core/models/wrapper.dart';
import '../../extensions.dart';
import '../routes.dart';

part 'personal_details_view_model.g.dart';

class PersonalDetailsViewModel = _PersonalDetailsViewModel with _$PersonalDetailsViewModel;

abstract class _PersonalDetailsViewModel with Store {
  final _appSettings = instance<AppSettings>();
  final Validator _validator = instance<Validator>();
  final ImagePicker _picker = ImagePicker();
  final _register_user_use_case = instance<RegisterUserUseCase>();
  final _navigator = instance<NavigationService>();

  var _mobile = "";

  @observable
  Wrapper<String> snackbarMessage = Wrapper("");

  @observable
  var showPickSourceDialog = DialogTrigger();

  @observable
  File? file;

  @observable
  bool valid = false;

  @observable
  bool submitting = false;

  var _name = "";
  var _email = "";

  @action
  onNameChanged(String value){
    _name = value;
    validate();
  }

  onInit(String mobile){
    _mobile = mobile;
  }

  @action
  onEmailChanged(String value){
    _email = value;
    validate();
  }

  @action
  onSubmit(){
    submitUserDetails();
  }

  submitUserDetails() async{
    if(file==null){
      return;
    }
    var r = await _register_user_use_case.registerUser(_mobile, _name, _email, file!);
    if(r==null){
      snackbarMessage = Wrapper(Constants.tryAgain);
      return;
    }
    var userId = r.userId;
    _appSettings.setUserId(userId);
    _navigator.navigatorKey.currentState?.pushNamedAndRemoveUntil(Routes.home,(Route<dynamic> route) => false);
    //_navigator.navigatorKey.currentState?.pushNamed(Routes.home);
  }

  @action
  pickFile(){
    onPickFile();
  }

  onPickFile() async{
    var result = await triggerDialog((d)=>showPickSourceDialog = d);
    if(result==Constants.camera){
      final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
      if(photo!=null){
        file = File(photo.path);
      }
    }
    else if(result==Constants.gallery){
      final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
      if(photo!=null){
        file = File(photo.path);
      }
    }
    validate();
  }
  validate(){
    valid = file!=null
        &&isNameValid()
        &&isEmailValid();
  }
  isNameValid(){
    return _name.length>2;
  }
  isEmailValid(){
    return _validator.isValidEmail(_email);
  }
}


//flutter pub run build_runner build