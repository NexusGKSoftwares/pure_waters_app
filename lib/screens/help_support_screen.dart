import 'package:flutter/material.dart';

class HelpSupportScreen extends StatelessWidget {
  const HelpSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help & Support'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blue[900], // Light background for better readability
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
// Enhanced Header Section
            Container(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blueAccent, Colors.indigo],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.help_outline, color: Colors.white, size: 30),
                      SizedBox(width: 8),
                      Text(
                        'We’re here to help!',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Choose an option below to get assistance or contact support.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),

            // Help & Support Options
            Expanded(
              child: ListView(
                children: [
                  _buildSupportCard(
                    context,
                    icon: Icons.question_answer,
                    title: 'FAQs',
                    description: 'Find answers to frequently asked questions.',
                    onTap: () {
                      // Navigate to FAQ page
                      _navigateTo(context, const FAQsScreen());
                    },
                  ),
                  _buildSupportCard(
                    context,
                    icon: Icons.phone,
                    title: 'Contact Us',
                    description: 'Reach out to our support team.',
                    onTap: () {
                      // Navigate to Contact Us page
                      _navigateTo(context, const ContactUsScreen());
                    },
                  ),
                  _buildSupportCard(
                    context,
                    icon: Icons.chat,
                    title: 'Live Chat',
                    description: 'Chat with our support agents in real time.',
                    onTap: () {
                      // Navigate to Live Chat page
                      _navigateTo(context, const LiveChatScreen());
                    },
                  ),
                  _buildSupportCard(
                    context,
                    icon: Icons.feedback,
                    title: 'Feedback',
                    description: 'Share your feedback or suggestions.',
                    onTap: () {
                      // Navigate to Feedback page
                      _navigateTo(context, const FeedbackScreen());
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportCard(BuildContext context,
      {required IconData icon,
        required String title,
        required String description,
        required VoidCallback onTap}) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blueAccent,
          child: Icon(icon, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward),
        onTap: onTap,
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }
}


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FAQs Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FAQsScreen(),
    );
  }
}

class FAQsScreen extends StatefulWidget {
  const FAQsScreen({super.key});

  @override
  _FAQsScreenState createState() => _FAQsScreenState();
}

class _FAQsScreenState extends State<FAQsScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  // Mock FAQ data
  final List<Map<String, String>> faqs = [
    {
      'question': 'How do I check my water usage?',
      'answer': 'You can check your water usage under the "Usage" section in the app.',
    },
    {
      'question': 'How do I report a fault?',
      'answer': 'Go to the "Fault Reporting" section and submit the details.',
    },
    {
      'question': 'How do I pay my water bill?',
      'answer':
      'You can pay your water bill through the "Payment" section using Mpesa, card, or bank transfer.',
    },
    {
      'question': 'How do I contact customer support?',
      'answer': 'You can contact support via the "Contact Us" section or call our hotline.',
    },
    {
      'question': 'What are the water usage alerts?',
      'answer': 'Alerts notify you when your water usage exceeds the set threshold.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered FAQs based on search query
    List<Map<String, String>> filteredFAQs = _searchQuery.isEmpty
        ? faqs
        : faqs
        .where((faq) => faq['question']!
        .toLowerCase()
        .contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text('FAQs'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search FAQs...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
              onChanged: (query) {
                setState(() {
                  _searchQuery = query;
                });
              },
            ),
            const SizedBox(height: 16),
            // FAQ List
            Expanded(
              child: filteredFAQs.isNotEmpty
                  ? ListView.builder(
                itemCount: filteredFAQs.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ExpansionTile(
                      title: Text(
                        filteredFAQs[index]['question']!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text(filteredFAQs[index]['answer']!),
                        ),
                      ],
                    ),
                  );
                },
              )
                  : const Center(
                child: Text('No FAQs found. Try a different search.'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Contact information and form will be displayed here.'),
      ),
    );
  }
}

class LiveChatScreen extends StatelessWidget {
  const LiveChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Chat'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Live chat interface will be displayed here.'),
      ),
    );
  }
}

class FeedbackScreen extends StatelessWidget {
  const FeedbackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Center(
        child: Text('Feedback form will be displayed here.'),
      ),
    );
  }
}
