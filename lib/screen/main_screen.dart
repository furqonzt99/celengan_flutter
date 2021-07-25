import 'package:celengan/model/celengan.dart';
import 'package:celengan/screen/add_screen.dart';
import 'package:celengan/screen/cracked_screen.dart';
import 'package:celengan/theme.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  int isiCelengan =
      celenganList.map((celengan) => celengan.money).fold(0, (p, c) => p + c);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return AddScreen();
          }));
        },
        child: Icon(
          Icons.savings_rounded,
          size: 30.0,
        ),
        backgroundColor: bgPrimaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Image.asset(
                          'assets/images/profile.png',
                          width: 60,
                        ),
                      ),
                      SizedBox(width: 16),
                      Text(
                        'Hi Furqon!',
                        style: largeTextStyle,
                      ),
                    ],
                  ),
                  NotificationButton(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 36.0,
                  horizontal: 24.0,
                ),
                decoration: BoxDecoration(
                    color: bgPrimaryColor,
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Isi celenganmu',
                          style: mediumTextStyle.copyWith(
                            color: Colors.white60,
                          ),
                        ),
                        SizedBox(height: 8.0),
                        Text(
                          'Rp. ${isiCelengan.toString()}',
                          style: largeTextStyle.copyWith(
                            fontSize: 20,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.hardware_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                      tooltip: 'Pecahkan celengan!',
                      onPressed: () {
                        // TODO : Fungsi kosongkan data
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CrackedScreen();
                        }));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.0),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
              ),
              child: Text(
                'Riwayat celenganmu',
                style: mediumTextStyle.copyWith(
                  fontSize: 18.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Container(
                height: MediaQuery.of(context).size.height - 410,
                child: CelenganList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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

class NotificationButton extends StatefulWidget {
  @override
  _NotificationButtonState createState() => _NotificationButtonState();
}

class _NotificationButtonState extends State<NotificationButton> {
  bool isNotification = true;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: isNotification
          ? Icon(Icons.notifications_active)
          : Icon(Icons.notifications_off),
      iconSize: 24,
      onPressed: () {
        setState(() {
          isNotification = !isNotification;
        });
      },
    );
  }
}
