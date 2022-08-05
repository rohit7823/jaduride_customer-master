import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaduride/app/theme.dart';
import 'package:jaduride/app/view_models/intro_view_model.dart';
import 'package:jaduride/core/models/intro_data.dart';

import '../constants.dart';

IntroViewModel vm = IntroViewModel();

class IntroPage extends StatefulWidget {
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  CarouselController buttonCarouselController = CarouselController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FractionallySizedBox(
        heightFactor: 1,
        child: intro(),
      ),
    );
  }
  intro(){
    return Stack(
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
              onPageChanged: (page,_){
                vm.onPageChange(page);
              },
              enableInfiniteScroll: false,
              onScrolled: (scrolled){
                print(scrolled);
              },
              height: MediaQuery.of(context).size.height,
              viewportFraction: 1
          ),
          items: [0,1,2,3,4].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset(IntroData.introData[i].image),
                        SizedBox(
                          //height: 50,
                          //height: 12,
                          height: getGapInImageAndTitle()
                        ),
                        Text(
                          IntroData.introData[i].title,
                          style: TextStyle(
                            fontSize: 35,
                            color: AppColors.DoveGray,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          IntroData.introData[i].message,
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Observer(
          builder: (_) => skipableAndIndicator()
        ),
      ],
    );
  }
  skipableAndIndicator(){
    if(vm.isLastPage){
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: getButtonBottomPadding(),
                  left: 24,
                  right: 24
              ),
              child: Container(
                height: 60,
                width: double.maxFinite,
                child: ElevatedButton(
                  onPressed: (){
                    vm.onGetStarted();
                  },
                  child: Text(
                      Constants.getStarted,
                    style: TextStyle(
                      color: AppColors.Black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
    else{
      return Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                bottom: getIndicatorBottomPadding()
              ),
              child: Container(
                height: 34,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Observer(
                        builder: (_) => GestureDetector(
                          onTap: (){
                            buttonCarouselController.animateToPage(index);
                            vm.onPageChange(index);
                          },
                          child: Container(
                            width: 18,
                            height: 18,
                            decoration: BoxDecoration(
                                color: vm.currentPage==index ? Theme.of(context).primaryColor : AppColors.Alto,
                                shape: BoxShape.circle
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(
                  //bottom: 178
                bottom: getSkipBottomPadding()
              ),
              child: TextButton(
                onPressed: (){
                  buttonCarouselController.jumpToPage(4);
                },
                child: Text(
                  Constants.skip,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.DoveGray,
                  ),
                ),
              ),
            ),
          )
        ],
      );
    }
  }

  getGapInImageAndTitle() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 12.0;
    }
    else if(w<=1080){
      return 50.0;
    }
    else{
      return 50.0;
    }
  }

  getButtonBottomPadding() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 20.0;
    }
    else if(w<=1080){
      return 60.0;
    }
    else{
      return 60.0;
    }
  }

  getIndicatorBottomPadding() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 20.0;
    }
    else if(w<=1080){
      return 96.0;
    }
    else{
      return 96.0;
    }
  }

  getSkipBottomPadding() {
    var m = MediaQuery.of(context);
    var dpr = m.devicePixelRatio;
    var w = m.size.width*dpr;
    if(w<=768){
      return 55.0;
    }
    else if(w<=1080){
      return 178.0;
    }
    else{
      return 178.0;
    }
  }
}
