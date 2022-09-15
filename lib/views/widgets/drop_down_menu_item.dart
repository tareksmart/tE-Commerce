import 'package:flutter/material.dart';

class DropDownMenuCompomnent extends StatelessWidget {
  final List<String> items;
  final String hint;
  final void Function(String? value) onChanged;
  const DropDownMenuCompomnent(
      {Key? key,
      required this.items,
      required this.onChanged,
      required this.hint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        value: null,
        hint: FittedBox(
          child: Text(hint),
        ),
        icon: const Icon(Icons.arrow_drop_down),
        isExpanded: false,
        elevation: 16,
        items: items.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList(),
        onChanged: onChanged);
  }
}
