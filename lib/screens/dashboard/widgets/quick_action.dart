import 'package:flutter/material.dart';

class QuickAction extends StatelessWidget {
  const QuickAction({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.label,
    this.iconSize = 28,
  });

  final IconData icon;
  final Color iconColor;
  final String label;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 234, 245, 255),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(icon, color: iconColor, size: iconSize),
        ),
        const SizedBox(height: 10),
        Text(
          label,
          style: const TextStyle(
            color: Color(0xFF64748B),
            fontWeight: FontWeight.w600,
            fontSize: 32 / 2,
          ),
        ),
      ],
    );
  }
}
