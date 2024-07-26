import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class MyHeader extends StatefulWidget {
  final String textTop;
  final String textBottom;
  final double offset;
  const MyHeader(
      {Key? key,  required this.textTop, required this.textBottom, required this.offset})
      : super(key: key);

  @override
  _MyHeaderState createState() => _MyHeaderState();
}

class _MyHeaderState extends State<MyHeader> {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        padding: EdgeInsets.only(left: 40, top: 50, right: 20),
        height: 350,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Color(0xFF3383CD),
              Color(0xFF11249F),
            ],
          ),
          image: DecorationImage(fit: BoxFit.fill,
            image: AssetImage("assets/jpeg/register.jpeg" , ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            SizedBox(height: 30),
            Expanded(
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 20 - widget.offset / 2,
                    left: 140,
                    child: Text(
                      "${widget.textTop} \n${widget.textBottom}",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Container(), // I dont know why it can't work without container
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0, size.height - 80);
    path.quadraticBezierTo(size.width / 2, size.height, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}