import 'package:flutter/material.dart';
import 'package:teachme/data/fake_data.dart';
import 'package:teachme/data/models/study_model.dart';
import 'package:teachme/pages/info/info_page.dart';
import 'package:teachme/widgets/study_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final data = FakeDate.data;
  final TextEditingController _controller = TextEditingController();
  Set<StudyModel> _searchResults = {};

  void _search(String query) {
    Set<StudyModel> results = {};
    if (query.isNotEmpty) {
      results.addAll(
        data
            .where((e) => e.major.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
      results.addAll(
        data
            .where(
                (e) => e.fullName.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
    setState(() {
      _searchResults = results;
    });
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1A434E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: SizedBox(
          height: 50,
          child: TextField(
            style: const TextStyle(color: Colors.white),
            controller: _controller,
            onChanged: _search,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              labelStyle: const TextStyle(color: Colors.white),
              labelText: 'Search',
              prefixIcon:
                  const Icon(Icons.search_outlined, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.white),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.amber),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(color: Colors.amber),
              ),
            ),
          ),
        ),
      ),
      body: ListView(
        children: List.generate(_searchResults.length, (index) {
          StudyModel _data = _searchResults.toList()[index];
          return InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => InfoPage(date: _data)));
                //Info pagega otish
              },
              child: StudyItem(data: _data, size: size));
        }),
      ),
    );
  }
}
