import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class AutoSizeTextPage extends StatefulWidget {
  const AutoSizeTextPage({super.key});

  @override
  State<AutoSizeTextPage> createState() => _AutoSizeTextPageState();
}

class _AutoSizeTextPageState extends State<AutoSizeTextPage> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Auto Size Text Page'),
        backgroundColor: Colors.grey.shade800, // Neutro
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: const InputDecoration(
                labelText: 'Digite o texto',
              ),
              maxLines: 5,
              onChanged: (value) {
                setState(() {});
              },
            ),
            Card(
              elevation: 5,
              child: Container(
                padding: const EdgeInsets.all(10),
                child: AutoSizeText(
                  controller.text,
                  maxLines: 3,
                  minFontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
