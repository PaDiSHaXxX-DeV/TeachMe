import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teachme/blocs/bottom_nav_cubit.dart';
import 'package:teachme/pages/favorite.dart';
import 'package:teachme/pages/home.dart';
import 'package:teachme/pages/news_page.dart';
import 'package:teachme/pages/search_page.dart';
import 'package:teachme/pages/student.dart';

class TabBox extends StatefulWidget {
  const TabBox({super.key});

  @override
  State<TabBox> createState() => _TabBoxState();
}

class _TabBoxState extends State<TabBox> {
  static List<Widget> screens = [];

  @override
  void initState() {
    screens = [
      HomePage(),
      const NewsPage(),
      const SearchPage(),
      const StudentPage(),
      const FavoritePage(),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    int currentIndex = context.watch<TabCubit>().state;

    return Scaffold(
        backgroundColor: const Color(0xFF1A434E),
        body: IndexedStack(
          index: context.watch<TabCubit>().state,
          children: screens,
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
                  onPressed: () {
                    context.read<TabCubit>().changeTabIndex(4);
                  },
                  backgroundColor:
                      currentIndex == 4 ? Colors.orange : Colors.white,
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
                      color: currentIndex == 0 ? Colors.orange : Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TabCubit>().changeTabIndex(1);
                      },
                      icon: const Icon(Icons.add_chart_outlined),
                      color: currentIndex == 1 ? Colors.orange : Colors.black,
                    ),
                    Container(
                      width: size.width * .20,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TabCubit>().changeTabIndex(2);
                      },
                      icon: const Icon(Icons.favorite_border_rounded),
                      color: currentIndex == 2 ? Colors.orange : Colors.black,
                    ),
                    IconButton(
                      onPressed: () {
                        context.read<TabCubit>().changeTabIndex(3);
                      },
                      icon: const Icon(Icons.search_outlined),
                      color: currentIndex == 3 ? Colors.orange : Colors.black,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
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
