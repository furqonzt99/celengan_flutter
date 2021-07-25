import 'package:celengan/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class AddScreen extends StatefulWidget {
  @override
  _AddScreenState createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            Stack(
              children: [
                Lottie.asset('assets/lotties/24811-saving-money.json'),
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: bgPrimaryColor,
                  ),
                ),
              ],
            ),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Nabung berapa?',
                hintText: 'Masukkan nominal uang yang anda tabung',
              ),
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                // NOTE : Fungsi tambah data
                Navigator.pop(context);
              },
              child: Text('Tabung!'),
              style: ElevatedButton.styleFrom(
                primary: bgPrimaryColor,
                padding: EdgeInsets.all(16.0),
              ),
            ),
          ],
        ),
      )),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
