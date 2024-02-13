import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teachme/blocs/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:teachme/data/fake_data.dart';
import 'package:teachme/data/models/study_model.dart';
import 'package:teachme/pages/auth/sign_in.dart';
import 'package:teachme/pages/info_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Box _boxLogin = Hive.box("login");

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BlocProvider(
      create: (context) => TabCubit(),
      child: BlocBuilder<TabCubit, int>(
        builder: (context, currentIndex) {
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
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => InfoPage(date: data)));
                      //Info pagega otish
                    },
                    child: _studyItem(data: data, size: size));
              }),
            ),
          );
        },
      ),
    );
  }

  Widget _studyItem({required data, required Size size}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            height: size.height * 0.12,
            width: size.width * 0.19,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(1),
                child: Image.network(
                  data.image,
                  fit: BoxFit.cover,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.fullName,
                style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: size.width * 0.54,
                child: Text(
                  data.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
          InkWell(
            onTap: () {},
            child: const SizedBox(
              child: Icon(Icons.favorite_border_rounded),
            ),
          ),
        ],
      ),
    );
  }
}
