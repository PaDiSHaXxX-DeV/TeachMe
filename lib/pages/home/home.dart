import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teachme/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:teachme/data/fake_data.dart';
import 'package:teachme/data/models/study_model.dart';
import 'package:teachme/pages/auth/sign_in.dart';
import 'package:teachme/pages/info/info_page.dart';
import 'package:teachme/widgets/study_item.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A434E),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            _boxLogin.clear();
            _boxLogin.put("loginStatus", false);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const Login();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text(
          "Home Page",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF1A434E),
      body: ListView(
        children: List.generate(FakeDate.data.length, (index) {
          StudyModel data = FakeDate.data[index];
          return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => InfoPage(date: data)));
                //Info pagega otish
              },
              child: StudyItem(data: data, size: size));
        }),
      ),
    );
  }



  @override
  void initState() {
    context.read<FavoriteBloc>().add(GetAllFavoritesEvent());

    super.initState();
  }
}


