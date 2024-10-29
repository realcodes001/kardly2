import 'package:flutter/material.dart';

// Utility function to build method button widgets
Widget buildMethodButton(BuildContext context, String title, String description,
    {required Function onTap}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFAEAEAE), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              fontFamily: 'BricolageGrotesque Medium',
            ),
          ),
          const SizedBox(height: 3),
          Text(
            description,
            style: const TextStyle(
              fontSize: 12,
              fontFamily: 'BricolageGrotesque light',
              color: Color.fromARGB(255, 163, 163, 163),
              fontWeight: FontWeight.w300,
            ),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    ),
  );
}

// Another method button with a different layout
Widget buildMethodButton2(
    BuildContext context, String title, String description,
    {required Function onTap}) {
  return GestureDetector(
    onTap: () => onTap(),
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Color(0xFFAEAEAE), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: 'BricolageGrotesque Medium',
                ),
              ),
              const SizedBox(height: 3),
              Text(
                description,
                style: const TextStyle(
                  fontSize: 12,
                  fontFamily: 'BricolageGrotesque light',
                  color: Color.fromARGB(255, 163, 163, 163),
                  fontWeight: FontWeight.w300,
                ),
                textAlign: TextAlign.start,
              ),
            ],
          ),
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: const Color.fromARGB(255, 247, 247, 247),
                ),
                child: const Text(
                  'Currently unavailable',
                  style: TextStyle(
                    fontSize: 10,
                    fontFamily: 'BricolageGrotesque Light',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}
