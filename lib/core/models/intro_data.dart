import '../../app/image_assets.dart';

class IntroData{
  IntroData(this.image,this.title,this.message);
  final String image;
  final String title;
  final String message;

  static List<IntroData> introData = [
    IntroData(
        ImageAssets.intro1,
        "Book a Ride",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."
    ),
    IntroData(
        ImageAssets.intro2,
        "Book Delivery",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."
    ),
    IntroData(
        ImageAssets.intro3,
        "Book on Call",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."
    ),
    IntroData(
        ImageAssets.intro4,
        "Scan and Book",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."
    ),
    IntroData(
        ImageAssets.intro5,
        "Ride Now, Pay Later",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed vel odio sit amet."
    ),
  ];
}