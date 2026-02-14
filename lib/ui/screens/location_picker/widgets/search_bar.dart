import 'package:blahblah/ui/theme/theme.dart';
import 'package:flutter/material.dart';

class LocationSearchBar extends StatefulWidget {
  const LocationSearchBar({super.key, required this.onChanged});

  final ValueChanged<String> onChanged;

  @override
  State<LocationSearchBar> createState() => _LocationSearchBarState();
}

class _LocationSearchBarState extends State<LocationSearchBar> {
  String _text = "";

  void onClear() {
    setState(() {
      _text = "";
    });
    widget.onChanged("");
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: BlaColors.greyLight,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(Icons.arrow_back_ios_new, size: 20),
            ),
            const SizedBox(width: 8),

            Expanded(
              child: TextField(
                onChanged: (text) {
                  setState(() => _text = text);
                  widget.onChanged(text);
                },
                decoration: const InputDecoration(
                  hintText: "City...",
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(vertical: 8),
                ),
              ),
            ),

            if (_text.isNotEmpty)
              GestureDetector(
                onTap: onClear,
                child: const Icon(Icons.close, size: 20),
              ),
          ],
        ),
      ),
    );
  }
}
