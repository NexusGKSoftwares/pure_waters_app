import 'package:flutter/material.dart';
import 'AlertsScreen.dart';
import 'HelpSupportScreen.dart';
import 'bill_payment_screen.dart';
import 'usage_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent, // Full-page blue background
      appBar: AppBar(
        title: const Text('Pure Waters Dashboard'),
        backgroundColor: Colors.blueAccent,
        elevation: 0, // Removes shadow for a seamless look
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
              _buildWelcomeBanner(),

              const SizedBox(height: 24),

              // Quick Actions
              const Text(
                'Quick Actions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 16),
              _buildQuickActions(context),

              const SizedBox(height: 24),

              // Notifications Section
              const Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 8),
              _buildNotificationCard(),
            ],
          ),
        ),
      ),
    );
  }

  // Welcome Banner Widget
  Widget _buildWelcomeBanner() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2), // Slight transparency for effect
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back!',
            style: TextStyle(
              fontSize: 22,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Manage your water bills, monitor usage, and more.',
            style: TextStyle(fontSize: 16, color: Colors.white70),
          ),
        ],
      ),
    );
  }

  // Quick Actions Section Widget
  Widget _buildQuickActions(BuildContext context) {
    final quickActions = [
      {'icon': Icons.attach_money, 'label': 'Pay Bill'},
      {'icon': Icons.bar_chart, 'label': 'Usage'},
      {'icon': Icons.help, 'label': 'Help & Support'},
      {'icon': Icons.notifications, 'label': 'Alerts'},
    ];

    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: quickActions.map((action) {
        return _buildQuickAction(
            context, action['icon'] as IconData, action['label'] as String);
      }).toList(),
    );
  }

  // Quick Action Button Widget
  Widget _buildQuickAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Pay Bill') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const BillPaymentScreen()),
          );
        } else if (label == 'Usage') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const UsageScreen()),
          );
        } else if (label == 'Help & Support') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HelpSupportScreen()),
          );
        } else if (label == 'Alerts') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AlertsScreen()),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Action for $label is not defined!')),
          );
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 35,
            child: Icon(icon, size: 30, color: Colors.blueAccent),
          ),
          const SizedBox(height: 8),
          Text(
            label,
            style: const TextStyle(fontSize: 14, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Notification Card Widget
  Widget _buildNotificationCard() {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.white.withOpacity(0.2), // Semi-transparent white background
      child: const ListTile(
        leading: Icon(Icons.notification_important, color: Colors.white),
        title: Text(
          'Reminder: Your bill is due soon!',
          style: TextStyle(color: Colors.white),
        ),
        subtitle: Text(
          'Pay your outstanding bill before 15th Dec.',
          style: TextStyle(color: Colors.white70),
        ),
        trailing: Icon(Icons.chevron_right, color: Colors.white),
      ),
    );
  }
}
