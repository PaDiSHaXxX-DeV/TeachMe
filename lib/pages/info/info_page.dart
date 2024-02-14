import 'package:flutter/material.dart';
import 'package:teachme/data/models/study_model.dart';

class InfoPage extends StatelessWidget {
  final StudyModel? date;
  InfoPage({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1A434E),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A434E),
        leading: IconButton(
          color: Colors.white,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
        ),
        title: const Text(
          "Info Page",
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
                height: 244,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    date?.image ??
                        "https://gas-kvas.com/uploads/posts/2023-02/1675426446_gas-kvas-com-p-oboi-na-fonovii-risunok-rabochego-stola-2.jpg",
                    fit: BoxFit.cover,
                  ),
                )),
            Text(
              date?.fullName ?? "apidan null keldi",
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Colors.white),
            ),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.amber),
              child: Text(
                date?.rating ?? "apidan null keldi",
                style: Theme.of(context)
                    .textTheme
                    .displaySmall
                    ?.copyWith(color: Colors.white),
              ),
            ),
            const Divider(
              indent: 20,
              color: Colors.orange,
              endIndent: 20,
            ),
            Text(
              date?.description ?? "apidan null keldi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            const Divider(
              indent: 23,
              color: Colors.orange,
              endIndent: 23,
            ),
            Text(
              date?.major ?? "apidan null keldi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            const Divider(
              indent: 26,
              color: Colors.orange,
              endIndent: 26,
            ),
            Text(
              date?.location ?? "apidan null keldi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.white),
            ),
            const Divider(
              indent: 30,
              color: Colors.orange,
              endIndent: 30,
            ),
            Text(
              date?.number ?? "apidan null keldi",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(color: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}
