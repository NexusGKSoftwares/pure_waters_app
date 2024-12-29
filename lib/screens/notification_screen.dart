import 'package:flutter/material.dart';

class NotificationsScreen extends StatelessWidget {
     NotificationsScreen({super.key});
  final List<String> notifications = [
    'Your water bill for October is due on 5th.',
    'Scheduled maintenance on 2nd November from 10 PM to 2 AM.',
    'Your complaint about water leakage has been resolved.',
    'New water conservation tips have been added to the app!',
    'Reminder: Update your profile information for better service.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Colors.redAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  notifications[index],
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
