import 'package:blahblah/ui/theme/theme.dart';
import 'package:blahblah/ui/widgets/actions/bla_icon_button.dart';
import 'package:flutter/material.dart';

class RidePrefsInput extends StatelessWidget {
  const RidePrefsInput({
    super.key,
    required this.title,
    required this.onPressed,
    required this.leftIcon,
    this.isPlaceHolder = false,
    this.rightIcon,
    this.onRightIconPress,
  });
  final String title;
  final VoidCallback onPressed;
  final IconData leftIcon;

  final bool isPlaceHolder;

  final IconData? rightIcon;
  final VoidCallback? onRightIconPress;

  @override
  Widget build(BuildContext context) {
    Color textColor = isPlaceHolder
        ? BlaColors.textLight
        : BlaColors.textNormal;

    return ListTile(
      onTap: onPressed,
      leading: Icon(leftIcon, size: Blasize.icon, color: BlaColors.iconLight),
      title: Text(
        title,
        style: BlaTextStyles.button.copyWith(fontSize: 14, color: textColor),
      ),
      trailing: rightIcon != null
          ? BlaIconButton(icon: rightIcon, onPressed: onRightIconPress)
          : null,
    );
  }
}
