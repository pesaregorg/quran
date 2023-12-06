import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class AppLayoutPage extends StatelessWidget {
  const AppLayoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
