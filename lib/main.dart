import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Input App'),
        ),
        body: const ShowInput(),
      ),
    );
  }
}

class ShowInput extends StatefulWidget {
  const ShowInput({super.key});

  @override
  State<ShowInput> createState() => _ShowInputState();
}

class _ShowInputState extends State<ShowInput> {
  final TextEditingController _inputTextController = TextEditingController();
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _inputTextController,
              decoration: const InputDecoration(
                hintText: 'Enter your text',
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _displayText = _inputTextController.text;
                });
              },
              child: const Text('Display Text'),
            ),
            const SizedBox(height: 20),
            Text(
              _displayText,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _inputTextController.dispose();
    super.dispose();
  }
}
