import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachme/blocs/favorite_bloc/favorite_bloc.dart';
import 'package:teachme/data/models/form_status.dart';
import 'package:teachme/pages/info_page.dart';

import '../data/models/study_model.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A434E),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {},
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text(
          "Favorite Page",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF1A434E),
      body: BlocBuilder<FavoriteBloc, FavoriteState>(
        builder: (context, state) {
          if (state.status == FormStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state.status == FormStatus.success) {
            return ListView(
              children: List.generate(state.studys.length, (index) {
                StudyModel data = state.studys[index];
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => InfoPage(date: data)));
                      //Info pagega otish
                    },
                    child: _studyItem(
                        data: data,
                        size: size,
                        context: context,
                        index: index));
              }),
            );
          } else if (state.status == FormStatus.error) {
            return Center(
              child: Text(state.statusText),
            );
          }else{
            return Center(
              child: Text("state.statusText"),
            );
          }
        },
      ),
    );
  }

  Widget _studyItem(
      {required index,
      required BuildContext context,
      required data,
      required Size size}) {
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
            onTap: () {
              context
                  .read<FavoriteBloc>()
                  .add(DeleteFavoriteEvent(favoriteModel: data));
            },
            child: const SizedBox(
              child: Icon(
                Icons.delete,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
