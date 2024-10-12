import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;

class CustomModalDropdown extends StatefulWidget {
  final String? selectedValue;
  final List<String> items;
  final String hintText;
  final Function(String?) onChanged;

  const CustomModalDropdown({
    Key? key,
    required this.selectedValue,
    required this.items,
    required this.hintText,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CustomModalDropdownState createState() => _CustomModalDropdownState();
}

class _CustomModalDropdownState extends State<CustomModalDropdown> {
  void _showModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: ListView.builder(
            itemCount: widget.items.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(
                  widget.items[index],
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'BricolageGrotesque Regular',
                  ),
                ),
                onTap: () {
                  widget.onChanged(widget.items[index]);
                  Navigator.pop(context); // Close modal after selection
                },
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _showModal(context);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: const Color.fromARGB(255, 232, 232, 232),
            width: 1.5,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.selectedValue ?? widget.hintText,
              style: TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Regular',
                color:
                    widget.selectedValue == null ? Colors.grey : Colors.black,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.grey,
            ),
          ],
        ),
      ),
    );
  }
}
