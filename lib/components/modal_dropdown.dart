import 'package:flutter/material.dart';

class CustomModalDropdown extends StatelessWidget {
  final List<String> items;
  final String? selectedValue;

  CustomModalDropdown({required this.items, this.selectedValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: items.map((String account) {
        return ListTile(
          title: Text(
            account,
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
          onTap: () {
            Navigator.pop(
                context, account); // Return selected account to parent
          },
        );
      }).toList(),
    );
  }
}
