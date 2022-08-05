import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jaduride/extensions.dart';

import '../../core/models/service.dart';
import '../constants.dart';
import '../image_assets.dart';
import '../theme.dart';
import '../view_models/home_content_view_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {

  GoogleMapController? _controller;



  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  var vm = HomeContentViewModel();
  var factor = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 16,
                  left: 24,
                  right: 24
              ),
              child: Text(
                Constants.homeMessage,
                style: TextStyle(
                    fontSize: 23
                ),
              ),
            ),
            Observer(
                builder: (_) => Padding(
                  padding: EdgeInsets.only(
                      top: (1-vm.factor)*64
                  ),
                  child: Image.asset(ImageAssets.splashBuilding),
                )
            )
          ],
        ),
        NotificationListener<DraggableScrollableNotification>(
          onNotification: (DraggableScrollableNotification notification){
            factor = (notification.extent - 0.75)/0.25;
            vm.factor = factor;
            return false;
          },
          child: SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.75,
              minChildSize: 0.75,
              builder: (BuildContext context, ScrollController scrollController) {
                return Container(
                  decoration: BoxDecoration(
                      color: AppColors.White,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular((1.0-factor)*32),
                        topRight: Radius.circular((1.0-factor)*32),
                      )
                  ),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    controller: scrollController,
                    scrollDirection: Axis.vertical,
                    children: [
                      HomePageServices(),
                      PlaceSearch(),
                      Padding(
                        padding: EdgeInsets.all(16.0),
                        child: SizedBox(
                          width: double.maxFinite,
                          height: 250,
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child:
                            Observer(
                                builder: (_) => GoogleMap(
                                  rotateGesturesEnabled: false,
                                  zoomControlsEnabled: false,
                                  scrollGesturesEnabled: false,
                                  markers: vm.markers,
                                  mapType: MapType.normal,
                                  initialCameraPosition: CameraPosition(
                                    target: LatLng(37.42796133580664, -122.085749655962),
                                    zoom: 14.4746,
                                  ),
                                  onMapCreated: (GoogleMapController controller) {
                                    _controller = controller;
                                    vm.getCurrentLocation().then((value){
                                      vm.onLocationObtained(value);
                                      _controller?.animateCamera(
                                        CameraUpdate.newCameraPosition(
                                          CameraPosition(target: LatLng(value.latitude, value.longitude),zoom: 15),
                                        ),
                                      );
                                    });
                                  },
                                  myLocationEnabled: true,
                                )
                            ),
                          ),
                        ),
                      ),
                      Observer(
                          builder: (_)=>Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: vm.recentRides.length,
                              itemBuilder: (context,i){
                                var ride = vm.recentRides[i];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.Gallery,
                                            blurRadius: 8.0, // soften the shadow
                                            spreadRadius: 0.0, //extend the shadow
                                            offset: const Offset(
                                              5.0, // Move to right 10  horizontally
                                              5.0, // Move to bottom 10 Vertically
                                            ),
                                          ),
                                          BoxShadow(
                                            color: AppColors.Gallery,
                                            blurRadius: 8.0, // soften the shadow
                                            spreadRadius: 0.0, //extend the shadow
                                            offset: const Offset(
                                              -5.0, // Move to right 10  horizontally
                                              -5.0, // Move to bottom 10 Vertically
                                            ),
                                          ),
                                        ]
                                    ),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16,right: 16,top: 16),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(top: 8),
                                                child: Container(
                                                  width: 8,
                                                  height: 8,
                                                  decoration: BoxDecoration(
                                                    color: AppColors.Salem,
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 12,),
                                              Column(
                                                children: [
                                                  Text(
                                                    ride.from.address,
                                                    style: TextStyle(
                                                      color: AppColors.SilverChalice,
                                                      fontSize: 12
                                                    ),
                                                  ),
                                                  Text(
                                                      ride.from.place,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Spacer(),
                                              Icon(
                                                  Icons.add,
                                                color: AppColors.SilverChalice,
                                              )
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(horizontal: 32),
                                          child: Divider(),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 16),
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                  color: AppColors.Salem,
                                                  borderRadius: BorderRadius.circular(100),
                                                ),
                                              ),
                                              const SizedBox(width: 12,),
                                              Column(
                                                children: [
                                                  Text(
                                                    ride.to.address,
                                                    style: TextStyle(
                                                      color: AppColors.SilverChalice,
                                                      fontSize: 12
                                                    ),
                                                  ),
                                                  Text(
                                                      ride.to.place,
                                                    style: TextStyle(
                                                      fontSize: 16,
                                                      fontWeight: FontWeight.bold
                                                    ),
                                                  )
                                                ],
                                              ),
                                              Spacer(),
                                              Icon(
                                                  Icons.add,
                                                color: AppColors.SilverChalice,
                                              )
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            ),
                          )
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  PlaceSearch(){
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        width: double.maxFinite,
        height: 60,
        child: Container(
            decoration: BoxDecoration(
                color: AppColors.White,
                borderRadius: BorderRadius.circular(160),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.Gallery,
                    blurRadius: 8.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: const Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  ),
                  BoxShadow(
                    color: AppColors.Gallery,
                    blurRadius: 8.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: const Offset(
                      -5.0, // Move to right 10  horizontally
                      -5.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ]
            ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Icon(
                    Icons.search,
                    size: 32,
                ),
                Text(
                    Constants.whereTo,
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
                Spacer(),
                SizedBox(
                  height: 40,
                  child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.primary,
                          borderRadius: BorderRadius.circular(160),
                      ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Row(
                        children: [
                          Icon(
                              Icons.access_time,
                            size: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: Text(vm.time.title),
                          ),
                          Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  HomePageServices(){
    return Padding(
      padding: const EdgeInsets.only(top: 16),
      child: SizedBox(
        width: double.maxFinite,
        height: 130,
        child: ListView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: [
            ServiceWidget(JaduService.Ride,(){vm.onTapService(JaduService.Ride);}),
            ServiceWidget(JaduService.Delivery,(){vm.onTapService(JaduService.Delivery);}),
            ServiceWidget(JaduService.Book,(){vm.onTapService(JaduService.Book);}),
            ServiceWidget(JaduService.Scan,(){vm.onTapService(JaduService.Scan);}),
            ServiceWidget(JaduService.PayLater,(){vm.onTapService(JaduService.PayLater);}),
          ],
        ),
      ),
    );
  }

  ServiceWidget(JaduService service, Function() onTap){
    return Padding(
      padding: const EdgeInsets.only(left: 16,top: 16),
      child: Column(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: AppColors.White,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.Gallery,
                    blurRadius: 8.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: const Offset(
                      5.0, // Move to right 10  horizontally
                      5.0, // Move to bottom 10 Vertically
                    ),
                  ),
                  BoxShadow(
                    color: AppColors.Gallery,
                    blurRadius: 8.0, // soften the shadow
                    spreadRadius: 0.0, //extend the shadow
                    offset: const Offset(
                      -5.0, // Move to right 10  horizontally
                      -5.0, // Move to bottom 10 Vertically
                    ),
                  ),
                ]
            ),
            child: Material(
              clipBehavior: Clip.hardEdge,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              child: InkWell(
                onTap: onTap,
                child: Center(
                  child: SvgPicture.asset(service.image),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8,),
          GestureDetector(
            onTap: onTap,
            child: Text(
                service.title,
              style: const TextStyle(
                fontSize: 16
              ),
            ),
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    vm.onInit();
  }
}
