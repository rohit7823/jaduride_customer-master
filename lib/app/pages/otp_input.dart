import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jaduride/app/image_assets.dart';
import 'package:jaduride/app/theme.dart';
import 'package:jaduride/app/view_models/mobile_input_view_model.dart';
import 'package:jaduride/app/view_models/otp_input_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:pinput/pinput.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../core/models/wrapper.dart';
import '../constants.dart';

OtpInputViewModel vm = OtpInputViewModel();

class OtpInput extends StatefulWidget {
  const OtpInput(this.mobileAndOtp, {Key? key}) : super(key: key);
  final MobileAndOtp mobileAndOtp;

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  List<ReactionDisposer> _disposers = [];
  @override
  Widget build(BuildContext context) {
    var p = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconButton(
                      onPressed: (){

                      },
                      icon: Icon(
                          Icons.chevron_left,
                        size: 42,
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20
                    ),
                    child: Text(
                        Constants.phone_verification,
                      style: TextStyle(
                        fontSize: 35
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0,
                      right: 20.0
                    ),
                    child: Observer(
                      builder: (_) => Text(Constants.enter_otp_code_instruction+vm.mobile),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 124
              ),
              child: Image.asset(ImageAssets.splashBuilding),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: max(270-p,/*190*//**//*80*/getPaddingCap())
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.White,
                ),
                child: Stack(
                  children: [
                    Padding(
                    padding: const EdgeInsets.only(
                      top: 56
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Pinput(
                            onChanged: (value){
                              vm.onInputOtpChange(value);
                            },
                            length: 4,
                            defaultPinTheme: PinTheme(
                              width: 64,
                              height: 64,
                              textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                border: Border.all(color: Color.fromRGBO(234, 239, 243, 1)),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            focusedPinTheme: PinTheme(
                              width: 64,
                              height: 64,
                              textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                border: Border.all(color: Theme.of(context).colorScheme.primary),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            submittedPinTheme: PinTheme(
                              width: 64,
                              height: 64,
                              textStyle: TextStyle(fontSize: 20, color: Color.fromRGBO(30, 60, 87, 1), fontWeight: FontWeight.w600),
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.Christi),
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                  Constants.didnt_recieve_code,
                                style: TextStyle(
                                  fontSize: 18
                                ),
                              ),
                              TextButton(
                                onPressed: (){

                                },
                                child: Text(
                                  Constants.resend,
                                  style: TextStyle(
                                      fontSize: 18,
                                    color: Theme.of(context).colorScheme.error,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          height: 60,
                          width: double.maxFinite,
                          child: Observer(
                              builder: (_) => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).colorScheme.primary,
                                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                                  onSurface: AppColors.Black, // Disable color
                                ),
                                onPressed: vm.canProceed&&!vm.verifying ? (){
                                  vm.onVerifyOtp();
                                } : null,
                                child: !vm.verifying ? Text(
                                  Constants.verifyNow,
                                  style: TextStyle(
                                      color: AppColors.Black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500
                                  ),
                                ) : CircularProgressIndicator(),
                              )
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }


  @override
  void initState() {
    super.initState();
    vm.onMobileAndOtp(widget.mobileAndOtp);
    _disposers = [
      reaction((_) => vm.snackbarMessage, //to observe
              (value) {
            var v = value as Wrapper<String>;
            if(v.core!=""){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(v.core),
                duration: Duration(seconds: 2),
              ));
            }
          }),
    ];
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    super.dispose();
  }

  getPaddingCap() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 80.0;
    }
    else if(w<=1080){
      return 190.0;
    }
    else{
      return 190.0;
    }
  }
}

class Responsive{
  static  T get<T>(BuildContext context,Map<double,T> map){
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;


    List<double> keys = map.keys.toList();
    keys.sort();
    var count = keys.length;
    var last = map[keys[count-1]] as T;
    for(var i = 0;i<count;++i){
      if(w<=keys[i]){
        return map[keys[i]] as T;
      }
    }
    return last;
  }
}
