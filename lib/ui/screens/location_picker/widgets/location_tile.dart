import 'package:blahblah/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum LocationType { pastLocation, newLocation }

class LocationTile extends StatelessWidget {
  const LocationTile({
    super.key,
    required this.city,
    required this.country,
    this.type = LocationType.newLocation,
    required this.onSelected,
  });

  final String city;
  final String country;
  final LocationType type;

  final VoidCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: ListTile(
        leading: type != LocationType.newLocation ? null : Icon(Icons.history),
        title: Text(city, style: BlaTextStyles.body),
        subtitle: Text(
          country,
          style: BlaTextStyles.label.copyWith(color: BlaColors.textLight),
        ),
        trailing: IconButton(
          onPressed: onSelected,
          icon: Icon(
            Icons.arrow_forward_ios,
            color: BlaColors.iconLight,
            size: 16,
          ),
        ),
      ),
    );
  }
}
