import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nlw6_payflow_flutter/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {

  UserModel? _user;

  UserModel get user => _user!;

  void setUser(BuildContext context, UserModel? user) {
    
    if(user != null) {
      _user = user;
      saveUser(user);
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }
  
  Future<void> saveUser(UserModel user) async {
    final instance = await SharedPreferences.getInstance();

    instance.setString("user", user.toJson());
    return;
  }

  Future<void> currentUser(BuildContext context) async {
    final instance = await SharedPreferences.getInstance();
    await Future.delayed(Duration(seconds: 1));
    final user = instance.getString("user");
    setUser(context, user == null ? null : UserModel.fromJson(user));
    return;
  }
}