import 'package:flutter/material.dart';
import 'payment_details_screen.dart';

class BillPaymentScreen extends StatelessWidget {
  const BillPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Payment'),
        backgroundColor: Colors.blueAccent, // AppBar matches the theme
      ),
      backgroundColor: Colors.blue[900], // Deep blue background
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Outstanding Bill Section
            const Text(
              'Outstanding Bill',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount Due:',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Ksh 500',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.redAccent,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Payment Methods Section
            const Text(
              'Select Payment Method',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView(
                children: [
                  _buildPaymentMethodTile(
                    context,
                    icon: Icons.mobile_friendly,
                    title: 'M-Pesa',
                    description: 'Pay using M-Pesa mobile money.',
                  ),
                  _buildPaymentMethodTile(
                    context,
                    icon: Icons.credit_card,
                    title: 'Credit/Debit Card',
                    description: 'Pay using your card.',
                  ),
                  _buildPaymentMethodTile(
                    context,
                    icon: Icons.account_balance,
                    title: 'Bank Transfer',
                    description: 'Pay directly via bank transfer.',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentMethodTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String description,
      }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue.withOpacity(0.2),
          child: Icon(icon, size: 28, color: Colors.blue),
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        subtitle: Text(
          description,
          style: const TextStyle(fontSize: 14),
        ),
        trailing: const Icon(Icons.arrow_forward, color: Colors.blue),
        onTap: () {
          // Navigate to specific payment flow (e.g., M-Pesa)
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PaymentDetailsScreen(paymentMethod: title),
            ),
          );
        },
      ),
    );
  }
}
