import 'package:flutter/material.dart';
import 'package:kardly/constants/colors.dart' as color;

class CustomBankDropdown extends StatefulWidget {
  final String selectedBank;
  final List<Map<String, String>> banks;
  final ValueChanged<String> onBankSelected;

  const CustomBankDropdown({
    Key? key,
    required this.selectedBank,
    required this.banks,
    required this.onBankSelected,
  }) : super(key: key);

  @override
  _CustomBankDropdownState createState() => _CustomBankDropdownState();
}

class _CustomBankDropdownState extends State<CustomBankDropdown> {
  late OverlayEntry _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          if (_isDropdownOpen) {
            _closeDropdown();
          } else {
            _openDropdown();
          }
        },
        child: Container(
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            border: Border.all(color: color.AppColor.lightgray, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.selectedBank,
                style: const TextStyle(
                  color: Color.fromARGB(255, 95, 95, 95),
                  fontSize: 12,
                  fontFamily: 'BricolageGrotesque Regular',
                ),
              ),
              const Icon(Icons.arrow_drop_down, color: Colors.black),
            ],
          ),
        ),
      ),
    );
  }

  void _openDropdown() {
    _overlayEntry = _createOverlayEntry();
    OverlayState? overlayState = Overlay.of(context);

    if (overlayState != null) {
      overlayState.insert(_overlayEntry);
      _isDropdownOpen = true;
    }
  }

  void _closeDropdown() {
    _overlayEntry.remove();
    _isDropdownOpen = false;
  }

  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;
    var offset = renderBox.localToGlobal(Offset.zero);

    return OverlayEntry(
      builder: (context) => Positioned(
        width: size.width,
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0.0, size.height + 5.0),
          child: Material(
            elevation: 1.0,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12), // Rounded corners
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: widget.banks.map((Map<String, String> bank) {
                  return GestureDetector(
                    onTap: () {
                      widget.onBankSelected(bank['name']!);
                      _closeDropdown();
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 10.0),
                      child: Row(
                        children: [
                          const Icon(Icons.account_balance,
                              size: 12,
                              color: Color.fromARGB(255, 210, 210, 210)),
                          const SizedBox(width: 10),
                          Text(
                            bank['name']!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'BricolageGrotesque Light',
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
