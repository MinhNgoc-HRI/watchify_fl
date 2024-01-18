import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class OnbroadPages extends StatelessWidget {
  const OnbroadPages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('Button'),
          onPressed: () => FirebaseCrashlytics.instance.crash(),
        ),
      ),
    );
  }
}
