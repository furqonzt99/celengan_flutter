import 'package:celengan/model/celengan.dart';
import 'package:celengan/theme.dart';
import 'package:flutter/material.dart';

class CelenganList extends StatelessWidget {
  const CelenganList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      reverse: true,
      itemBuilder: (context, index) {
        final Celengan celengan = celenganList[index];
        return InkWell(
          onTap: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Ini ceritanya menu edit dan hapus index ${celengan.index}',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  );
                });
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 24.0,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 25.0,
                    child: Icon(
                      Icons.savings_rounded,
                      size: 30.0,
                    ),
                  ),
                  SizedBox(width: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Menabung Rp. ${celengan.money}',
                        style: mediumTextStyle,
                      ),
                      Text(celengan.date),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
      itemCount: celenganList.length,
    );
  }
}