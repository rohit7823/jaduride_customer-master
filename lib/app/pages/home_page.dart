import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jaduride/app/image_assets.dart';
import 'package:jaduride/app/pages/account_content.dart';
import 'package:jaduride/app/pages/home_content.dart';
import 'package:jaduride/app/view_models/home_view_model.dart';

import '../constants.dart';
import '../theme.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var vm = HomeViewModel();
  var factor = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
        child: Observer(
        builder: (_) => getContent()
        ),
      ),
      bottomNavigationBar:
      Observer(
          builder: (_) => SizedBox(
            height: 80,
            child: BottomNavigationBar(
              onTap: (tab){
                vm.onTabSelected(tab);
              },
              currentIndex: vm.currentTab,
              type: BottomNavigationBarType.shifting,
              selectedIconTheme: IconThemeData(
                  color: Theme.of(context).colorScheme.primary
              ),
              unselectedIconTheme: IconThemeData(
                  color: AppColors.Gray
              ),
              selectedItemColor: Theme.of(context).colorScheme.primary,
              unselectedItemColor: AppColors.Gray,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: Constants.home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: Constants.account,
                ),
              ],
            ),
          )
      ),
    );
  }

  getContent() {
    return AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
      child: vm.currentTab==0 ? const HomeContent() : const AccountContent(),
    );
  }
}
