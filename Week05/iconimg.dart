import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DemoPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Icons, Images, Charts')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Icon
            Icon(Icons.star, size: 40, color: Colors.orange),
 SizedBox(height: 10),
Image.asset('assets/flutter.png', height: 100),
 SizedBox(height: 20),
  SizedBox(
              height: 150,
              child: LineChart(
                LineChartData(
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(1, 3),
                        FlSpot(2, 2),
                        FlSpot(3, 4),
                      ],
                      isCurved: true,
                      barWidth: 3,
                      colors: [Colors.blue],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
