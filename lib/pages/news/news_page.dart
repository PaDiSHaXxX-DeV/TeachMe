import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachme/blocs/news_bloc/news_bloc.dart';
import 'package:teachme/data/models/form_status.dart';
import 'package:teachme/data/news_model.dart';

import 'news_detail_page.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF1A434E),
          title: const Text(
            "News Page",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 0,
        ),
        backgroundColor: const Color(0xFF1A434E),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            if (state.status == FormStatus.loading) {
              return const CircularProgressIndicator();
            } else if (state.status == FormStatus.success) {
              return ListView(
                children: List.generate(state.news.length, (index) {
                  Article data = state.news[index];
                  return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailPage(article: data),
                          ),
                        );
                      },
                      child: _NewsItem(
                          data: data,
                          size: size,
                          context: context,
                          index: index));
                }),
              );
            } else {
              return Center(child: Text(state.statusText));
            }
          },
        ));
  }

  Widget _NewsItem(
      {required int index,
      required BuildContext context,
      required Article data,
      required Size size}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: size.height * 0.12,
            width: size.width * 0.19,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                data.urlToImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title,
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8),
                Text(
                  data.description,
                  maxLines: 4,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
