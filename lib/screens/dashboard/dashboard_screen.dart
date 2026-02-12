import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
import '../invoices/invoice_screen.dart';
import '../payments/payments_screen.dart';
import '../settings/settings_screen.dart';
import 'widgets/balance_card.dart';
import 'widgets/cash_flow_line_graph.dart';
import 'widgets/quick_action.dart';
import 'widgets/transaction_tile.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  static const List<double> _cashFlowValues = [84, 124, 178, 104, 148, 196, 94];
  static const List<String> _cashFlowRanges = [
    'Last 7 Days',
    'Last 30 Days',
    'Last 3 Month',
  ];

  String _selectedCashFlowRange = 'Last 7 Days';
  int _currentTabIndex = 0;

  List<CashFlowPoint> _buildCashFlowPoints() {
    final DateTime now = DateTime.now();
    final int stepDays = switch (_selectedCashFlowRange) {
      'Last 30 Days' => 5,
      'Last 3 Month' => 15,
      _ => 1,
    };

    return List.generate(_cashFlowValues.length, (index) {
      final date = now.subtract(
        Duration(days: stepDays * (_cashFlowValues.length - 1 - index)),
      );
      return CashFlowPoint(value: _cashFlowValues[index], date: date);
    });
  }

  @override
  Widget build(BuildContext context) {
    final cashFlowPoints = _buildCashFlowPoints();

    return Scaffold(
      backgroundColor: const Color(0xFFF9FAFC),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTabIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryBlue,
        unselectedItemColor: const Color(0xFF94A3B8),
        showUnselectedLabels: true,
        onTap: (index) {
          if (index == 3) {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            );
            return;
          }
          setState(() {
            _currentTabIndex = index;
          });
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
      body: _currentTabIndex == 1
          ? const InvoiceContent()
          : _currentTabIndex == 2
          ? const PaymentsContent()
          : _buildDashboardContent(cashFlowPoints),
    );
  }

  Widget _buildDashboardContent(List<CashFlowPoint> cashFlowPoints) {
    return SafeArea(
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
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const SettingsScreen()),
                    );
                  },
                  child: Container(
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
                ),
              ],
            ),
            const SizedBox(height: 20),
            const BalanceCard(),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                QuickAction(
                  icon: Icons.send_rounded,
                  iconColor: AppTheme.primaryBlue,
                  label: 'Send',
                ),
                QuickAction(
                  icon: Icons.request_page_rounded,
                  iconColor: Color(0xFF059669),
                  label: 'Request',
                ),
                QuickAction(
                  icon: Icons.history_rounded,
                  iconColor: Color(0xFFF59E0B),
                  label: 'History',
                ),
                QuickAction(
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
              ],
            ),
            const SizedBox(height: 14),
            Container(
              height: 240,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(12, 12, 12, 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF1F5F9),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: const Color(0xFFE2E8F0)),
              ),
              child: CashFlowLineGraph(points: cashFlowPoints),
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
            const TransactionTile(
              icon: Icons.work_outline_rounded,
              iconBg: Color(0xFFE2E8F0),
              title: 'Office Supplies',
              dateTime: 'Oct 24, 2023 • 2:30 PM',
              amount: '-\$340.50',
              amountColor: AppTheme.textDark,
            ),
            const SizedBox(height: 14),
            const TransactionTile(
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
    );
  }
}
