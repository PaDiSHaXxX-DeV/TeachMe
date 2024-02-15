
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachme/data/models/study_model.dart';

import '../blocs/favorite_bloc/favorite_bloc.dart';
import '../data/models/form_status.dart';

class StudyItem extends StatelessWidget {
  final StudyModel data;
  final Size size;
  const StudyItem({super.key, required this.data, required this.size});

  @override
  Widget build(BuildContext context) {
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
                    context.read<FavoriteBloc>().add(GetAllFavoritesEvent());

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
                          ? Icons.favorite
                          : Icons.favorite_border_rounded,
                      color:
                      state.studys.contains(data) ? Colors.red : Colors.white,
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
}