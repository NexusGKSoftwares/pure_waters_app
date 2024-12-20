import 'package:flutter/material.dart';
import 'bill_payment_screen.dart'; // Import the BillPaymentScreen

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pure Waters Dashboard'),
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
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              _buildQuickActions(context), // Updated Quick Actions Section

              const SizedBox(height: 24),

              // Notifications Section
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Card(
                elevation: 4,
                child: ListTile(
                  leading: Icon(Icons.notification_important, color: Colors.blue),
                  title: Text('Reminder: Your bill is due soon!'),
                  subtitle: Text('Pay your outstanding bill before 15th Dec.'),
                ),
              ),
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
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Welcome Back!',
            style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Manage your water bills, monitor usage, and more.',
            style: TextStyle(fontSize: 14, color: Colors.white70),
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
      spacing: 16, // Horizontal spacing between buttons
      runSpacing: 16, // Vertical spacing between rows
      alignment: WrapAlignment.center, // Aligns all buttons to the center
      children: quickActions.map((action) {
        return _buildQuickAction(context, action['icon'] as IconData, action['label'] as String);
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
        }
        // Add more actions for other labels as needed
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircleAvatar(
            backgroundColor: Colors.blueAccent,
            radius: 30, // Adjusted size
            child: Icon(icon, size: 24, color: Colors.white), // Adjusted icon size
          ),
          const SizedBox(height: 6), // Adjusted spacing
          Text(
            label,
            style: const TextStyle(fontSize: 12), // Adjusted font size
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
