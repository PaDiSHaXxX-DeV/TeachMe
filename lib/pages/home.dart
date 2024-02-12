import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teachme/data/fake_data.dart';
import 'package:teachme/pages/auth/sign_in.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                var data = FakeDate.data[index];
                return _studyItem(data: data, size: size);
              }),
            ),
            bottomNavigationBar: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.orange,
                      elevation: 0.1,
                      child: const Icon(Icons.person),
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: () {
                            context.read<TabCubit>().changeTabIndex(0);
                          },
                          icon: const Icon(Icons.home),
                          color:
                          currentIndex == 0 ? Colors.amber : Colors.black,
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<TabCubit>().changeTabIndex(1);
                          },
                          icon: const Icon(Icons.add_chart_outlined),
                          color:
                          currentIndex == 1 ? Colors.amber : Colors.black,
                        ),
                        Container(
                          width: size.width * .20,
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<TabCubit>().changeTabIndex(2);
                          },
                          icon: const Icon(Icons.favorite_border_rounded),
                          color:
                          currentIndex == 2 ? Colors.amber : Colors.black,
                        ),
                        IconButton(
                          onPressed: () {
                            context.read<TabCubit>().changeTabIndex(3);
                          },
                          icon: const Icon(Icons.search_outlined),
                          color:
                          currentIndex == 3 ? Colors.amber : Colors.black,
                        ),
                      ],
                    ),
                  )
                ],
              ),
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
        children: [
          Container(
            height: size.height * 0.19,
            width: size.width * 0.19,
            decoration: const BoxDecoration(
                color: Colors.deepOrange, shape: BoxShape.circle),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(data.image)),
          ),
          const SizedBox(
            width: 30,
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
        ],
      ),
    );
  }
}

class BNBCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * .20, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 20);
    path.arcToPoint(Offset(size.width * .60, 20),
        radius: const Radius.circular(10.0), clockwise: false);

    path.quadraticBezierTo(size.width * .60, 0, size.width * .65, 0);
    path.quadraticBezierTo(size.width * .80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    canvas.drawShadow(path, Colors.black, 5, true);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
