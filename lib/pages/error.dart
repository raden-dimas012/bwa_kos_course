// @dart=2.9
import 'package:bwa_kos_course/pages/home.dart';
import 'package:bwa_kos_course/theme.dart';
import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/404.png',
                width: 300,
              ),
              SizedBox(
                height: 70,
              ),
              Text(
                'Where are you going?',
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              SizedBox(
                height: 14,
              ),
              Text(
                'Seems like the page that you were\nrequested is already gone',
                style: greyTextStyle.copyWith(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                width: 210,
                height: 50,
                child: ElevatedButton(
                  child: Text(
                    'Back to home',
                    style: whiteTextStyle.copyWith(
                      fontSize: 18,
                    ),
                    ),
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                      builder: (context) => Home(),
                    ), (route) => false);
                  },
                  style: ElevatedButton.styleFrom(
                      primary: purpleColor,
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(17))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
