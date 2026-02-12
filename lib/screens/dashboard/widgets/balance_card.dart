import 'package:flutter/material.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF1D5FEA), Color(0xFF2F67DD)],
        ),
        borderRadius: BorderRadius.circular(34),
        boxShadow: const [
          BoxShadow(
            color: Color(0x331A56DB),
            blurRadius: 24,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Total Balance',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            '\$124,580.00',
            style: TextStyle(
              color: Colors.white,
              fontSize: 52 / 2,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 28),
          const Text(
            'INCOME THIS MONTH',
            style: TextStyle(
              color: Color(0xFFE5EEFF),
              fontWeight: FontWeight.w700,
              fontSize: 16 / 2,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Text(
                '+\$12,840.00',
                style: TextStyle(
                  color: Color.fromARGB(255, 113, 235, 14),
                  fontSize: 42 / 2,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
              _cardDot(opacity: 0.26),
              const SizedBox(width: 5),
              _cardDot(opacity: 0.38),
            ],
          ),
        ],
      ),
    );
  }

  static Widget _cardDot({required double opacity}) {
    return Container(
      width: 46,
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}
