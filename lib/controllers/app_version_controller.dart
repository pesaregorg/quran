import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppVersionController extends ChangeNotifier{

  AppVersionController(){
    _init();
  }



  String? _version;
  String? _buildNumber;

  String? get getVersion => _version;
  String? get getBuildNumber => _buildNumber;






  _init() async{
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    _version = packageInfo.version;
    _buildNumber = packageInfo.buildNumber;
    notifyListeners();

  }















}