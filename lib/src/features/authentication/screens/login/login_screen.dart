import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:to_yudi/src/features/authentication/screens/register/register_screen.dart';
import 'package:to_yudi/src/constants/image_strings.dart';
import 'package:to_yudi/src/constants/sizes.dart';
import 'package:to_yudi/src/constants/text_strings.dart';
import 'package:to_yudi/src/constants/colors.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  Future<void> _login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      );

      if (userCredential.user != null) {
        if (userCredential.user!.email == 'admin1@gmail.com') {
          Navigator.pushReplacementNamed(context, '/admin_dashboard');
        } else if (userCredential.user!.email == 'user1@gmail.com') {
          Navigator.pushReplacementNamed(context, '/user_dashboard');
        } else {
          Navigator.pushReplacementNamed(context, '/user_dashboard');
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              SizedBox(
                height: screenHeight * 0.3,
                width: double.infinity,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      tLoginImage,
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFF000000),
                            Color(0xB3000000),
                            Color.fromRGBO(0, 0, 0, 0.1),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      height: 70,
                      child: Container(
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              tTertiaryColor,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [tTertiaryColor, tSecondaryColor],
                    ),
                  ),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: EdgeInsets.all(tDefaultSize),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tLogin,
                            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.08,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Form(
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: tFormHeight - 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextFormField(
                                    controller: _emailController,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person_outline_outlined,
                                        color: tWhiteColor,
                                      ),
                                      labelText: tEmail,
                                      hintText: tEmail,
                                      labelStyle: TextStyle(color: Colors.grey[300]),
                                      hintStyle: TextStyle(color: Colors.grey[300]),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[300]!),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[300]!),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: tFormHeight),
                                  TextFormField(
                                    controller: _passwordController,
                                    obscureText: _obscurePassword,
                                    style: TextStyle(color: Colors.white),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.fingerprint,
                                        color: tWhiteColor,
                                      ),
                                      labelText: tPassword,
                                      hintText: tPassword,
                                      labelStyle: TextStyle(color: Colors.grey[300]),
                                      hintStyle: TextStyle(color: Colors.grey[300]),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[300]!),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.grey[300]!),
                                      ),
                                      suffixIcon: IconButton(
                                        icon: Icon(
                                          _obscurePassword
                                              ? Icons.visibility_off
                                              : Icons.visibility,
                                          color: tWhiteColor,
                                        ),
                                        onPressed: () {
                                          setState(() {
                                            _obscurePassword = !_obscurePassword;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 40),
                                  Center(
                                    child: SizedBox(
                                      width: screenWidth * 0.4,
                                      child: ElevatedButton(
                                        onPressed: _login,
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(100, 50),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8),
                                          ),
                                          padding: EdgeInsets.symmetric(horizontal: 20),
                                          backgroundColor: tPrimaryColor,
                                        ),
                                        child: Text(
                                          tLogin.toUpperCase(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 16,
                                            color: tBlackColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 110),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ),
                                  Text(
                                    "Or Login With",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                    ),
                                  ),
                                  const Expanded(
                                    child: Divider(
                                      color: Colors.white,
                                      thickness: 1,
                                      indent: 20,
                                      endIndent: 20,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 20),
                              Center(
                                child: Image.asset(
                                  "assets/images/google-icon.png",
                                  width: screenWidth * 0.12,
                                  height: screenWidth * 0.12,
                                ),
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    PageRouteBuilder(
                                      pageBuilder: (context, animation, secondaryAnimation) =>
                                          RegisterScreen(),
                                      transitionsBuilder:
                                          (context, animation, secondaryAnimation, child) {
                                        final Tween<double> opacityTween =
                                            Tween(begin: 0.0, end: 1.0);
                                        final CurvedAnimation curvedAnimation = CurvedAnimation(
                                          parent: animation,
                                          curve: Curves.easeInOut,
                                        );
                                        return FadeTransition(
                                          opacity: opacityTween.animate(curvedAnimation),
                                          child: child,
                                        );
                                      },
                                      transitionDuration: Duration(milliseconds: 800),
                                    ),
                                  );
                                },
                                child: Text.rich(
                                  TextSpan(
                                    text: tDontHaveAccount,
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                    children: const [
                                      TextSpan(text: ' '),
                                      TextSpan(
                                        text: tSignUp,
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            top: 20,
            right: 20,
            child: Image.asset(
              "assets/images/yudi-logo.png",
              width: screenWidth * 0.2,
              height: screenWidth * 0.2,
            ),
          ),
        ],
      ),
    );
  }
}
