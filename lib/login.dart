import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                _buildLogo(),
                SizedBox(height: 16), // Add some spacing
                _buildSignInForm(),
                _buildForgotPasswordAndSignUpText(),
                SizedBox(height: 16), // Add some spacing
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color(0xFF2E2D2D),
      child: _buildImage("images/durianLogo.png", BoxFit.cover),
    );
  }

  Widget _buildLogo() {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 40), // Adjust vertical padding
      child: _buildImage("images/durianLogo.png", BoxFit.cover,
          width: 120, height: 120), // Adjust width and height
    );
  }

  Widget _buildImage(String imagePath, BoxFit fit,
      {double? width, double? height}) {
    return Image.asset(
      imagePath,
      fit: fit,
      width: width,
      height: height,
    );
  }

  Widget _buildSignInForm() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Sign In',
            style: TextStyle(
              color: Colors.white,
              fontSize: 36,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 1.50,
              letterSpacing: -0.69,
            ),
          ),
          SizedBox(height: 20),
          Text(
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
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Enter your email',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 20),
          Text(
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
          SizedBox(height: 10),
          TextFormField(
            obscureText: true,
            style: TextStyle(color: Colors.black),
            decoration: InputDecoration(
              hintText: 'Enter your password',
              border: OutlineInputBorder(),
              filled: true,
              fillColor: Colors.white,
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _buildForgotPasswordAndSignUpText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Text(
            'Forgot password',
            style: TextStyle(
              color: Color(0xFFFFCD29),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: 20),
        TextButton(
          onPressed: () {},
          child: Text(
            'Sign up',
            style: TextStyle(
              color: Color(0xFF0D99FF),
              fontSize: 20,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
