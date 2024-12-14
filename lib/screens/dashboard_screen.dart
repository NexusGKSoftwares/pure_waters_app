import 'package:flutter/material.dart';
import 'bill_payment_screen.dart'; // Import the BillPaymentScreen

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Welcome Banner
              _buildWelcomeBanner(),

              SizedBox(height: 24),

              // Quick Actions
              Text(
                'Quick Actions',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildQuickAction(context, Icons.attach_money, 'Pay Bill'),
                  _buildQuickAction(context, Icons.bar_chart, 'Usage'),
                  _buildQuickAction(context, Icons.help, 'Support'),
                ],
              ),

              SizedBox(height: 24),

              // Notifications Section
              Text(
                'Notifications',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Card(
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
      child: Column(
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

  // Quick Action Button Widget
  Widget _buildQuickAction(BuildContext context, IconData icon, String label) {
    return GestureDetector(
      onTap: () {
        if (label == 'Pay Bill') {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BillPaymentScreen()),
          );
        }
        // Add more actions for other labels as needed
      },
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 30,
            child: Icon(icon, size: 30, color: Colors.white),
          ),
          SizedBox(height: 8),
          Text(label, style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}
