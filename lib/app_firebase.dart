import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nlw6_payflow_flutter/app_widget.dart';
import 'package:nlw6_payflow_flutter/modules/login/login_page.dart';
import 'package:nlw6_payflow_flutter/shared/themes/app_colors.dart';

class AppFirebase extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _AppFirebaseState createState() => _AppFirebaseState();
}

class _AppFirebaseState extends State<AppFirebase> {

  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pay Flow',
      theme: ThemeData(
        primaryColor: AppColors.primary
      ),
      home: FutureBuilder(
        // Initialize FlutterFire:
        future: _initialization,
        builder: (context, snapshot) {
          
          if (snapshot.hasError) {
            return Material(
              child: Center(
                child: Text(
                  "Não foi possível inicializar o Firebase",
                  textDirection: TextDirection.ltr,
                ),
              ),
            );
          }

          if (snapshot.connectionState == ConnectionState.done) {
            return AppWidget();
          }

          return Material(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
    );
  }
}