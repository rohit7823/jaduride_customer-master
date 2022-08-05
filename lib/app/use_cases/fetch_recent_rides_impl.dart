import 'package:jaduride/core/models/recent_rides.dart';
import 'package:jaduride/core/use_cases/fetch_recent_rides_use_case.dart';

class FetchRecentRidesUseCaseImpl extends FetchRecentRidesUseCase{
  @override
  Future<RecentRides> fetchRecentRides() async{
    await Future.delayed(const Duration(seconds: 2));
    return RecentRides(
        status: true,
        message: "",
        rides: [
          Ride(
              id: "1",
              from: AddressPoint(
                address: "address1",
                place: "Place1"
              ),
              to: AddressPoint(
                  address: "address2",
                  place: "Place2"
              )
          ),
          Ride(
              id: "2",
              from: AddressPoint(
                address: "address3",
                place: "Place3"
              ),
              to: AddressPoint(
                  address: "address4",
                  place: "Place4"
              )
          ),
        ]
    );
  }

}