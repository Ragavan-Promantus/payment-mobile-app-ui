import 'package:flutter/material.dart';

import '../login/login_screen.dart';
import '../../theme/app_theme.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 14, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  _RoundIconButton(
                    icon: Icons.chevron_left_rounded,
                    onTap: () => Navigator.of(context).maybePop(),
                  ),
                  const Expanded(
                    child: Center(
                      child: Text(
                        'Settings',
                        style: TextStyle(
                          color: Color(0xFF1F2937),
                          fontSize: 28 / 2,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 40),
                ],
              ),
              const SizedBox(height: 24),
              Center(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          width: 122,
                          height: 122,
                          decoration: const BoxDecoration(
                            color: Color(0xFFF4CBB8),
                            shape: BoxShape.circle,
                          ),
                          child: Center(
                            child: Container(
                              width: 72,
                              height: 88,
                              decoration: BoxDecoration(
                                color: const Color(0xFFF7E5DA),
                                borderRadius: BorderRadius.circular(8),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color(0x2E000000),
                                    blurRadius: 10,
                                    offset: Offset(0, 5),
                                  ),
                                ],
                              ),
                              child: const Center(
                                child: Text(
                                  'JUNE\nPROFILE',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xFF9CA3AF),
                                    fontSize: 8,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 0.4,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 4,
                          bottom: 4,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: AppTheme.primaryBlue,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.white, width: 2),
                            ),
                            child: const Icon(
                              Icons.edit,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    const Text(
                      'Alex Sterling',
                      style: TextStyle(
                        color: Color(0xFF1F2937),
                        fontSize: 34 / 2,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 3),
                    const Text(
                      'Chief Financial Officer (CFO)',
                      style: TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    const Text(
                      'Sterling Industries Ltd.',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 26),
              const _SectionTitle('ACCOUNT MANAGEMENT'),
              const SizedBox(height: 10),
              const _SettingsGroup(
                children: [
                  _SettingsTile(
                    icon: Icons.business_outlined,
                    label: 'Business Details',
                  ),
                  _SettingsTile(
                    icon: Icons.credit_card_rounded,
                    label: 'Payment Methods',
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const _SectionTitle('SECURITY & PRIVACY'),
              const SizedBox(height: 10),
              const _SettingsGroup(
                children: [
                  _SettingsTile(
                    icon: Icons.fingerprint_rounded,
                    label: 'Security & Biometrics',
                  ),
                  _SettingsTile(
                    icon: Icons.notifications_none_rounded,
                    label: 'Notification Preferences',
                  ),
                ],
              ),
              const SizedBox(height: 18),
              const _SectionTitle('GENERAL'),
              const SizedBox(height: 10),
              const _SettingsGroup(
                children: [
                  _SettingsTile(
                    icon: Icons.help_outline_rounded,
                    label: 'Help & Support',
                  ),
                  _SettingsTile(
                    icon: Icons.info_outline_rounded,
                    label: 'Terms of Service',
                  ),
                ],
              ),
              const SizedBox(height: 22),
              Container(
                width: double.infinity,
                height: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFFCE8E8),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextButton.icon(
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: const Color(0xFFEF4444),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  icon: const Icon(Icons.logout_rounded, size: 18),
                  label: const Text(
                    'Log Out',
                    style: TextStyle(
                      fontSize: 20 / 2,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Center(
                child: Text(
                  'VERSION 2.4.0 (BUILD 841)',
                  style: TextStyle(
                    color: Color(0xFFB2BCCB),
                    fontSize: 9,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RoundIconButton extends StatelessWidget {
  const _RoundIconButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        width: 40,
        height: 40,
        decoration: const BoxDecoration(
          color: Color(0xFFE9EEF6),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: const Color(0xFF64748B), size: 24),
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: const TextStyle(
          color: Color(0xFF9AAAC1),
          fontSize: 12,
          fontWeight: FontWeight.w800,
          letterSpacing: 1.1,
        ),
      ),
    );
  }
}

class _SettingsGroup extends StatelessWidget {
  const _SettingsGroup({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2F7),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: children,
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      borderRadius: BorderRadius.circular(14),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
        child: Row(
          children: [
            Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: const Color(0xFFD9E2F5),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: AppTheme.primaryBlue, size: 22),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: Color(0xFF475569),
                  fontSize: 28 / 2,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const Icon(
              Icons.chevron_right_rounded,
              color: Color(0xFF94A3B8),
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
