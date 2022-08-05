
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';


import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:vector_math/vector_math.dart' as math;

class DialogTrigger{
  DialogTrigger({this.controlData=null});
  final dynamic controlData;
  void Function(dynamic) callback = (_){};
}
Future triggerDialog(Function(DialogTrigger) builder, {dynamic value}){
  print("1526");
  Completer completer = Completer();
  var d = DialogTrigger(controlData: value)..callback=(result){
    completer.complete(result);
  };
  builder(d);
  return completer.future;
}

showMyDialog(
    DialogTrigger dialogTrigger,
    BuildContext context,
    WidgetBuilder builder,
    {bool barrierDismissible = false}
    ){
  /*showDialog(
    context: context,
    builder: (BuildContext context) {
      return builder(context);
    },
  ).then((result){
    dialogTrigger.callback(result);
  });*/

  showGeneralDialog(
    barrierLabel: "Dialog",
    barrierDismissible: barrierDismissible,
    context: context,
    pageBuilder: (ctx, a1, a2) {
      return builder(ctx);
    },
    transitionBuilder: (ctx, a1, a2, child) {
      var curve = Curves.easeInOut.transform(a1.value);
      return Transform.scale(
        scale: curve,
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 400),
  ).then((result){
    dialogTrigger.callback(result);
  });
}

class MultipartResponse{
  MultipartResponse(this.response,this.body);
  final StreamedResponse response;
  final String body;
}

Future<MultipartResponse> multipart(
    String method,
    String url,
    {
      Map<String, String> headers = const {},
      Map<String, String> fields = const {},
      List<MultipartFile> files = const []
    }
){
  final c = Completer<MultipartResponse>();
  var request = http.MultipartRequest(method, Uri.parse(url));
  request.headers.addAll(headers);
  request.fields.addAll(fields);
  request.files.addAll(files);
  request.send().then((response) {
    response.stream.transform(utf8.decoder).listen((value) {
      c.complete(MultipartResponse(response, value));
    });
  });
  return c.future;
}


class MyBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

