import 'dart:math';
import 'package:jaduride/core/models/data_state.dart';
import "package:velocity_x/velocity_x.dart";
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_multi_formatter/formatters/masked_input_formatter.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaduride/app/theme.dart';
import 'package:jaduride/app/view_models/mobile_input_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/wrapper.dart';
import '../constants.dart';
import '../image_assets.dart';

MobileInputViewModel vm = MobileInputViewModel();

class MobileInput extends StatefulWidget {
  const MobileInput({Key? key}) : super(key: key);

  @override
  State<MobileInput> createState() => _MobileInputState();
}

class _MobileInputState extends State<MobileInput> {
  List<ReactionDisposer> _disposers = [];
  final mobileController = TextEditingController();
  var focusNode = FocusNode();


  @override
  Widget build(BuildContext context) {
    var p = MediaQuery.of(context).viewInsets.bottom;
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Image.asset(ImageAssets.splashBuilding),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 26,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Text(
                      Constants.loginOrRegister,
                    style: TextStyle(
                      fontSize: 34
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 34),
                  child: Text(
                    Constants.withYourMobileNumber,
                    style: TextStyle(
                        fontSize: 18
                    ),
                  ),
                ),
                SizedBox(
                  height: 108,
                ),
                /*Expanded(
                  child: Container(
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      color: AppColors.White,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(32),
                            topRight: Radius.circular(32),
                        )
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 48,left: 32,right: 32),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColors.White,
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.Gallery,
                                  blurRadius: 8.0, // soften the shadow
                                  spreadRadius: 0.0, //extend the shadow
                                  offset: Offset(
                                    5.0, // Move to right 10  horizontally
                                    5.0, // Move to bottom 10 Vertically
                                  ),
                                ),
                                BoxShadow(
                                  color: AppColors.Gallery,
                                  blurRadius: 8.0, // soften the shadow
                                  spreadRadius: 0.0, //extend the shadow
                                  offset: Offset(
                                    -5.0, // Move to right 10  horizontally
                                    -5.0, // Move to bottom 10 Vertically
                                  ),
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Row(
                                    children: [
                                      Image.asset(
                                          ImageAssets.flagIndia,
                                        width: 38.8,
                                          height: 26,
                                      ),
                                      SizedBox(
                                        width: 12.81,
                                      ),
                                      Text(
                                          "+91",
                                        style: TextStyle(
                                          fontSize: 16
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 42,
                                  width: 0.25,
                                  decoration: BoxDecoration(
                                    color: AppColors.Gray
                                  )
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        child: Stack(
                                          children: [
                                            TextField(
                                              focusNode: focusNode,
                                              controller: mobileController,
                                              onChanged: (value){
                                                vm.onMobileInputChanged(value);
                                              },
                                              decoration: InputDecoration(
                                                border: InputBorder.none,
                                                hintText: 'Mobile',
                                                counterText: ""
                                              ),
                                              inputFormatters: [
                                                MaskedInputFormatter('000-000-0000')
                                              ],
                                              maxLength: 12,
                                              style: TextStyle(
                                                fontSize: 16
                                              ),
                                            ),
                                            Positioned.fill(
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: InkWell(
                                                  onTap: (){
                                                    var v = "";
                                                    mobileController.text = v;
                                                    vm.onMobileInputChanged(v);
                                                  },
                                                  child: Container(
                                                    width: 20,
                                                      height: 20,
                                                      decoration: BoxDecoration(
                                                        color: AppColors.Mercury,
                                                        shape: BoxShape.circle
                                                      ),
                                                      child: Icon(
                                                          Icons.clear,
                                                        color: AppColors.White,
                                                        size: 16,
                                                      )
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                    ),
                                  ),
                                )
                              ],

                            ),
                          ),
                          SizedBox(
                            height: 16,
                          ),
                          Container(
                            width: double.maxFinite,
                            height: 48,
                            child: Observer(
                              builder: (_) => ElevatedButton(
                                onPressed: vm.canProceed ? (){
                                  vm.onContinue(mobileController.text);} : null,
                                child: Text("Continue"),
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).colorScheme.secondary,
                                  onPrimary: Theme.of(context).colorScheme.onSecondary,
                                  onSurface: AppColors.Black, // Disable color
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Text(
                              "By Proceeding, you consent to get calls, WhaatsAoo or SMS messages, including automated means, form Jadu Ride and its affiliates to the number provided.",
                            style: TextStyle(
                              color: AppColors.SilverChalice,
                              fontSize: 12
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Container(
                            width: double.maxFinite,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Divider(
                                      thickness: 1,
                                    )
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8),
                                  child: Text(
                                      "OR",
                                    style: TextStyle(
                                      fontSize: 19
                                    ),
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                      thickness: 1,
                                    )
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 38,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: Material(
                                  elevation: 4,
                                  shape: CircleBorder(),
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    onTap: () async{
                                      GoogleSignIn _googleSignIn = GoogleSignIn(
                                        scopes: [
                                          'email',
                                          'https://www.googleapis.com/auth/contacts.readonly',
                                        ],
                                      );

                                      try {
                                        var v = await _googleSignIn.signIn();
                                        print(v?.email);
                                      } catch (error) {
                                        print(error);
                                      }
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                          ImageAssets.googleLogo,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: AppColors.White,
                                  shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.Gallery,
                                        blurRadius: 8.0, // soften the shadow
                                        spreadRadius: 2.0, //extend the shadow
                                        offset: Offset(
                                          5.0, // Move to right 10  horizontally
                                          5.0, // Move to bottom 10 Vertically
                                        ),
                                      ),
                                      BoxShadow(
                                        color: AppColors.Gallery,
                                        blurRadius: 8.0, // soften the shadow
                                        spreadRadius: 2.0, //extend the shadow
                                        offset: Offset(
                                          -5.0, // Move to right 10  horizontally
                                          -5.0, // Move to bottom 10 Vertically
                                        ),
                                      ),
                                    ]
                                ),
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Container(
                                child: Material(
                                  elevation: 4,
                                  shape: CircleBorder(),
                                  clipBehavior: Clip.hardEdge,
                                  child: InkWell(
                                    onTap: (){},
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: SvgPicture.asset(
                                        ImageAssets.facebookLogo,
                                        width: 40,
                                        height: 40,
                                      ),
                                    ),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                    color: AppColors.White,
                                    shape: BoxShape.circle,
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.Gallery,
                                        blurRadius: 8.0, // soften the shadow
                                        spreadRadius: 2.0, //extend the shadow
                                        offset: Offset(
                                          5.0, // Move to right 10  horizontally
                                          5.0, // Move to bottom 10 Vertically
                                        ),
                                      ),
                                      BoxShadow(
                                        color: AppColors.Gallery,
                                        blurRadius: 8.0, // soften the shadow
                                        spreadRadius: 2.0, //extend the shadow
                                        offset: Offset(
                                          -5.0, // Move to right 10  horizontally
                                          -5.0, // Move to bottom 10 Vertically
                                        ),
                                      ),
                                    ]
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )*/
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: max(getTopPadding()-p,0)),
              child: Container(
                width: double.maxFinite,
                height: double.maxFinite,
                decoration: BoxDecoration(
                    color: AppColors.White,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    )
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 48,left: 32,right: 32),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.White,
                            boxShadow: [
                              BoxShadow(
                                color: AppColors.Gallery,
                                blurRadius: 8.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  5.0, // Move to right 10  horizontally
                                  5.0, // Move to bottom 10 Vertically
                                ),
                              ),
                              BoxShadow(
                                color: AppColors.Gallery,
                                blurRadius: 8.0, // soften the shadow
                                spreadRadius: 0.0, //extend the shadow
                                offset: Offset(
                                  -5.0, // Move to right 10  horizontally
                                  -5.0, // Move to bottom 10 Vertically
                                ),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImageAssets.flagIndia,
                                      width: 38.8,
                                      height: 26,
                                    ),
                                    SizedBox(
                                      width: 12.81,
                                    ),
                                    Text(
                                      "+91",
                                      style: TextStyle(
                                          fontSize: 16
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                  height: 42,
                                  width: 0.25,
                                  decoration: BoxDecoration(
                                      color: AppColors.Gray
                                  )
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    child: Stack(
                                      children: [
                                        TextField(
                                          focusNode: focusNode,
                                          controller: mobileController,
                                          onChanged: (value){
                                            vm.onMobileInputChanged(value);
                                          },
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintText: 'Mobile',
                                              counterText: ""
                                          ),
                                          inputFormatters: [
                                            MaskedInputFormatter('000-000-0000')
                                          ],
                                          maxLength: 12,
                                          style: TextStyle(
                                              fontSize: 16
                                          ),
                                        ),
                                        Positioned.fill(
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: InkWell(
                                              onTap: (){
                                                var v = "";
                                                mobileController.text = v;
                                                vm.onMobileInputChanged(v);
                                              },
                                              child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: BoxDecoration(
                                                      color: AppColors.Mercury,
                                                      shape: BoxShape.circle
                                                  ),
                                                  child: Icon(
                                                    Icons.clear,
                                                    color: AppColors.White,
                                                    size: 16,
                                                  )
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],

                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        Container(
                          width: double.maxFinite,
                          height: 48,
                          child: Observer(
                            builder: (_) => ElevatedButton(
                              onPressed: vm.canProceed&&vm.otpState.core!=DataState.LOADING ? (){
                                vm.onContinue(mobileController.text);} : null,
                              child: vm.otpState.core==DataState.LOADING ? CircularProgressIndicator() : Text(Constants.continueText),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).colorScheme.secondary,
                                onPrimary: Theme.of(context).colorScheme.onSecondary,
                                onSurface: AppColors.Black, // Disable color
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Text(
                          "By Proceeding, you consent to get calls, WhaatsAoo or SMS messages, including automated means, form Jadu Ride and its affiliates to the number provided.",
                          style: TextStyle(
                              color: AppColors.SilverChalice,
                              fontSize: 12
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Container(
                          width: double.maxFinite,
                          child: Row(
                            children: [
                              Expanded(
                                  child: Divider(
                                    thickness: 1,
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  "OR",
                                  style: TextStyle(
                                      fontSize: 19
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                    thickness: 1,
                                  )
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 38,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Material(
                                elevation: 4,
                                shape: CircleBorder(),
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  onTap: () async{
                                    GoogleSignIn _googleSignIn = GoogleSignIn(
                                      scopes: [
                                        'email',
                                        'https://www.googleapis.com/auth/contacts.readonly',
                                      ],
                                    );

                                    try {
                                      var v = await _googleSignIn.signIn();
                                      print(v?.email);
                                    } catch (error) {
                                      print(error);
                                    }
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      ImageAssets.googleLogo,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.White,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.Gallery,
                                      blurRadius: 8.0, // soften the shadow
                                      spreadRadius: 2.0, //extend the shadow
                                      offset: Offset(
                                        5.0, // Move to right 10  horizontally
                                        5.0, // Move to bottom 10 Vertically
                                      ),
                                    ),
                                    BoxShadow(
                                      color: AppColors.Gallery,
                                      blurRadius: 8.0, // soften the shadow
                                      spreadRadius: 2.0, //extend the shadow
                                      offset: Offset(
                                        -5.0, // Move to right 10  horizontally
                                        -5.0, // Move to bottom 10 Vertically
                                      ),
                                    ),
                                  ]
                              ),
                            ),
                            SizedBox(
                              width: 12,
                            ),
                            Container(
                              child: Material(
                                elevation: 4,
                                shape: CircleBorder(),
                                clipBehavior: Clip.hardEdge,
                                child: InkWell(
                                  onTap: (){},
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: SvgPicture.asset(
                                      ImageAssets.facebookLogo,
                                      width: 40,
                                      height: 40,
                                    ),
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                  color: AppColors.White,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                      color: AppColors.Gallery,
                                      blurRadius: 8.0, // soften the shadow
                                      spreadRadius: 2.0, //extend the shadow
                                      offset: Offset(
                                        5.0, // Move to right 10  horizontally
                                        5.0, // Move to bottom 10 Vertically
                                      ),
                                    ),
                                    BoxShadow(
                                      color: AppColors.Gallery,
                                      blurRadius: 8.0, // soften the shadow
                                      spreadRadius: 2.0, //extend the shadow
                                      offset: Offset(
                                        -5.0, // Move to right 10  horizontally
                                        -5.0, // Move to bottom 10 Vertically
                                      ),
                                    ),
                                  ]
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
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
  void didChangeDependencies() {
    super.didChangeDependencies();

  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    super.dispose();
  }

  getTopPadding() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 120;
    }
    else if(w<=1080){
      return 220;
    }
    else{
      return 250;
    }
  }
}

class NumberTextInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final int newTextLength = newValue.text.length;
    int selectionIndex = newValue.selection.end;
    int usedSubstringIndex = 0;
    final StringBuffer newText = new StringBuffer();
    if (newTextLength >= 1) {
      newText.write('+');
      if (newValue.selection.end >= 1) selectionIndex++;
    }
    if (newTextLength >= 3) {
      newText.write(newValue.text.substring(0, usedSubstringIndex = 2) + ' ');
      if (newValue.selection.end >= 2) selectionIndex += 1;
    }
    // Dump the rest.
    if (newTextLength >= usedSubstringIndex)
      newText.write(newValue.text.substring(usedSubstringIndex));
    return new TextEditingValue(
      text: newText.toString(),
      selection: new TextSelection.collapsed(offset: selectionIndex),
    );
  }
}
