import 'package:flutter/material.dart';

class NetworkDropdown extends StatefulWidget {
  final Function(String) onSelected; // Callback for when a network is selected
  const NetworkDropdown({Key? key, required this.onSelected}) : super(key: key);

  @override
  _NetworkDropdownState createState() => _NetworkDropdownState();
}

class _NetworkDropdownState extends State<NetworkDropdown> {
  OverlayEntry? _overlayEntry;
  final LayerLink _layerLink = LayerLink();
  String selectedNetwork = 'ERC-20'; // Default network selection

  // Function to show the dropdown
  void _showDropdown() {
    _overlayEntry = _createOverlayEntry();
    Overlay.of(context)?.insert(_overlayEntry!);
  }

  // Function to create the overlay entry for the dropdown
  OverlayEntry _createOverlayEntry() {
    RenderBox renderBox = context.findRenderObject() as RenderBox;
    var size = renderBox.size;

    return OverlayEntry(
      builder: (context) => Positioned(
        width: 130, // Custom width for the dropdown
        child: CompositedTransformFollower(
          link: _layerLink,
          showWhenUnlinked: false,
          offset: Offset(0, size.height), // Position it just below the text
          child: Material(
            elevation: 1.0,
            borderRadius: BorderRadius.circular(10),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: <Widget>[
                ListTile(
                  title: const Text(
                    'ERC-20',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'BricolageGrotesque Regular',
                    ),
                  ),
                  onTap: () {
                    _onNetworkSelected('ERC-20');
                  },
                ),
                ListTile(
                  title: const Text(
                    'BEP-20',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'BricolageGrotesque Regular',
                    ),
                  ),
                  onTap: () {
                    _onNetworkSelected('BEP-20');
                  },
                ),
                ListTile(
                  title: const Text(
                    'TRC-20',
                    style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'BricolageGrotesque Regular',
                    ),
                  ),
                  onTap: () {
                    _onNetworkSelected('TRC-20');
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to handle network selection
  void _onNetworkSelected(String network) {
    setState(() {
      selectedNetwork = network; // Update the selected network in state
    });
    widget.onSelected(network); // Call the callback with the selected network
    _removeDropdown(); // Close the dropdown
  }

  // Function to remove the dropdown
  void _removeDropdown() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return CompositedTransformTarget(
      link: _layerLink,
      child: GestureDetector(
        onTap: () {
          if (_overlayEntry == null) {
            _showDropdown(); // Show the dropdown when tapped
          } else {
            _removeDropdown(); // Remove dropdown if already showing
          }
        },
        child: Row(
          children: [
            Text(
              'Network: $selectedNetwork', // Display the selected network
              style: const TextStyle(
                fontSize: 12,
                fontFamily: 'BricolageGrotesque Regular',
                color: Colors.black,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
