import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:watchify/app/service/firebase_auth.dart';
import 'package:watchify/data/repository/auth_repository_iml.dart';
import 'package:watchify/domain/repository/auth_repository.dart';
import 'package:watchify/presentation/app.dart';

import 'firebase_options.dart';

void main() async {
  Get.lazyPut<AuthenticationRepository>(() => AuthenticationRepositoryIml());
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    initServices();
    runApp(const App());
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

Future<void> initServices() async {
  await Get.putAsync(() => FirebaseAuthService().init());
}
