import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

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



// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  void _launchURL(String url) async {
    if (await canLaunchUrl(url as Uri)) {
      await launchUrl(url as Uri);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text('Contact Us'),
        backgroundColor: Colors.blueAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Get in Touch with Pure Waters',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Phone Contact
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.phone, color: Colors.blueAccent),
                title: const Text('Call Us'),
                subtitle: const Text('+254 700 123 456'),
                onTap: () {
                  _launchURL('tel:+254700123456');
                },
              ),
            ),
            const SizedBox(height: 8),
            // Email Contact
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.email, color: Colors.blueAccent),
                title: const Text('Email Us'),
                subtitle: const Text('support@purewaters.com'),
                onTap: () {
                  _launchURL('mailto:support@purewaters.com');
                },
              ),
            ),
            const SizedBox(height: 8),
            // Address Contact
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(Icons.location_on, color: Colors.blueAccent),
                title: const Text('Visit Us'),
                subtitle: const Text('456 Aqua Lane, Nairobi, Kenya'),
                onTap: () {
                  _launchURL(
                      'https://www.google.com/maps/search/?api=1&query=456+Aqua+Lane+Nairobi+Kenya');
                },
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Send Us a Message',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // Contact Form
            const ContactForm(),
          ],
        ),
      ),
    );
  }
}

class ContactForm extends StatefulWidget {
  const ContactForm({super.key});

  @override
  _ContactFormState createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Replace with Pure Waters backend submission logic
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Message Sent'),
          content: const Text(
              'Thank you for reaching out to Pure Waters. We will get back to you shortly.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _nameController.clear();
                _emailController.clear();
                _messageController.clear();
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name.';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email.';
              }
              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                return 'Please enter a valid email address.';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            maxLines: 4,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message.';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            ),
            child: const Text(
              'Submit',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}


class LiveChatScreen extends StatefulWidget {
  const LiveChatScreen({super.key});

  @override
  _LiveChatScreenState createState() => _LiveChatScreenState();
}

class _LiveChatScreenState extends State<LiveChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final List<Map<String, String>> _messages = []; // List to store messages

  void _sendMessage() {
    if (_messageController.text.isNotEmpty) {
      setState(() {
        _messages.add({'sender': 'You', 'message': _messageController.text});
      });
      _messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text('Live Chat'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          // Chat Messages List
          Expanded(
            child: _messages.isNotEmpty
                ? ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return Align(
                  alignment: message['sender'] == 'You'
                      ? Alignment.centerRight
                      : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 4, horizontal: 16),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: message['sender'] == 'You'
                          ? Colors.blueAccent
                          : Colors.grey[300],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      '${message['sender']}: ${message['message']}',
                      style: TextStyle(
                        color: message['sender'] == 'You'
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            )
                : const Center(
              child: Text(
                'No messages yet. Start the conversation!',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ),

          // Message Input Section
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                // Input Field
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: InputDecoration(
                      hintText: 'Type your message...',
                      hintStyle: const TextStyle(color: Colors.white70),
                      filled: true,
                      fillColor: Colors.grey[800],
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                  ),
                ),

                const SizedBox(width: 8),

                // Send Button
                GestureDetector(
                  onTap: _sendMessage,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: Colors.blueAccent,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
//
// import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _feedbackController = TextEditingController();
  double _rating = 0; // Holds the rating value

  void _submitFeedback() {
    if (_feedbackController.text.isNotEmpty && _rating > 0) {
      // You can replace this with a backend API call or Firebase integration
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Thank you for your feedback!'),
          backgroundColor: Colors.green,
        ),
      );
      _feedbackController.clear();
      setState(() {
        _rating = 0;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Please provide feedback and a rating!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        title: const Text('Feedback'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'We value your feedback!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),

            // Rating Section
            Row(
              children: [
                const Text(
                  'Rate Us: ',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                for (int i = 1; i <= 5; i++)
                  IconButton(
                    icon: Icon(
                      Icons.star,
                      color: i <= _rating ? Colors.yellow : Colors.grey[400],
                    ),
                    onPressed: () {
                      setState(() {
                        _rating = i.toDouble();
                      });
                    },
                  ),
              ],
            ),
            const SizedBox(height: 16),

            // Feedback Text Field
            TextField(
              controller: _feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your feedback here...',
                hintStyle: const TextStyle(color: Colors.white70),
                filled: true,
                fillColor: Colors.grey[800],
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 16),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: _submitFeedback,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.symmetric(
                      vertical: 12, horizontal: 24),
                ),
                child: const Text(
                  'Submit Feedback',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
