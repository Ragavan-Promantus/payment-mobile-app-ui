import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../dashboard/dashboard_screen.dart';
import '../settings/settings_screen.dart';

class PaymentsScreen extends StatelessWidget {
  const PaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryBlue,
        unselectedItemColor: const Color(0xFF94A3B8),
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 0) {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (_) => const DashboardScreen()),
            );
          } else if (index == 3) {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const SettingsScreen()));
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long_rounded),
            label: 'Invoices',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet_rounded),
            label: 'Payments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Text(
                    'Transactions',
                    style: TextStyle(
                      color: Color(0xFF111827),
                      fontSize: 36 / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const Spacer(),
                  Container(
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
                ],
              ),
              const SizedBox(height: 14),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 44,
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE9EEF5),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.search_rounded,
                            color: Color(0xFF94A3B8),
                            size: 20,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Search transactions...',
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      color: const Color(0xFFE9EEF5),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.tune_rounded,
                      color: Color(0xFF64748B),
                      size: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: const Color(0xFFE7ECF4),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: const [
                    Expanded(
                      child: _SegmentItem(label: 'Incoming', isActive: true),
                    ),
                    Expanded(
                      child: _SegmentItem(label: 'Outgoing', isActive: false),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 18),
              Row(
                children: const [
                  Expanded(
                    child: _StatCard(
                      title: 'TOTAL VOLUME',
                      value: '\$52,140.00',
                      valueColor: Color(0xFF1F2937),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: _StatCard(
                      title: 'PROCESSING',
                      value: '\$3,840.12',
                      valueColor: AppTheme.primaryBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const _DateHeader('TODAY, OCT 24'),
              const SizedBox(height: 10),
              const _PaymentTile(
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
              const _PaymentTile(
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
              const _DateHeader('YESTERDAY, OCT 23'),
              const SizedBox(height: 10),
              const _PaymentTile(
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
              const _PaymentTile(
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
      ),
    );
  }
}

class _SegmentItem extends StatelessWidget {
  const _SegmentItem({required this.label, required this.isActive});

  final String label;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 34,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppTheme.primaryBlue : const Color(0xFF64748B),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class _StatCard extends StatelessWidget {
  const _StatCard({
    required this.title,
    required this.value,
    required this.valueColor,
  });

  final String title;
  final String value;
  final Color valueColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 12, 10),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F4F9),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFD7DFEC)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xFF8AA0BC),
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: TextStyle(
              color: valueColor,
              fontSize: 32 / 2,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }
}

class _DateHeader extends StatelessWidget {
  const _DateHeader(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Color(0xFF9CAEC5),
        fontSize: 12,
        fontWeight: FontWeight.w800,
        letterSpacing: 0.6,
      ),
    );
  }
}

class _PaymentTile extends StatelessWidget {
  const _PaymentTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.name,
    required this.detail,
    required this.amount,
    required this.amountColor,
    required this.status,
    required this.statusBg,
    required this.statusColor,
    this.amountStrikethrough = false,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String name;
  final String detail;
  final String amount;
  final Color amountColor;
  final String status;
  final Color statusBg;
  final Color statusColor;
  final bool amountStrikethrough;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FBFD),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFFD7DFEB)),
      ),
      child: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: iconBg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: iconColor, size: 20),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF1F2937),
                    fontSize: 29 / 2,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  detail,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                amount,
                style: TextStyle(
                  color: amountColor,
                  fontSize: 31 / 2,
                  fontWeight: FontWeight.w800,
                  decoration: amountStrikethrough
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              const SizedBox(height: 4),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: statusBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 9,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
