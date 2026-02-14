import '../data/dummy_data.dart';
import '../model/ride/locations.dart';

////
///   This service handles:
///   - The list of available rides
///
class LocationsService {
  static const List<Location> availableLocations =
      fakeLocations; // TODO for now fake data

  static List<Location> searchLocations(String input) {
    final query = input.toLowerCase();

    return availableLocations
        .where((location) => location.name.toLowerCase().contains(query))
        .toList();
  }
}
