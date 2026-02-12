import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class InvoiceHeader extends StatelessWidget {
  const InvoiceHeader({super.key, required this.onProfileTap});

  final VoidCallback onProfileTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Invoices',
          style: TextStyle(
            color: Color(0xFF111827),
            fontSize: 36 / 2,
            fontWeight: FontWeight.w700,
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: onProfileTap,
          child: Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              color: Color(0xFFE5EEFF),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.person_rounded,
              color: AppTheme.primaryBlue,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
