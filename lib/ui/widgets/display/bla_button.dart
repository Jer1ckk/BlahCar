import 'package:blahblah/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class BlaButton extends StatelessWidget {
  const BlaButton({
    super.key,
    this.isPrimary = true,
    required this.text,
    this.iconData,
    required this.onTap,
  });

  final bool isPrimary;
  final String text;
  final IconData? iconData;
  final VoidCallback onTap;

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
        border: Border.all(color: BlaColors.greyLight),
      ),

      child: GestureDetector(
        onTap: onTap,
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
      ),
    );
  }
}
