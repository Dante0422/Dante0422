import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Home',
          style: TextStyle(
            color: Color(0xFF0D99FF),
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 1.50,
            letterSpacing: -0.46,
          ),
        ),
        Text(
          'Scan',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 1.50,
            letterSpacing: -0.46,
          ),
        ),
        Text(
          'View Record',
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w700,
            height: 1.50,
            letterSpacing: -0.46,
          ),
        ),
        Container(
          width: 251.54,
          height: 265.70,
          child: Stack(
            children: [
              Positioned(
                left: 32.89,
                top: 72.40,
                child: Container(
                  width: 191.26,
                  height: 149.60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/191x150"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 251.54,
          height: 265.70,
          child: Stack(
            children: [
              Positioned(
                left: 32.89,
                top: 72.40,
                child: Container(
                  width: 191.26,
                  height: 149.60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/191x150"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 251.54,
          height: 265.70,
          child: Stack(
            children: [
              Positioned(
                left: 32.89,
                top: 72.40,
                child: Container(
                  width: 191.26,
                  height: 149.60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/191x150"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 251.54,
          height: 265.70,
          child: Stack(
            children: [
              Positioned(
                left: 32.89,
                top: 72.40,
                child: Container(
                  width: 191.26,
                  height: 149.60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/191x150"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 251.54,
          height: 265.70,
          child: Stack(
            children: [
              Positioned(
                left: 32.89,
                top: 72.40,
                child: Container(
                  width: 191.26,
                  height: 149.60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/191x150"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 457.23,
          height: 674.53,
          child: Stack(
            children: [
              Positioned(
                left: 238.58,
                top: 72.40,
                child: Container(
                  width: 191.26,
                  height: 149.60,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/191x150"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 28.52,
                child: Container(
                  width: 309.85,
                  height: 646.01,
                  child: Stack(children: []),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 684,
          height: 97,
          decoration: ShapeDecoration(
            color: Color(0xFFFCFF74),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(6),
                topRight: Radius.circular(6),
              ),
            ),
          ),
        ),
        Container(
          width: 684,
          height: 131,
          decoration: ShapeDecoration(
            color: Color(0xFF434343),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(6),
                bottomRight: Radius.circular(6),
              ),
            ),
          ),
        ),
        Container(
          width: 66,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 3,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
          ),
        ),
        Container(
          width: 66,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 3,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
          ),
        ),
        Container(
          width: 66,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              side: BorderSide(
                width: 3,
                strokeAlign: BorderSide.strokeAlignCenter,
              ),
            ),
          ),
        ),
        Container(
          width: 571,
          height: 1070,
          decoration: ShapeDecoration(
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
        Container(
          width: 571,
          height: 80,
          decoration: ShapeDecoration(
            color: Color(0xFF00A3FF),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 475,
          height: 55,
          child: Text(
            'Tree Information',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1.50,
              letterSpacing: -0.46,
            ),
          ),
        ),
      ],
    );
  }
}
