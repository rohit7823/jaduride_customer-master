import 'package:flutter/cupertino.dart';

class AccountContent extends StatefulWidget {
  const AccountContent({Key? key}) : super(key: key);

  @override
  State<AccountContent> createState() => _AccountContentState();
}

class _AccountContentState extends State<AccountContent> {
  @override
  Widget build(BuildContext context) {
    return Text("Account");
  }
}
