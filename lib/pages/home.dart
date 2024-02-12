import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:teachme/pages/auth/sign_in.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final Box _boxLogin = Hive.box("login");

    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
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
        title: const Text("Home Page"),
        elevation: 0,
      ),
      backgroundColor: const Color(0xFF1A434E),
      body: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter: BNBCustomePainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      onPressed: () {},
                      backgroundColor: Colors.orange,
                      child: Icon(Icons.person),
                      elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(onPressed: () {}, icon: Icon(Icons.home)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite_border_rounded)),
                        Container(
                          width: size.width * .20,
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.bookmark)),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.notifications)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class BNBCustomePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width * .20, 0, size.width * .35, 0);
    path.quadraticBezierTo(size.width * .40, 0, size.width * .40, 20);
    path.arcToPoint(Offset(size.width * .60, 20),
        radius: Radius.circular(10.0), clockwise: false);

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
