import 'package:blahblah/ui/widgets/display/bla_divider.dart';
import 'package:flutter/material.dart';
import 'package:blahblah/ui/theme/theme.dart';

class RidePreferences extends StatelessWidget {
  const RidePreferences({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RidePreferencesForm(),
          ),
        ),
      ),
    );
  }
}

class RidePreferencesForm extends StatefulWidget {
  const RidePreferencesForm({super.key});

  @override
  State<RidePreferencesForm> createState() => _RidePreferencesFormState();
}

class _RidePreferencesFormState extends State<RidePreferencesForm> {
  final TextEditingController departureController = TextEditingController();
  final TextEditingController destinationController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController seatController = TextEditingController();

  @override
  void dispose() {
    departureController.dispose();
    destinationController.dispose();
    dateController.dispose();
    seatController.dispose();
    super.dispose();
  }

  Future<void> pickDate() async {
    DateTime? selected = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (selected != null) {
      dateController.text =
          "${selected.day}/${selected.month}/${selected.year}";
    }
  }

  void swapLocations() {
    final departure = departureController.text;
    final destination = destinationController.text;

    if (departure.isNotEmpty && destination.isNotEmpty) {
      departureController.text = destination;
      destinationController.text = departure;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(BlaSpacings.m),
      decoration: BoxDecoration(
        border: Border.all(color: BlaColors.greyLight),
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 10),

          // departure
          TextField(
            controller: departureController,
            decoration: InputDecoration(
              hintText: "Toulouse",
              hintStyle: TextStyle(color: BlaColors.greyLight),
              prefixIcon: Icon(Icons.circle_outlined, color: BlaColors.neutral),
              suffixIcon: IconButton(
                onPressed: swapLocations,
                icon: Icon(Icons.swap_vert),
                color: BlaColors.primary,
              ),
              border: InputBorder.none,
            ),
          ),

          Divider(
            color: BlaColors.greyLight,
            thickness: 1,
            indent: 30,
            endIndent: 20,
          ),

          // destination
          TextField(
            controller: destinationController,
            decoration: InputDecoration(
              hintText: "Paris",
              hintStyle: TextStyle(color: BlaColors.greyLight),
              prefixIcon: Icon(Icons.circle_outlined),
              border: InputBorder.none,
            ),
          ),
          Divider(
            color: BlaColors.greyLight,
            thickness: 1,
            indent: 30,
            endIndent: 20,
          ),

          // date
          TextField(
            controller: dateController,
            onTap: pickDate,
            decoration: InputDecoration(
              hintText: "12/01/2026",
              hintStyle: TextStyle(color: BlaColors.greyLight),
              prefixIcon: Icon(Icons.calendar_today),
              border: InputBorder.none,
            ),
          ),
          Divider(
            color: BlaColors.greyLight,
            thickness: 1,
            indent: 30,
            endIndent: 20,
          ),

          // seat
          TextField(
            controller: seatController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.person),
              hintText: "0",
              hintStyle: TextStyle(color: BlaColors.greyLight),
              border: InputBorder.none,
            ),
          ),

          // search button
          GestureDetector(
            onTap: () => {},
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: BlaColors.primary,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(BlaSpacings.radius),
                  bottomRight: Radius.circular(BlaSpacings.radius),
                ),
              ),
              child: Center(
                child: Text(
                  "Search",
                  style: BlaTextStyles.button.copyWith(color: BlaColors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
