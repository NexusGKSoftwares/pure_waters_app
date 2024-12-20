import 'package:flutter/material.dart';

class UsageScreen extends StatefulWidget {
  const UsageScreen({super.key});

  @override
  _UsageScreenState createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
  String selectedPeriod = 'Daily'; // Default tab

  // Mock data for usage (replace with real data later)
  final Map<String, List<double>> usageData = {
    'Daily': [10, 12, 8, 15, 18, 16, 14],
    'Weekly': [100, 120, 140, 110, 90, 80, 150],
    'Monthly': [450, 480, 500, 530, 550, 520, 540],
  };

  @override
  Widget build(BuildContext context) {
    List<double> currentData = usageData[selectedPeriod]!;
    double totalUsage = currentData.reduce((a, b) => a + b);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Water Usage Monitoring'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Period Selection Tabs
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: ['Daily', 'Weekly', 'Monthly'].map((period) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedPeriod = period;
                    });
                  },
                  child: Chip(
                    label: Text(period),
                    backgroundColor: selectedPeriod == period
                        ? Colors.blue
                        : Colors.grey[200],
                    labelStyle: TextStyle(
                      color: selectedPeriod == period
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Usage Table
            Expanded(
              child: ListView.builder(
                itemCount: currentData.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.blue,
                      child: Text((index + 1).toString(),
                          style: const TextStyle(color: Colors.white)),
                    ),
                    title: Text(
                      selectedPeriod == 'Daily'
                          ? 'Day ${index + 1}'
                          : selectedPeriod == 'Weekly'
                          ? 'Week ${index + 1}'
                          : 'Month ${index + 1}',
                    ),
                    trailing: Text(
                      '${currentData[index].toStringAsFixed(2)} liters',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),

            const SizedBox(height: 16),

            // Usage Summary
            const Text(
              'Usage Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'Total water usage for the selected period: ${totalUsage.toStringAsFixed(2)} liters.',
            ),

            const SizedBox(height: 8),

            // High Usage Alert
            if (totalUsage > 500)
              const Text(
                '⚠️ High usage detected. Consider reducing your water usage.',
                style: TextStyle(color: Colors.red),
              ),
          ],
        ),
      ),
    );
  }
}
