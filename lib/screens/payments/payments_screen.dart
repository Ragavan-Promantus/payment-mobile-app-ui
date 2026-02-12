import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../settings/settings_screen.dart';
import 'widgets/payments_date_header.dart';
import 'widgets/payments_header.dart';
import 'widgets/payments_search_bar.dart';
import 'widgets/payments_segment.dart';
import 'widgets/payments_stat_card.dart';
import 'widgets/payments_tile.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F7FB),
      body: PaymentsContent(),
    );
  }
}

class PaymentsContent extends StatelessWidget {
  const PaymentsContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PaymentsHeader(
              onProfileTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
            const SizedBox(height: 14),
            const PaymentsSearchBar(),
            const SizedBox(height: 14),
            const PaymentsSegment(),
            const SizedBox(height: 18),
            Row(
              children: const [
                Expanded(
                  child: PaymentsStatCard(
                    title: 'TOTAL VOLUME',
                    value: '\$52,140.00',
                    valueColor: Color(0xFF1F2937),
                  ),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: PaymentsStatCard(
                    title: 'PROCESSING',
                    value: '\$3,840.12',
                    valueColor: AppTheme.primaryBlue,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const PaymentsDateHeader('TODAY, OCT 24'),
            const SizedBox(height: 10),
            const PaymentsTile(
              icon: Icons.north_east_rounded,
              iconBg: Color(0xFFDCF2E7),
              iconColor: Color(0xFF059669),
              name: 'Acme Corp',
              detail: 'Bank Transfer • 2:45 PM',
              amount: '+\$2,450.00',
              amountColor: Color(0xFF059669),
              status: 'SUCCESS',
              statusBg: Color(0xFFDDF5E8),
              statusColor: Color(0xFF059669),
            ),
            const SizedBox(height: 10),
            const PaymentsTile(
              icon: Icons.access_time_rounded,
              iconBg: Color(0xFFF8F3DF),
              iconColor: Color(0xFFD97706),
              name: 'Skyline Media',
              detail: 'Card Payment • 11:20 AM',
              amount: '+\$890.00',
              amountColor: Color(0xFF1F2937),
              status: 'PENDING',
              statusBg: Color(0xFFFCECC8),
              statusColor: Color(0xFFB45309),
            ),
            const SizedBox(height: 18),
            const PaymentsDateHeader('YESTERDAY, OCT 23'),
            const SizedBox(height: 10),
            const PaymentsTile(
              icon: Icons.error_outline_rounded,
              iconBg: Color(0xFFFBEAEC),
              iconColor: Color(0xFFDC2626),
              name: 'Zenth Services',
              detail: 'Bank Transfer • 5:12 PM',
              amount: '-\$1,200.00',
              amountColor: Color(0xFF94A3B8),
              status: 'FAILED',
              statusBg: Color(0xFFFCE1E5),
              statusColor: Color(0xFFDC2626),
              amountStrikethrough: true,
            ),
            const SizedBox(height: 10),
            const PaymentsTile(
              icon: Icons.north_east_rounded,
              iconBg: Color(0xFFDCF2E7),
              iconColor: Color(0xFF059669),
              name: 'Global Logistics',
              detail: 'ACH Deposit • 9:05 AM',
              amount: '+\$12,000.00',
              amountColor: Color(0xFF059669),
              status: 'SUCCESS',
              statusBg: Color(0xFFDDF5E8),
              statusColor: Color(0xFF059669),
            ),
          ],
        ),
      ),
    );
  }
}
