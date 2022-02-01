import 'package:flutter/material.dart';

class InternetConnectionFailed extends StatelessWidget {
  const InternetConnectionFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Text("You don't have an internet connection"),
            SizedBox(
              height: 10,
            ),
            Icon(
              Icons.error_outline,
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }
}
