import 'package:flutter/material.dart';

class DashboardBar extends StatelessWidget {
  const DashboardBar({
    super.key,
    required this.height,
    required this.color,
    required this.count,
    required this.dateLabel,
    required this.showCount,
    this.onTap,
  });

  final double height;
  final Color color;
  final String count;
  final String dateLabel;
  final bool showCount;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        clipBehavior: Clip.none,
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: 42,
            height: height,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 180),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(12),
                boxShadow: showCount
                    ? const [
                        BoxShadow(
                          color: Color(0x2B1F5ADB),
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ]
                    : null,
              ),
            ),
          ),
          if (showCount)
            Positioned(
              bottom: height + 6,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF0F172A),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          count,
                          style: const TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          dateLabel,
                          style: const TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFCBD5E1),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    child: Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xFF0F172A),
                      size: 16,
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
