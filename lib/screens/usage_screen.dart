import 'package:flutter/material.dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({super.key});

  @override
  _UsageScreenState createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
  String selectedUnit = 'Unit 1'; // Default rental unit

  // Mock data for meter readings (replace with real data from a backend)
  final Map<String, List<Map<String, dynamic>>> unitData = {
    'Unit 1': [
      {'date': '2024-12-01', 'reading': 500.0},
      {'date': '2024-12-08', 'reading': 550.0},
      {'date': '2024-12-15', 'reading': 580.0},
      {'date': '2024-12-21', 'reading': 620.0},
    ],
    'Unit 2': [
      {'date': '2024-12-01', 'reading': 400.0},
      {'date': '2024-12-08', 'reading': 450.0},
      {'date': '2024-12-15', 'reading': 490.0},
      {'date': '2024-12-21', 'reading': 530.0},
    ],
    'Unit 3': [
      {'date': '2024-12-01', 'reading': 700.0},
      {'date': '2024-12-08', 'reading': 750.0},
      {'date': '2024-12-15', 'reading': 790.0},
      {'date': '2024-12-21', 'reading': 850.0},
    ],
  };

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> currentData = unitData[selectedUnit]!;

    // Calculate total usage for the selected unit
    double totalUsage = 0;
    for (int i = 1; i < currentData.length; i++) {
      totalUsage += currentData[i]['reading'] - currentData[i - 1]['reading'];
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Rental Water Usage'),
        backgroundColor: Colors.blueAccent,
      ),
      backgroundColor: Colors.blue[900],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Rental Unit Selector
            DropdownButton<String>(
              value: selectedUnit,
              dropdownColor: Colors.blue[800],
              items: unitData.keys.map((unit) {
                return DropdownMenuItem<String>(
                  value: unit,
                  child: Text(
                    unit,
                    style: const TextStyle(color: Colors.white),
                  ),
                );
              }).toList(),
              onChanged: (newValue) {
                setState(() {
                  selectedUnit = newValue!;
                });
              },
              style: const TextStyle(color: Colors.white),
            ),

            const SizedBox(height: 16),

            // Meter Readings Table
            const Text(
              'Meter Readings',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: ListView.builder(
                itemCount: currentData.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.blueAccent,
                        child: Text(
                          (index + 1).toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(
                        'Date: ${currentData[index]['date']}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      trailing: Text(
                        '${currentData[index]['reading'].toStringAsFixed(2)} liters',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Usage Summary
            const Text(
              'Usage Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Total water usage for ${selectedUnit}: ${totalUsage.toStringAsFixed(2)} liters.',
              style: const TextStyle(color: Colors.white70),
            ),

            const SizedBox(height: 8),

            // High Usage Alert
            if (totalUsage > 500)
              const Text(
                '⚠️ High usage detected for this rental unit. Consider monitoring usage.',
                style: TextStyle(color: Colors.redAccent),
              ),
          ],
        ),
      ),
    );
  }
}
