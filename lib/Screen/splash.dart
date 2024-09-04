import 'package:flutter/material.dart';
import 'package:flutter_json_task/Custom%20Widget/custom_text.dart';
import 'package:flutter_json_task/Screen/homepage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Homepage(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              text: 'Json',
              color: Colors.black,
              size: 22,
              fontWeight: FontWeight.w600,
            ),
            CustomText(
              text: 'Task',
              color: Colors.blue,
              size: 18,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
      ),
    );
  }
}
