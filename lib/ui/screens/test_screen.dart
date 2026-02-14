import 'package:blahblah/ui/widgets/actions/bla_button.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              BlaButton(
                text: "Primary",
                iconData: Icons.calendar_month,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
