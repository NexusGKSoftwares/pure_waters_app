import 'package:flutter/material.dart';
// import 'usage_screen.dart';
import 'bill_payment_screen.dart'; // Import the BillPaymentScreen

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pure Waters Dashboard'),
        backgroundColor: Colors.blueAccent, // Updated to match branding
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to settings screen
            },
          ),
        ],
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
              const SizedBox(height: 20),
              _buildQuickActions(context), // Updated for responsive layout

              const SizedBox(height: 24),

              // Notifications Section
              const Text(
                'Notifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildNotificationsSection(),
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
        color: Colors.blueAccent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 30,
            child: Icon(Icons.person, color: Colors.blueAccent, size: 30),
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back, Gideon!',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Manage your water bills, monitor usage, and more.',
                  style: TextStyle(fontSize: 14, color: Colors.white70),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Quick Actions Grid Widget
  Widget _buildQuickActions(BuildContext context) {
    final quickActions = [
      {'icon': Icons.attach_money, 'label': 'Pay Bill'},
      {'icon': Icons.bar_chart, 'label': 'Usage'},
      {'icon': Icons.help, 'label': 'Help & Support'},
      {'icon': Icons.notifications, 'label': 'Alerts'},
    ];

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, // Adjust for responsiveness
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: quickActions.length,
      itemBuilder: (context, index) {
        final action = quickActions[index];
        return _buildQuickAction(context, action['icon'] as IconData, action['label'] as String);
      },
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
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              decoration: const BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                backgroundColor: Colors.blueAccent,
                radius: 40,
                child: Icon(icon, size: 30, color: Colors.white),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(label, style: const TextStyle(fontSize: 14)),
        ],
      ),
    );
  }

  // Notifications Section Widget
  Widget _buildNotificationsSection() {
    final notifications = [
      {
        'icon': Icons.notification_important,
        'title': 'Reminder: Your bill is due soon!',
        'subtitle': 'Pay your outstanding bill before 15th Dec.'
      },
      {
        'icon': Icons.warning,
        'title': 'Maintenance Scheduled',
        'subtitle': 'Water supply will be disrupted on 20th Dec from 8 AM to 4 PM.'
      },
    ];

    if (notifications.isEmpty) {
      return const Center(
        child: Text(
          'No notifications at the moment.',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
      );
    }

    return Column(
      children: notifications.map((notification) {
        return Card(
          elevation: 4,
          child: ListTile(
            leading: Icon(notification['icon'] as IconData, color: Colors.blue),
            title: Text(notification['title'] as String),
            subtitle: Text(notification['subtitle'] as String),
          ),
        );
      }).toList(),
    );
  }
}
