import 'package:jaduride/app/image_assets.dart';

import '../../app/constants.dart';

class JaduService{
  final String title;
  final String image;
  JaduService._(this.title,this.image);

  static final Ride = JaduService._(Constants.service_ride, ImageAssets.service_ride);
  static final Delivery = JaduService._(Constants.service_delivery, ImageAssets.service_delivery);
  static final Book = JaduService._(Constants.service_book, ImageAssets.service_book);
  static final Scan = JaduService._(Constants.service_scan, ImageAssets.service_scan);
  static final PayLater = JaduService._(Constants.service_pay_later, ImageAssets.service_pay_later);
}