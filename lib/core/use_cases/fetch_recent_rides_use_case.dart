import '../models/recent_rides.dart';

abstract class FetchRecentRidesUseCase{
  Future<RecentRides> fetchRecentRides();
}