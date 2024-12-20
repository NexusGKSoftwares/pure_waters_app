import 'package:flutter/material.dart';
import 'payment_details_screen.dart';
class BillPaymentScreen extends StatelessWidget {
  const BillPaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bill Payment'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Outstanding Bill Section
            const Text(
              'Outstanding Bill',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Card(
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Amount Due:',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Ksh 500',
                      style: TextStyle(fontSize: 16, color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),

            // Payment Methods Section
            const Text(
              'Select Payment Method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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

  Widget _buildPaymentMethodTile(BuildContext context,
      {required IconData icon, required String title, required String description}) {
    return Card(
      elevation: 4,
      child: ListTile(
        leading: Icon(icon, size: 36, color: Colors.blue),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),
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
