import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teachme/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:teachme/data/fake_data.dart';
import 'package:teachme/data/models/form_status.dart';
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
              child: _studyItem(data: data, size: size));
        }),
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
          BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state.status == FormStatus.success) {
                return InkWell(
                  onTap: () {

                    if (state.studys.contains(data)) {
                      context
                          .read<FavoriteBloc>()
                          .add(DeleteFavoriteEvent(favoriteModel: data));
                    } else {
                      context
                          .read<FavoriteBloc>()
                          .add(AddFavoriteEvent(study: data));
                    }
                  },
                  child: SizedBox(
                    child: Icon(
                      state.studys.contains(data)
                          ? Icons.favorite_border_rounded
                          : Icons.favorite,
                      color:
                          state.studys.contains(data) ? Colors.white : Colors.red,
                    ),
                  ),
                );
              } else {
                return InkWell(
                  onTap: () {},
                  child: const SizedBox(
                    child: Icon(Icons.favorite_border_rounded,
                        color: Colors.black),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }

  @override
  void initState() {
    context.read<FavoriteBloc>().add(GetAllFavoritesEvent());

    super.initState();
  }
}
