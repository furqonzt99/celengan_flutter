import 'package:celengan/theme.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class CrackedScreen extends StatelessWidget {
  const CrackedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset('assets/lotties/53082-saving-money.json'),
          SizedBox(height: 30.0),
          Text(
            'Celenganmu Sudah Pecah',
            style: largeTextStyle.copyWith(
              color: bgPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text('Yuk, kumpulin uang dan nabung lagi!',
              style: mediumTextStyle.copyWith(
                fontWeight: FontWeight.w300,
              )),
          SizedBox(height: 24.0),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Kembali'),
            style: ElevatedButton.styleFrom(
              primary: bgPrimaryColor,
              padding: EdgeInsets.all(16.0),
            ),
          )
        ],
      )),
    );
  }
}
