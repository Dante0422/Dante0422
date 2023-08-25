import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 718,
          height: 1288,
          child: Stack(
            children: [
              Positioned(
                left: 79,
                top: 570.45,
                child: Text(
                  'Sign In',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w700,
                    height: 1.50,
                    letterSpacing: -0.88,
                  ),
                ),
              ),
              Positioned(
                left: 79,
                top: 647,
                child: Text(
                  'Email',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: -0.46,
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 698.27,
                child: Text(
                  '******',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: -0.46,
                  ),
                ),
              ),
              Positioned(
                left: 97,
                top: 839.27,
                child: Text(
                  '******',
                  style: TextStyle(
                    color: Color(0xFF1E1E1E),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: -0.46,
                  ),
                ),
              ),
              Positioned(
                left: 79,
                top: 787.09,
                child: Text(
                  'Password',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: -0.46,
                  ),
                ),
              ),
              Positioned(
                left: 79,
                top: 1028.27,
                child: Text(
                  'Forgot password',
                  style: TextStyle(
                    color: Color(0xFFFFCD29),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: -0.46,
                  ),
                ),
              ),
              Positioned(
                left: 538,
                top: 1028.27,
                child: Text(
                  'Sign up',
                  style: TextStyle(
                    color: Color(0xFF0D99FF),
                    fontSize: 24,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    height: 1.50,
                    letterSpacing: -0.46,
                  ),
                ),
              ),
              Positioned(
                left: 187,
                top: 251,
                child: Container(
                  width: 325,
                  height: 260,
                  decoration: ShapeDecoration(
                    image: DecorationImage(
                      image:
                          NetworkImage("https://via.placeholder.com/325x260"),
                      fit: BoxFit.cover,
                    ),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 4,
                        strokeAlign: BorderSide.strokeAlignOutside,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x19000000),
                        blurRadius: 6,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x14000000),
                        blurRadius: 2,
                        offset: Offset(0, 0),
                        spreadRadius: 0,
                      ),
                      BoxShadow(
                        color: Color(0x33000000),
                        blurRadius: 0,
                        offset: Offset(0, 0),
                        spreadRadius: 1,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
