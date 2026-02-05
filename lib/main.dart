import 'package:blahblah/model/ride/ride.dart';
import 'package:blahblah/services/rides_service.dart';

void main() {
  List<Ride> available = RidesService.filterBySeatRequested(4);
  print(available);
}
