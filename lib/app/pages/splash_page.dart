import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jaduride/app/image_assets.dart';
import 'package:jaduride/app/view_models/splash_view_model.dart';
import 'package:mobx/mobx.dart';
import 'package:sprintf/sprintf.dart';

import '../../core/models/base_url_response.dart';
import '../../extensions.dart';
import '../constants.dart';
import '../widgets.dart';

final vm = SplashViewModel();

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with WidgetsBindingObserver {

  List<ReactionDisposer> _disposers = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SplashLogo(),
                SplashTextLogo(),
                Observer(
                    builder: (_) => SplashLoader()
                )
              ],
            )
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(ImageAssets.splashBuilding),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(sprintf(Constants.versionText, [Constants.versionName])),
              ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    vm.onInit();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _disposers = [
      reaction(
            (_) => vm.showDialog,//to observe
            (value) {
              var d = value as DialogTrigger;
              showMyDialog(d,context,(BuildContext context) {return VersionUpdateDialog(context,d.controlData);});
            }
      ),
    ];
  }

  @override
  void dispose() {
    for (var d in _disposers) {
      d();
    }
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("=============="+state.name);
  }

  SplashLoader() {
    if(vm.retried>=6){
      return TextButton(
          onPressed: (){
            vm.onInit();
          },
          child: Text(
              "Try again",
            style: TextStyle(
              color: Theme.of(context).colorScheme.error
            ),
          )
      );
    }
    else{
      return Loader();
    }
  }
}