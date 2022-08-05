// ignore_for_file: non_constant_identifier_names

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jaduride/app/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:sprintf/sprintf.dart';

import '../core/models/base_url_response.dart';
import 'animation_assets.dart';
import 'constants.dart';
import 'image_assets.dart';

Loader() {
  return SizedBox(
      width: 128,
      height: 128,
      child: Lottie.asset(AnimationAssets.splashLoader)
  );
}

SplashLogo() {
  return Image.asset(ImageAssets.logo);
}

SplashTextLogo() {
  return Image.asset(ImageAssets.logoText);
}

ImageSourceDialog(BuildContext context) {
  return Dialog(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)), //this right here
    child: Container(
      height: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  highlightColor: Theme.of(context).colorScheme.primary,
                  color: AppColors.Black,
                iconSize: 80,
                  onPressed: (){
                    Navigator.of(context).pop(Constants.camera);
                  },
                  icon: const Center(
                    child: Icon(
                      Icons.camera,
                    ),
                  )
              ),
              const Text(
                  Constants.camera,
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  highlightColor: Theme.of(context).colorScheme.primary,
                  color: AppColors.Black,
                  iconSize: 80,
                  onPressed: (){
                    Navigator.of(context).pop(Constants.gallery);
                  },
                  icon: const Center(
                    child: Icon(
                      Icons.folder,
                    ),
                  )
              ),
              const Text(
                Constants.gallery,
                style: TextStyle(
                    fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}

VersionUpdateDialog(BuildContext context,Version version) {
  return AlertDialog(
    title: const Text(Constants.updateAvailable),
    content: Text(
        sprintf(Constants.versionUpdateText,[version.name])
    ),
    actions: <Widget>[
      version.isSkipable ? ElevatedButton(
        child: const Text(Constants.mayBeLater),
        onPressed: () {
          Navigator.pop(context, false);
        },
      ) : Container(),
      ElevatedButton(
        child: const Text(Constants.ok),
        onPressed: () {
          Navigator.pop(context, true);
        },
      )
    ],
  );
}