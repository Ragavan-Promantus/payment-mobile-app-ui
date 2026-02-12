import 'package:flutter/material.dart';
import '../../../theme/app_theme.dart';

class TransactionTile extends StatelessWidget {
  const TransactionTile({
    super.key,
    required this.icon,
    required this.iconBg,
    required this.title,
    required this.dateTime,
    required this.amount,
    required this.amountColor,
    this.iconColor = const Color(0xFF475569),
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String dateTime;
  final String amount;
  final Color amountColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFFD7DEE8)),
      ),
      child: Row(
        children: [
          Container(
            width: 76,
            height: 76,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Icon(icon, color: iconColor, size: 34),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: AppTheme.textDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 40 / 2,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  dateTime,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 32 / 2,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Text(
            amount,
            style: TextStyle(
              color: amountColor,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
