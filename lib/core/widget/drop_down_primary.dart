import 'package:flutter/material.dart';

class DropDownPrimary extends StatelessWidget {
  String label;
  String? Function(dynamic)? validator;
  void Function(dynamic)? onChange;
  List<DropdownMenuItem> items;
  dynamic value;

  DropDownPrimary({
    required this.label,
    this.validator,
    required this.items,
    this.onChange,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(2.0),
        ),
      ),
      items: items,
      value: value,
      onChanged: onChange,
      validator: validator,
    );
  }
}
