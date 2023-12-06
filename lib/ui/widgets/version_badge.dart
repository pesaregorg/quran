import 'package:flutter/material.dart';
import 'package:quran/controllers/app_version_controller.dart';
import 'package:quran/utilities/helpers.dart';
import 'package:provider/provider.dart';

class VersionBadge extends StatelessWidget {
  const VersionBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<AppVersionController>(
      builder: (context, appVersionController, child) {
        return Container(
          margin: const EdgeInsets.only(top: 10.0),
          padding: const EdgeInsets.symmetric(
            horizontal: 8.0,
            vertical: 2.0,
          ),
          decoration: BoxDecoration(
            color: Helpers.isDarkMode(context) ? Colors.grey.shade900 : Colors.grey.shade100,
            borderRadius: const BorderRadius.all(Radius.circular(5.0))
          ),
          child: Text( "نسخه ${appVersionController.getVersion ?? ''}",
            style: const TextStyle(
            fontSize: 12
          ),),
        );
      }
    );
  }
}
