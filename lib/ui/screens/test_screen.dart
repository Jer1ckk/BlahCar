import 'package:blahblah/ui/theme/theme.dart';
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
              BlaButton(text: "Primary", iconData: Icons.calendar_month),
              SizedBox(height: 10),
              BlaButton(
                isPrimary: false,
                text: "Secondary",
                iconData: Icons.swap_vert_circle_sharp,
              ),
              SizedBox(height: 10),
              BlaButton(
                isPrimary: false,
                text: "Secondary",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class BlaButton extends StatelessWidget {
  const BlaButton({
    super.key,
    this.isPrimary = true,
    required this.text,
    this.iconData,
  });

  final bool isPrimary;
  final String text;
  final IconData? iconData;

  Color get buttonColor => isPrimary ? BlaColors.primary : BlaColors.white;
  Color get textAndIconColor => isPrimary ? BlaColors.white : BlaColors.primary;
  bool get hasIcon => iconData != null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      height: 50,
      decoration: BoxDecoration(
        color: buttonColor,
        borderRadius: BorderRadius.circular(BlaSpacings.radius),
        border: Border.all(color: BlaColors.greyLight ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 20,
        children: [
          if (hasIcon) Icon(iconData, color: textAndIconColor),
          Text(
            text,
            style: BlaTextStyles.button.copyWith(color: textAndIconColor),
          ),
        ],
      ),
    );
  }
}
