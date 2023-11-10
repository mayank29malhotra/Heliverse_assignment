import 'package:flutter/material.dart';
class CustomDropdown extends StatefulWidget {
  final String value;
  final List<String> items;
  final Function(String) onChanged;

  CustomDropdown({
    required this.value,
    required this.items,
    required this.onChanged,
  });

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      initialValue: widget.value,
      onSelected: (value) {
        widget.onChanged(value);
      },
      itemBuilder: (BuildContext context) {
        return widget.items.map((String value) {
          return PopupMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList();
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4.0),
        ),
        child: Row(
          children: [
            Text(widget.value),
            Icon(Icons.arrow_drop_down),
          ],
        ),
      ),
    );
  }
}
