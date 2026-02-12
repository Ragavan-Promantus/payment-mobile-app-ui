import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.primaryBlue,
        child: const Icon(Icons.add, size: 30, color: Colors.white),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryBlue,
        unselectedItemColor: const Color(0xFF94A3B8),
        showUnselectedLabels: true,
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
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'WELCOME BACK,',
                          style: TextStyle(
                            color: Color(0xFF94A3B8),
                            fontWeight: FontWeight.w700,
                            fontSize: 32 / 2,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Business Dashboard',
                          style: TextStyle(
                            color: AppTheme.textDark,
                            fontSize: 48 / 2,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      color: Color(0xFFE7EFFC),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.person_rounded,
                      color: AppTheme.primaryBlue,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
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
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _QuickAction(
                    icon: Icons.send_rounded,
                    iconColor: AppTheme.primaryBlue,
                    label: 'Send',
                  ),
                  _QuickAction(
                    icon: Icons.request_page_rounded,
                    iconColor: Color(0xFF059669),
                    label: 'Request',
                  ),
                  _QuickAction(
                    icon: Icons.history_rounded,
                    iconColor: Color(0xFFF59E0B),
                    label: 'History',
                  ),
                  _QuickAction(
                    icon: Icons.more_horiz_rounded,
                    iconColor: Color(0xFF475569),
                    label: 'More',
                  ),
                ],
              ),
              const SizedBox(height: 34),
              Row(
                children: const [
                  Text(
                    'Cash Flow',
                    style: TextStyle(
                      color: AppTheme.textDark,
                      fontSize: 36 / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'Last 7 Days',
                    style: TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 16 / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(
                    Icons.keyboard_arrow_down_rounded,
                    color: Color(0xFF64748B),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              Container(
                height: 200,
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: const Color(0xFFE2E8F0)),
                ),
                child: const Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _Bar(height: 84, color: Color(0xFFB7C7E8)),
                    _Bar(height: 124, color: Color(0xFF90A9DB)),
                    _Bar(height: 178, color: Color(0xFF1F5ADB)),
                    _Bar(height: 104, color: Color(0xFFAABCE3)),
                    _Bar(height: 148, color: Color(0xFF7D9FDD)),
                    _Bar(height: 196, color: Color(0xFF1F5ADB)),
                    _Bar(height: 94, color: Color(0xFFC2D0EA)),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: const [
                  Text(
                    'Recent Transactions',
                    style: TextStyle(
                      color: AppTheme.textDark,
                      fontSize: 38 / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Spacer(),
                  Text(
                    'SEE ALL',
                    style: TextStyle(
                      color: AppTheme.primaryBlue,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 14),
              const _TransactionTile(
                icon: Icons.work_outline_rounded,
                iconBg: Color(0xFFE2E8F0),
                title: 'Office Supplies',
                dateTime: 'Oct 24, 2023 • 2:30 PM',
                amount: '-\$340.50',
                amountColor: AppTheme.textDark,
              ),
              const SizedBox(height: 14),
              const _TransactionTile(
                icon: Icons.call_made_rounded,
                iconBg: Color(0xFFDFF3EA),
                iconColor: Color(0xFF059669),
                title: 'Client Payment',
                dateTime: 'Oct 23, 2023 • 11:15 AM',
                amount: '+\$2,100.00',
                amountColor: Color(0xFF059669),
              ),
            ],
          ),
        ),
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

class _QuickAction extends StatelessWidget {
  const _QuickAction({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String label;

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
          child: Icon(icon, color: iconColor, size: 28),
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

class _Bar extends StatelessWidget {
  const _Bar({required this.height, required this.color});

  final double height;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}

class _TransactionTile extends StatelessWidget {
  const _TransactionTile({
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
