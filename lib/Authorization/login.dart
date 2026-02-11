import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.3),
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                margin: EdgeInsets.all(20),
                child: Text("Hello", style: TextStyle(fontSize: 20)),
              ),

              SizedBox(
                height: 300,
                child: LineChart(
                  LineChartData(
                    lineBarsData: [
                      LineChartBarData(
                        spots: [
                          FlSpot(0, 1),
                          FlSpot(1, 1.5),
                          FlSpot(2, 1.4),
                          FlSpot(3, 3.4),
                          FlSpot(4, 2),
                          FlSpot(5, 2.2),
                          FlSpot(6, 1.8),
                        ],
                        isCurved: true,
                        color: Colors.blue,
                        barWidth: 3,
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.withValues(alpha: 0.4),
                              Colors.blue.withValues(alpha: 0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
