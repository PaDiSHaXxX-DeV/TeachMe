import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teachme/blocs/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:teachme/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:teachme/data/models/study_model.dart';
import 'package:teachme/pages/auth/sign_in.dart';

void main() async {
  await _initHive();
  Hive.registerAdapter(StudyModelAdapter());
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => TabCubit()),
    BlocProvider(create: (context) => FavoriteBloc()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(32, 63, 129, 1.0),
        ),
      ),
      home: const Login(),
    );
  }
}

Future<void> _initHive() async {
  await Hive.initFlutter();
  await Hive.openBox("login");
  await Hive.openBox("accounts");
}
