import 'package:battery_plus/battery_plus.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class BatteryPage extends StatefulWidget {
  const BatteryPage({super.key});

  @override
  State<BatteryPage> createState() => _BatteryPageState();
}

class _BatteryPageState extends State<BatteryPage> {
  final Battery battery = Battery();
  int batteryLevel = 0;
  String batteryState = "";

  @override
  void initState() {
    super.initState();
    _updateBatteryLevel();
    battery.onBatteryStateChanged.listen((BatteryState state) {
      batteryState = state.toString();
    });
  }

  _updateBatteryLevel() async {
    final level = await battery.batteryLevel;
    setState(() {
      batteryLevel = level;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Battery Page'),
          backgroundColor: Colors.grey.shade800, // Neutro
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LinearPercentIndicator(
                width: MediaQuery.of(context).size.width - 50,
                animation: true,
                lineHeight: 20.0,
                animationDuration: 2000,
                percent: batteryLevel / 100.0,
                center: Text(
                  'Battery Level: $batteryLevel%',
                ),
                // ignore: deprecated_member_use
                linearStrokeCap: LinearStrokeCap.roundAll,
                progressColor: Colors.greenAccent,
              ),
              const Divider(
                height: 40.0,
                color: Colors.grey,
              ),
              Text(
                'Battery Status: $batteryState',
                style: const TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: _updateBatteryLevel,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade800, // Neutro
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24.0,
                    vertical: 12.0,
                  ),
                ),
                child: const Text('Refresh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
