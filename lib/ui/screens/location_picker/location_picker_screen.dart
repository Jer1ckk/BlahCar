import 'package:blahblah/model/ride/locations.dart';
import 'package:blahblah/services/location_service.dart';
import 'package:blahblah/ui/screens/location_picker/widgets/location_tile.dart';
import 'package:blahblah/ui/screens/location_picker/widgets/search_bar.dart';
import 'package:blahblah/ui/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';

class LocationPickerScreen extends StatefulWidget {
  const LocationPickerScreen({super.key});

  @override
  State<LocationPickerScreen> createState() => _LocationPickerScreenState();
}

class _LocationPickerScreenState extends State<LocationPickerScreen> {
  String searchQuery = "";
  List<Location> searchResults = [];

  void onSearchChanged(String input) {
    setState(() {
      searchQuery = input;

      if (input.length >= 2) {
        searchResults = LocationsService.searchLocations(input);
      } else {
        searchResults = [];
      }
    });
  }

  void onLocationSelected(Location location) {
    Navigator.pop(context, location);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              LocationSearchBar(onChanged: onSearchChanged),
        
              const SizedBox(height: 8),
              Expanded(
                child: ListView.builder(
                  itemCount: searchResults.length,
                  itemBuilder: (ctx, index) {
                    final loc = searchResults[index];
                    return Column(
                      children: [
                        LocationTile(
                          city: loc.name,
                          country: loc.country.name,
                          onSelected: () => onLocationSelected(loc),
                        ),
                        BlaDivider(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
