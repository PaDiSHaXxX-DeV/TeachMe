import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:teachme/blocs/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:teachme/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:teachme/data/models/study_model.dart';
import 'package:teachme/pages/auth/sign_in.dart';

void main() async {
  await _initHive();
  PermissionStatus status = await Permission.camera.request();
  if (status.isGranted) {
    print(' // Storage permission is granted');
  } else {
    print(' // Storage permission is denied');
  }
  if (status.isGranted) {
    print(' // Camera permission is granted');
  } else {
    print('// Camera permission is denied');
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.transparent,
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  Hive.registerAdapter(StudyModelAdapter());
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => TabCubit()),
    BlocProvider(create: (context) => FavoriteBloc()),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primaryColor: Colors.black,
          fontFamily: 'Roboto',
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shadowColor: Colors.grey,
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0))))),
          inputDecorationTheme: InputDecorationTheme(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(0.0))),
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
              foregroundColor: Colors.black,
              alignment: Alignment.centerLeft,
            ),
          )),
      home: const Login(),
    );
  }
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}
