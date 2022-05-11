import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Padding(padding: EdgeInsets.only(top: 80)),
            const Text('Bluetouch mouse'),
            const Padding(padding: EdgeInsets.only(bottom: 40)),
            SizedBox(
              width: 200,
              child: TextField(
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            const Padding(padding: EdgeInsets.only(bottom: 40)),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Check'),
            ),
          ],
        ),
      ),
    );
  }
}
