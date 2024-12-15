import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class UsageScreen extends StatefulWidget {
  @override
  _UsageScreenState createState() => _UsageScreenState();
}

class _UsageScreenState extends State<UsageScreen> {
  String selectedPeriod = 'Daily'; // Default tab

  // Mock data for graph (You can replace this with real data later)
  final Map<String, List<double>> usageData = {
    'Daily': [10, 12, 8, 15, 18, 16, 14],
    'Weekly': [100, 120, 140, 110, 90, 80, 150],
    'Monthly': [450, 480, 500, 530, 550, 520, 540],
  };

  @override
  Widget build(BuildContext context) {
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
                    backgroundColor:
                    selectedPeriod == period ? Colors.blue : Colors.grey[200],
                    labelStyle: TextStyle(
                      color: selectedPeriod == period ? Colors.white : Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),

            const SizedBox(height: 16),

            // Chart Section
            Expanded(
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: true),
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: true),
                    ),
                  ),
                  borderData: FlBorderData(show: true),
                  lineBarsData: [
                    LineChartBarData(
                      spots: usageData[selectedPeriod]!
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value))
                          .toList(),
                      isCurved: true,
                      color: Colors.blue[100],
                      barWidth: 4,
                      // belowBarData: BarAreaData(show: true, color: [
                      //   Colors.blue.withOpacity(0.3),
                      // ]),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Usage Summary
            Text(
              'Usage Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'You have consumed ${usageData[selectedPeriod]!.reduce((a, b) => a + b).toStringAsFixed(2)} liters of water during the selected period.',
            ),

            SizedBox(height: 8),

            // High Usage Alert
            if (usageData[selectedPeriod]!.reduce((a, b) => a + b) > 500) ...[
              Text(
                '⚠️ High usage detected. Consider reducing your water usage.',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
