import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class InvoiceFilters extends StatelessWidget {
  const InvoiceFilters({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFE7ECF4),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          Expanded(child: _FilterChip(label: 'All', active: true)),
          Expanded(child: _FilterChip(label: 'Pending')),
          Expanded(child: _FilterChip(label: 'Paid')),
          Expanded(child: _FilterChip(label: 'Overdue')),
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({required this.label, this.active = false});

  final String label;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: active ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(9),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: active ? AppTheme.primaryBlue : const Color(0xFF64748B),
          fontSize: 12,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
