import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SizedBox(
          height: 100,
            child: Text("Splash"),
        ),
      ),
    );
  }
}
