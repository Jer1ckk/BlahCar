import '../data/dummy_data.dart';
import '../model/ride/locations.dart';
import '../model/ride/ride.dart';

////
///   This service handles:
///   - The list of available rides
///
class RidesService {
  static List<Ride> availableRides = fakeRides;

  static List<Ride> filterByDeparture(Location departure) {
    List<Ride> rides = availableRides
        .where((e) => e.departureLocation == departure)
        .toList();
    return rides;
  }

  static List<Ride> filterBySeatRequested(int seatRequested) {
    List<Ride> rides = availableRides
        .where((e) => e.availableSeats >= seatRequested)
        .toList();
    return rides;
  }

  static List<Ride> filterBy({Location? departure, int? seatRequested}) {
    List<Ride> rides = [];
    if (departure != null && seatRequested == null) {
      rides = availableRides.where((e) => e.departureLocation == departure).toList();
    } else if (departure == null && seatRequested != null) {
      rides = availableRides.where((e) => e.availableSeats >= seatRequested).toList();
    } else {
      rides = availableRides;
    }
    return rides;
  }
}
