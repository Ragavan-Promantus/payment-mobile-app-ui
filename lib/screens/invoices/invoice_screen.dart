import 'package:flutter/material.dart';

import '../settings/settings_screen.dart';
import 'widgets/invoice_filters.dart';
import 'widgets/invoice_header.dart';
import 'widgets/invoice_search_bar.dart';
import 'widgets/invoice_section_label.dart';
import 'widgets/invoice_summary_card.dart';
import 'widgets/invoice_tile.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF5F7FB),
      body: InvoiceContent(),
    );
  }
}

class InvoiceContent extends StatelessWidget {
  const InvoiceContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(16, 14, 16, 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InvoiceHeader(
              onProfileTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const SettingsScreen()),
                );
              },
            ),
            const SizedBox(height: 14),
            const InvoiceSearchBar(),
            const SizedBox(height: 14),
            const InvoiceFilters(),
            const SizedBox(height: 16),
            Row(
              children: const [
                Expanded(
                  child: InvoiceSummaryCard(
                    title: 'OUTSTANDING',
                    value: '\$18,420.00',
                    accent: Color(0xFFF59E0B),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: InvoiceSummaryCard(
                    title: 'PAID THIS MONTH',
                    value: '\$46,780.00',
                    accent: Color(0xFF059669),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            const InvoiceSectionLabel('DUE THIS WEEK'),
            const SizedBox(height: 10),
            const InvoiceTile(
              invoiceId: '#INV-2026-105',
              clientName: 'Northwind Ltd.',
              dueDate: 'Due in 2 days',
              amount: '\$5,240.00',
              status: 'PENDING',
              statusColor: Color(0xFFB45309),
              statusBg: Color(0xFFFCECC8),
            ),
            const SizedBox(height: 10),
            const InvoiceTile(
              invoiceId: '#INV-2026-102',
              clientName: 'Vertex Tech',
              dueDate: 'Due tomorrow',
              amount: '\$2,180.00',
              status: 'OVERDUE',
              statusColor: Color(0xFFDC2626),
              statusBg: Color(0xFFFCE1E5),
            ),
            const SizedBox(height: 18),
            const InvoiceSectionLabel('RECENTLY PAID'),
            const SizedBox(height: 10),
            const InvoiceTile(
              invoiceId: '#INV-2026-097',
              clientName: 'Crescent Labs',
              dueDate: 'Paid on Feb 10',
              amount: '\$9,400.00',
              status: 'PAID',
              statusColor: Color(0xFF059669),
              statusBg: Color(0xFFDDF5E8),
            ),
            const SizedBox(height: 10),
            const InvoiceTile(
              invoiceId: '#INV-2026-093',
              clientName: 'Bluepeak Retail',
              dueDate: 'Paid on Feb 08',
              amount: '\$3,760.00',
              status: 'PAID',
              statusColor: Color(0xFF059669),
              statusBg: Color(0xFFDDF5E8),
            ),
          ],
        ),
      ),
    );
  }
}
