import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jaduride/app/image_assets.dart';
import 'package:jaduride/app/theme.dart';
import 'package:jaduride/app/view_models/personal_details_view_model.dart';
import 'package:mobx/mobx.dart';

import '../../core/models/wrapper.dart';
import '../../extensions.dart';
import '../constants.dart';
import '../widgets.dart';


class PersonalDetails extends StatefulWidget {
  const PersonalDetails(this.mobile,{Key? key}) : super(key: key);
  final String mobile;

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  late final PersonalDetailsViewModel vm;// = PersonalDetailsViewModel();
  List<ReactionDisposer> _disposers = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              width: double.maxFinite,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 27,
                  ),
                  const Text(
                      Constants.personalDetails,
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Image.asset(ImageAssets.splashBuilding)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 190
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 80,
                        left: 24,
                        right: 24
                      ),
                      child: Column(
                        children: [
                          TextField(
                            keyboardType: TextInputType.name,
                            onChanged: (value){
                              vm.onNameChanged(value);
                            },
                            decoration: InputDecoration(
                              hintText: Constants.enterYourName,
                              prefixIcon: Icon(Icons.person),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.SilverChalice),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.SilverChalice),
                              ),
                            )
                            ,
                          ),
                          SizedBox(
                            height: 32,
                          ),
                          TextField(
                            keyboardType: TextInputType.emailAddress,
                            onChanged: (value){
                              vm.onEmailChanged(value);
                            },
                            decoration: InputDecoration(
                              hintText: Constants.enterYourEmail,
                              prefixIcon: Icon(Icons.email),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.SilverChalice),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: AppColors.SilverChalice),
                              ),
                            )
                            ,
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          width: double.maxFinite,
                          height: 60,
                          child: Observer(
                              builder: (_) => ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Theme.of(context).colorScheme.primary,
                                  onPrimary: Theme.of(context).colorScheme.onPrimary,
                                  onSurface: AppColors.Black, // Disable color
                                ),
                                onPressed: vm.valid==true&&!(vm.submitting==true) ? (){
                                  vm.onSubmit();
                                } : null,
                                child: !(vm.submitting==true) ? Text(
                                  Constants.done,
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
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 120
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      vm.pickFile();
                    },
                    child: Container(
                      width: 140,
                      height: 140,
                      decoration: BoxDecoration(
                        color: Colors.red,
                          shape: BoxShape.circle
                      ),
                      child: Stack(
                        children: [
                          Observer(
                              builder: (_)=>getImage()
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                              child: Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: InkWell(
                                  onTap: (){
                                    //vm.pickFile();
                                  },
                                  child: CircleAvatar(
                                    backgroundColor: Theme.of(context).colorScheme.surface,
                                    radius: 18,
                                    child: CircleAvatar(
                                      backgroundColor: Theme.of(context).colorScheme.primary,
                                      radius: 16,
                                        child: const Icon(Icons.edit),
                                    ),
                                  ),
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImage() {
    return CircleAvatar(
      backgroundColor: Theme.of(context).colorScheme.surface,
      radius: 140,
      child: CircleAvatar(
          backgroundImage: vm.file==null ? const AssetImage(ImageAssets.userImage) : getFileImage(vm.file),
        backgroundColor: AppColors.SilverChalice,
        radius: 60,
      ),
    );
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    super.dispose();
  }

  ImageProvider getFileImage(File? file){
    return FileImage(file!);
  }

  @override
  void initState() {
    super.initState();
    vm = PersonalDetailsViewModel();
    vm.onInit(widget.mobile);
    _disposers = [
      reaction(
        (_) => vm.showPickSourceDialog,//to observe
        (value) {
          //var d = value as DialogTrigger;
          if(value is DialogTrigger && value !=  null){
            showMyDialog(value,context,(BuildContext context)=>ImageSourceDialog(context),barrierDismissible: true);
          }
        }
      ),
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
}
