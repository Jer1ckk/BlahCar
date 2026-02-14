import 'package:blahblah/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  const BlaButton({
    super.key,
    required this.text,
    required this.onTap,
    this.type = BlaButtonType.primary,
    this.iconData,
  });

  final BlaButtonType type;
  final String text;
  final VoidCallback onTap;
  final IconData? iconData;

  Color get buttonColor =>
      type == BlaButtonType.primary ? BlaColors.primary : BlaColors.white;
  Color get textAndIconColor =>
      type == BlaButtonType.primary ? BlaColors.white : BlaColors.primary;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        height: 50,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(BlaSpacings.radius),
          border: Border.all(color: BlaColors.greyLight),
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 20,
          children: [
            if (iconData != null) Icon(iconData, color: textAndIconColor),
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
